AddCSLuaFile()

ENT.Type             = "anim"
ENT.PrintName            = "Virus"
ENT.Spawnable       = true
ENT.Category =      "Toybox Classics"
ENT.RenderGroup         = RENDERGROUP_TRANSLUCENT

local Width = 64

function ENT:Initialize()

    self.Entity:DrawShadow( false )
    self.Entity:SetMoveType(MOVETYPE_NONE)
    self.Entity:SetSolid(SOLID_BBOX)
        
    if ( SERVER ) then
    
        self:SetHealth( 10 );
        
        // We're not using a model, but we set one bigger than our collision bounds
        // so that they work properly !
        self.Entity:SetModel( "models/props_junk/TrashDumpster02.mdl" )

    
        // Don't use the model's physics - create a sphere instead
        //self.Entity:PhysicsInitSphere( 16, "flesh" )
        
        // Set collision bounds exactly
    
    else
            
        self.Material = Material( "sprites/cloud/virus_main" )
        
        
        self.HitNormal = self:GetAngles():Forward() + VectorRand() * 0.001
        
        local lcolor = render.GetLightColor( self:GetPos() ) * math.Rand( 1.3, 1.8 )
        
        self.Color = Color( math.Rand( 150, 150 )*lcolor.x, math.Rand( 200, 250 )*lcolor.y, 150*lcolor.z, 255 )
        
        self.Rot = math.Rand( 0, 360 )
        self.scale = math.Rand( 1.1, 1.5 )
        self.offs = 0 //math.Rand( 0, 10 )
        
        self.Entity:SetRenderBounds( Vector( -0.1, Width * -1, Width * -1 ), Vector( 0.1, Width, Width ) )
        
        self.Blinking = Material( "sprites/cloud/virus_blink" )
        self.NextBlink = CurTime() + math.Rand( 1, 30 )
        self.EndBlink = self.NextBlink + math.Rand( 0.5, 1 )
        
        self.Sad = Material( "sprites/cloud/virus_sad" )
        self.EndSad = 0
    
    end
    
    self.NextThinkTime = CurTime() + math.Rand( 0, 1 )
    self.Random = math.Rand( 0, 1 )
    
    local mn, mx
    
    if ( self.Entity.GetRotatedAABB == nil ) then
    
        local Forward = self.Entity:GetForward()
        
        if ( Forward.x < 0 ) then Forward.x = Forward.x * -1; end
        if ( Forward.y < 0 ) then Forward.y = Forward.y * -1; end
        if ( Forward.z < 0 ) then Forward.z = Forward.z * -1; end

        mn = Vector( Width, Width, Width ) - (Forward * (Width-0.1));
        mx = mn * -0.1
    
    else
    
        mn, mx = self.Entity:GetRotatedAABB( Vector( -0.1, Width * -1, Width * -1 ), Vector( 0.1, Width, Width ) )
        
    end
    
    self.Entity:SetCollisionBounds( mn * 0.5, mx * 0.5 )
    
end

function ENT:ImpactTrace( tr, iType, strImpact )

    self.EndSad = CurTime() + math.Rand( 0.5, 2.0 )
    
    //PrintTable( tr )
    return true

end

if ( SERVER ) then


function ENT:Think()

    if ( self.NextThinkTime > CurTime() ) then return end
    if ( self.Dying ) then return end

    
    local Ents = ents.FindByClass( self.ClassName )
    local NumEnts = #Ents;
    if ( NumEnts > 1500 ) then
    
        self.NextThinkTime = CurTime() + math.Rand( 2, 30 )
        return 
    end
    
    local FractionEnt = NumEnts / 700;
    self.NextThinkTime = CurTime() + math.Rand( 0, 1 ) * FractionEnt
        
    // Get a random direction on our plane
    local Dir = Angle( math.Rand( 0, 360 ), math.Rand( 0, 360 ), math.Rand( 0, 360 ) )
    
    // Find our end position
    local vecEndPoint = self:GetPos() + Dir:Forward() * math.Rand( Width*1.0, Width*1.5 )
    
    // Trace a line from us, to our end point
    local trace = {
                    start = self:GetPos(),
                    endpos = vecEndPoint,
                    filter = self
                  }
                  
    local tr = util.TraceLine( trace ) 
    
    // If we hit something, forget it, we need our space!
    if ( tr.Hit ) then return end
    
    local bGrippable = false;
    
    if ( self:IsGrippableSurfaceInDir( vecEndPoint, Vector( 1, 0, 0 ) ) ||
         self:IsGrippableSurfaceInDir( vecEndPoint, Vector( 0, 1, 0 ) ) ||
         self:IsGrippableSurfaceInDir( vecEndPoint, Vector( 0, 0, 1 ) ) ) then
    
        // Make sure we're going to be spawned next to a surface
        
        local ent = ents.Create( self.ClassName )
            ent:SetPos( self.SurfacePos + self.SurfaceNormal * 2 )
            ent:SetAngles( self.SurfaceNormal:GetNormal():Angle() )
        ent:Spawn()
        ent:Activate()
        
        self.NextThinkTime = CurTime() + 2 * FractionEnt
        
    else
    
        self.NextThinkTime = CurTime() + 0.1 * FractionEnt
    
    end

end

end

function ENT:IsGrippableSurfaceInDir( pos, dir )

    local trace = {
                    start = pos,
                    endpos = pos + dir * Width * 0.5,
                    filter = self
                  }
                  
    local tr = util.TraceLine( trace )
    self.SurfaceNormal = tr.HitNormal
    self.SurfacePos = tr.HitPos

    if ( !tr.HitSky && tr.HitWorld && tr.Fraction > 0.5 ) then return true end
    
    trace.endpos = pos + dir * -10
    local tr = util.TraceLine( trace )
    self.SurfaceNormal = tr.HitNormal
    self.SurfacePos = tr.HitPos
    if ( !tr.HitSky && tr.HitWorld && tr.Fraction > 0.5 ) then return true end
    
    return false

end

/*---------------------------------------------------------
   Name: OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )

    if ( SERVER ) then
    
        local dmg = dmginfo:GetDamage()
        local health = self:Health() - dmg
        
        if ( health < 0 ) then
            self.Dying = true
            timer.Simple( 0.05, function() if ( !IsValid( self ) ) then return end self:Remove() end )
        else
            self:SetHealth( health )
        end
        
    
    end
    
    return true
    
end

/*---------------------------------------------------------
   Name: DrawPre
---------------------------------------------------------*/
function ENT:Draw()
    
    if ( self.EndSad > CurTime() ) then
    
    render.SetMaterial( self.Sad )
    
    elseif ( self.NextBlink < CurTime() ) then

        render.SetMaterial( self.Blinking )

        if ( self.EndBlink < CurTime() ) then
        
            self.NextBlink = CurTime() + math.Rand( 20, 60 )
            self.EndBlink = self.NextBlink + math.Rand( 0.5, 1 )
        
        end
        
    else
            render.SetMaterial( self.Material )
    end
        
    
    //render.DrawSprite( self:GetPos(), 16, 16,  )
    
    render.DrawQuadEasy( self:GetPos() + self.HitNormal*self.offs, self.HitNormal, Width * self.scale, Width * self.scale, self.Color, self.Rot )
    
end

// This is the spawn function. It's called when a client calls the entity to be spawned.
// If you want to make your SENT spawnable you need one of these functions to properly create the entity
//
// ply is the name of the player that is spawning it
// tr is the trace from the player's eyes 
//
function ENT:SpawnFunction( ply, tr )

    if ( !tr.Hit ) then return end
    
    local SpawnPos = tr.HitPos + tr.HitNormal * 4
    
    local ent = ents.Create( ClassName )
        ent.ClassName = ClassName
        ent:SetPos( SpawnPos )
        ent:SetAngles( tr.HitNormal:GetNormal():Angle() )
    ent:Spawn()
    ent:Activate()
    
    return ent
    
end