AddCSLuaFile()

ENT.Type            = "anim"
ENT.Spawnable        = true
ENT.Category = "Toybox Classics"

--ENT.PrintName        = "Boot"
ENT.PrintName = "Nom Chunk"
ENT.Author            = "Edek"
ENT.Instructions     = "Press e to eat it."

function ENT:Initialize()

    if ( SERVER ) then
        
        self:SetModel( "models/props_c17/FurnitureDrawer001a_Shard01.mdl" )
        
    self:PhysicsInit( SOLID_VPHYSICS )
        
    local phys = self.Entity:GetPhysicsObject()
    
    if (phys:IsValid()) then
    phys:Wake()
    end
            
    end
    
end

function ENT:SpawnFunction( ply, tr )

    if ( !tr.Hit ) then return end
    
    local SpawnPos = tr.HitPos + tr.HitNormal * 16
    
    local ent = ents.Create( self.Classname )
    ent:SetPos( SpawnPos )
    
    ent:Spawn(1)
    ent:Activate()  
    
    return ent
    
end


function ENT:Use( activator, caller )

    self.Entity:Remove()
    
    if ( activator:IsPlayer() ) then
    
    local health = activator:Health()
    activator:SetHealth( health - 9999999 )
        
        activator:EmitSound( "npc/barnacle/barnacle_gulp1.wav", 100, 100)        
    end

    end