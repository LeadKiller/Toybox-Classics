AddCSLuaFile()

ENT.Type   = "anim"
ENT.PrintName           = "Radar (made by Black Tea(rebel1324)"

ENT.Spawnable = true
ENT.Category = "Toybox Classics"

if CLIENT then
    
    
    local t = CurTime()
    local g = 0
    local p = 0
    local a = 255
    local m = 50
    local ds = 5
    local msr = 2000
    local ut = {}
    local rp = { x = 70, y = 50}
    local lt = 0.5
    local spd = 3
    
    function ENT:Draw()
    self.Entity:DrawModel()
    

     local pos, ang = self:GetPos(), self:GetAngles()
    local wide, tall = 140, 100
    pos=pos+self:GetRight()*14
    pos=pos+self:GetForward()*10
    pos=pos+self:GetUp()*55
    
    ang:RotateAroundAxis(ang:Up(), 90)
    ang:RotateAroundAxis(ang:Forward(), 90)
    
    if LocalPlayer():GetPos():Distance( self:GetPos() ) > 800 then return end
    cam.Start3D2D(pos, ang, 0.20)
    
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,wide,tall)

 
    spd = math.Clamp( spd, 3, 8 )
    p = math.Clamp( Lerp( 0.1, p, p+spd ), 0, 100 )
    
    g = m / 100 * p
    
    if p > 50 then
    a = math.Clamp( Lerp( 0.45, a, a - spd / 0.8 ), 0, 255 )
    end
    
    if p < 1 then
    a = 255
    ut = {}
    end
    if a == 0 then
    self:EmitSound( "HL1/fvox/fuzz.wav" )
    p = 0
    end
    
    local unit = ents.FindInSphere( self:GetPos(), msr )
    
    surface.DrawCircle( rp.x, rp.y, g, Color( 255,255,255,a ) )
    surface.DrawCircle( rp.x, rp.y, m, Color( 255,200,200,255 ) )
    
    surface.SetDrawColor( 255, 200, 200, 100 )
    surface.DrawLine( rp.x, rp.y, rp.x, rp.y - m )
    
    
    for _, u in pairs( unit ) do
    if u:IsNPC() or u:IsPlayer() then
        
        if not u:IsValid() then continue end
        if u == self then continue end
        if p < 1 then
        u.rsc = false
        end
        
        local df = self:GetPos() - u:GetPos()
        local duva = msr / m
        local gc = { x = df.x / duva, y = df.y / duva }
        local gs = math.sqrt( gc.x*gc.x + gc.y*gc.y )
        local py = math.rad( math.deg( math.atan2( gc.x, gc.y ) ) - 180 + self:GetAngles().y ) 
        local go = { x= math.cos( py ) * gs, y= math.sin( py ) * gs }
        local dist = self:GetPos():Distance( u:GetPos() )
        
        local drx, dry = rp.x - ds/2 + go.x, rp.y - ds/2 + go.y
        
        if ( msr / 100 * p ) > dist then 
        if !u.rsc then
            self:EmitSound( "buttons/button16.wav" )
            
            local col = Color( 0,255,0,255 )
            
            if u:IsNPC() then
            col = Color( 255,50,0,255 )
            end
            
            table.insert( ut, { drx, dry, CurTime() + lt, col } )
            u.rsc = true
        end
        end
            
    end
    
    end
    
    for _, data in pairs( ut ) do
    
        if data[3] > CurTime() then
            draw.RoundedBox( 0, data[1], data[2], ds, ds, Color( data[4].r, data[4].g, data[4].b, 255 * math.Clamp( data[3] - CurTime(), 0, lt ) ) )
        end
    end
        
    cam.End3D2D()
end
end

function ENT:Initialize()

    self.Entity:SetModel("models/props_wasteland/gaspump001a.mdl")
    self.Entity:PhysicsInit(SOLID_VPHYSICS)
    self.Entity:SetMoveType(MOVETYPE_NONE)
    self.Entity:SetSolid(SOLID_VPHYSICS)
    self.Entity:DrawShadow(false)
    
end

function ENT:SpawnFunction( ply, tr )

    if ( !tr.Hit ) then return end
    
    local SpawnPos = tr.HitPos + tr.HitNormal * 10
    
    local ent = ents.Create( ClassName )
        ent:SetPos( SpawnPos )
    ent:Spawn()
    ent:Activate()
    
    return ent
    
end