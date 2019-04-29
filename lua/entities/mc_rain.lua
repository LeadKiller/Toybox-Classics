AddCSLuaFile()

ENT.Type            = "anim"
ENT.PrintName       = "Rain"
ENT.Author          = "Dj Lukis.LT"
ENT.Information        = "Makes it always rain around you"
ENT.Category        = "Toybox Classics"

ENT.Spawnable        = true
ENT.AdminSpawnable    = false

function ENT:UpdatePos()

    if (self == NULL) or (self:GetOwner() == NULL) then return false end

    self:SetPos( self:GetOwner():GetPos() + Vector( 0, 0, -50 ) )

end

function ENT:SpawnFunction( ply, tr )

        for k, v in pairs ( ents.FindByClass( "mc_rain" ) ) do    // We only need 1 entitie for the weather
            if ( v:IsValid() && v:GetOwner() == ply ) then
                v:Remove()
            end
        end

        for k, v in pairs ( ents.FindByClass( "mc_snow" ) ) do    // And we dont want diffrent weather to overlap
            if ( v:IsValid() && v:GetOwner() == ply ) then
                v:Remove()
            end
        end

        local ent = ents.Create( ClassName or "mc_rain" )
            ent:SetPos( ply:GetPos() )
            ent:SetOwner( ply ) 
            ent:Spawn()
            ent:Activate()
            ent:SetName( "mc_rain" )
            ent:SetModel( "models/MCModelPack/entities/weather.mdl" )
            ent:UpdatePos()

        return ent

end

function ENT:Initialize()

end


function ENT:Think()

    self:NextThink( CurTime() + 0.01 ) // Not sure about the frequency :/
    self:UpdatePos()
    return true

end