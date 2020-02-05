AddCSLuaFile()

SWEP.PrintName            = "Minecraft bow"            
SWEP.Slot                = 3
SWEP.SlotPos            = 1
SWEP.DrawAmmo            = false
SWEP.DrawCrosshair        = true
SWEP.Weight                = 5
SWEP.AutoSwitchTo        = false
SWEP.AutoSwitchFrom        = false
SWEP.Author            = ""
SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.Instructions    = "Left-Click to shoot arrows"
SWEP.ViewModel            = "models/weapons/v_minebow.mdl"
SWEP.WorldModel            = "models/w_minebow/w_minebow.mdl"
SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic        = false
SWEP.Primary.Ammo            = "none"
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic    = false
SWEP.Secondary.Ammo            = "none"
SWEP.ShootSound = "weapons/minebow/Bowfire.wav"
SWEP.DELAY = CurTime()

SWEP.Spawnable = true
SWEP.Category = "Toybox Classics"

/*---------------------------------------------------------
    Reload does nothing
---------------------------------------------------------*/
function SWEP:Reload()
end

/*---------------------------------------------------------
   Think does nothing
---------------------------------------------------------*/
function SWEP:Think()    
end


/*---------------------------------------------------------
    PrimaryAttack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
    
    if self.DELAY > CurTime() then return end
    
        self.DELAY = CurTime() + 1
        
    self:EmitSound( self.ShootSound )

    if CLIENT then return end
    
    local arrow = ents.Create( "minecraft_arrow" )
    arrow:SetPos( self:GetOwner():GetShootPos() )
    arrow:Spawn()
    arrow:SetAngles( self:GetOwner():EyeAngles() + Angle(180,0,0) )
    arrow:SetPhysicsAttacker( self:GetOwner() )
    arrow.OWNER = self:GetOwner()
    arrow:SetOwner(self:GetOwner())
    
    local ap = arrow:GetPhysicsObject()
    
    if ap and ap:IsValid() then ap:SetVelocity( self:GetOwner():GetAimVector() * 13000 ) end
    
end

/*---------------------------------------------------------
    SecondaryAttack
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
end


/*---------------------------------------------------------
   Name: ShouldDropOnDie
   Desc: Should this weapon be dropped when its owner dies?
---------------------------------------------------------*/
function SWEP:ShouldDropOnDie()
    return false
end

/*

ARROW ENTITY BELOW

*/

local ARROW = {}

ARROW.Type = "anim"
ARROW.Base = "base_anim"

if SERVER then
    
    function ARROW:Initialize()
        
        self:SetModel( "models/arrow/arrow.mdl" )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:GetPhysicsObject():SetMass(1)
        self.Trail = util.SpriteTrail(self.Entity, 0, Color(255,255,255), false, 4, 0, 0.2, 1/(4)*0.5, "trails/smoke.vmt")
        self.Hit = false
        
    end
    
    function ARROW:PhysicsSimulate( phys, deltatime )
        
        return angle_zero, vector_origin, SIM_LOCAL_ACCELERATION
        
    end 
    
    function ARROW:PhysicsCollide(data, physobj)
        
        if !self.Hit then
        if data.HitEntity == self.OWNER then return end
        if data.HitEntity:GetClass() == "minecraft_arrow" then self:Remove() return end
        
            self:EmitSound("weapons/minebow/impact.wav")
            
            self.Hit = true
            self.Trail:Remove()
            
            if data.HitEntity:GetClass() != "worldspawn" then 
                
                self:SetPos( data.HitPos )
                data.HitEntity:TakeDamage(math.random(10,30))
                self:SetParent( data.HitEntity ) 
                
            else
                
                timer.Simple(0, function() self:SetMoveType( MOVETYPE_NOCLIP ) self:SetPos( self:GetPos() - self:GetAngles():Forward()*10 ) end)
                
            end
            
            if data.HitEntity:IsNPC() or data.HitEntity:IsPlayer() then
                
                timer.Simple(.2, function() if IsValid(data.HitEntity) and data.HitEntity:Health() <= 0 then self:Remove() end end)
                
            end
            
            timer.Simple(20, function() if self and self:IsValid() then self:Remove() end end)
            
        end
        
    end
    
end

scripted_ents.Register( ARROW, "minecraft_arrow", true )
 
 