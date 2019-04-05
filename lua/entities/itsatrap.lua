AddCSLuaFile()

ENT.Type   = "anim"

ENT.PrintName           = "Its a trap!"

ENT.Information        = "Its a trap!"

ENT.Spawnable = true
ENT.Category = "Toybox Classics"

//variables
ENT.Trap = NULL
ENT.Rigged = false
ENT.Off = false

    function ENT:Initialize()
        if CLIENT then return end
        self:SetModel("models/props_junk/sawblade001a.mdl")
         
        self:PhysicsInit(SOLID_VPHYSICS)
        
        self:SetMoveType(MOVETYPE_VPHYSICS)
        
        self:GetPhysicsObject():Wake()
        
        self.Trap = ents.Create("prop_physics")
        self.Trap:SetModel("models/props_junk/TrashDumpster02.mdl")
        self.Trap:Spawn()
        self.Trap:Activate()
        self.Trap:SetPos(self:GetPos() + Vector(0,0,50))
        self.Trap:SetAngles(self:GetAngles() + Angle(0,0,180))
        self.Trap:SetNotSolid(true)
        self.Trap:SetRenderMode(RENDERMODE_TRANSCOLOR)
        self.Trap:SetColor(Color(255,255,255,75))
        self.Trap:SetParent(self)
        self.Trap:DrawShadow(false)
        
    end

    function ENT:SpawnFunction( ply, tr )

        if ( !tr.Hit ) then return end
        
        local SpawnPos = tr.HitPos + tr.HitNormal * 64
        
        local ent = ents.Create( ClassName )
            ent:SetPos( SpawnPos )
        ent:Spawn()
        ent:Activate()
        
        return ent
        
    end
    
    function ENT:Use()
        if self.Off or self.Rigged then return end
        self.Rigged = true
        
        self.Trap:SetColor(Color(255,255,255,255))
        self.Trap:SetNoDraw(true)
        self:SetColor(Color(255,255,255,150))
    end
    
    function ENT:StartTouch(other)
        if self.Off or !self.Rigged then return end
        if other:IsNPC() or other:IsPlayer() or IsValid(other:GetPhysicsObject()) then
            self:GoOff()
        end
    end
    
    function ENT:OnTakeDamage(dmg)
        if self.Off or !self.Rigged then return end
        if dmg:GetDamage() > 5 then
            self:GoOff()
        end
    end
     
    function ENT:GoOff()
        self.Rigged = false
        self.Off = true
        self.Trap:SetColor(Color(255,255,255,255))
        self.Trap:SetNoDraw(false)
        self.Trap:SetNotSolid(false)
        self.Trap:GetPhysicsObject():EnableMotion(false)
        self.Trap:SetParent()
        self.Trap:SetPos(self:GetPos() + Vector(0,0,50))
        self.Trap:SetAngles(self:GetAngles() + Angle(0,0,180))
        self.Trap:SetMaterial("models/props_interiors/metalfence007a")
        
        self:EmitSound(Sound("ambient/levels/citadel/pod_close1.wav"))
        
        local effectdata = EffectData()
        effectdata:SetStart( self:GetPos() )
        effectdata:SetOrigin( self:GetPos() )
        effectdata:SetEntity(self.Trap)
        effectdata:SetScale( 1 )
        util.Effect( "entity_remove", effectdata )    
    end
    
    function ENT:OnRemove()
        if self.Trap and SERVER then
            self.Trap:Remove()
        end
    end
