AddCSLuaFile()

SWEP.Category = "Toybox Classics"
SWEP.Spawnable = true

SWEP.PrintName            = "Supply Canister Launcher"            
SWEP.Slot                = 4
SWEP.SlotPos            = 3
SWEP.DrawAmmo            = false
SWEP.DrawCrosshair        = false
SWEP.Weight                = 5
SWEP.AutoSwitchTo        = true
SWEP.AutoSwitchFrom        = true
SWEP.Author            = "Jimbomcb, modded by Munchroom"
SWEP.Contact        = ""
SWEP.Purpose        = "Drop weapons when required"
SWEP.Instructions    = "Left click to request a supply drop at where your looking. Requires a path to the sky. Type 'request <weapon_name>' without the quotes to select a weapon."
SWEP.ViewModel            = "models/weapons/c_pistol.mdl"
SWEP.UseHands               = true
SWEP.WorldModel            = "models/weapons/w_pistol.mdl"
SWEP.Primary.ClipSize        = 1
SWEP.Primary.DefaultClip    = 1
SWEP.Primary.Automatic        = false
SWEP.Primary.Ammo            = "AR2AltFire"
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic    = false
SWEP.Secondary.Ammo            = "none"

function SWEP:DrawWorldModel()
    self:DrawModel()
end

function SWEP:Initialize()
    quantity = 1
    weapontable = {"weapon_smg1","weapon_ar2","weapon_rpg","weapon_crossbow","weapon_physcannon","weapon_pistol","weapon_357","weapon_frag","weapon_shotgun","item_healthkit","item_battery"}
    spawnweapon = weapontable[math.random(1,11)]
    allowspawn = 1
    if CLIENT then
        self.Owner:ChatPrint("Hello commander, we're ready to send supplies. Type 'request <entity name here>' in chat. examples: 'request weapon_ar2' or 'request item_healthkit'. We can also send explosives if you type 'request explosives'.")
    end
end

--'splosives effect
if (CLIENT) then
    --Explosion effects
    local EFFECT={} 
    function EFFECT:Init( data )
        local start = data:GetOrigin()
        local em = ParticleEmitter( start )
        for i=1, 256 do
            local part = em:Add("particle/particle_noisesphere", start ) --Shockwave
            if part then
                part:SetColor(255,255,195,255)
                part:SetVelocity(Vector(math.random(-10,10),math.random(-10,10),0):GetNormal() * math.random(1500,2000))
                part:SetDieTime(math.random(2,3))
                part:SetLifeTime(math.random(0.3,0.5))
                part:SetStartSize(60)
                part:SetEndSize(60)
                part:SetAirResistance(140)
                part:SetRollDelta(math.random(-2,2))
                
            end
            local part1 = em:Add("effects/fire_cloud1", start ) --Fire cloud
            if part1 then
                part1:SetColor(255,255,255,255)
                part1:SetVelocity(Vector(math.random(-10,10),math.random(-10,10),math.random(5,20)):GetNormal() * math.random(100,2000))
                part1:SetDieTime(math.random(2,3))
                part1:SetLifeTime(math.random(0.3,0.5))
                part1:SetStartSize(80)
                part1:SetEndSize(50)
                part1:SetAirResistance(200)
                part1:SetRollDelta(math.random(-2,2))
            end
        end
        em:Finish()
    end
    function EFFECT:Think()
    end
    function EFFECT:Render() 
    end
    effects.Register(EFFECT,"poof") 
end



function ISaid( ply, text, team )
    local sep = string.Explode(" ",text)
    
    if string.lower(sep[1]) == "request" then --if the player says "request " first, and not explosives second, continue
        
        print( "request accepted" )
        
        if tonumber(string.lower(sep[2]))==nil then
            spawnweapon = string.lower(sep[2])
            allowspawn = 1
            quantity = 1
        end
        if not tonumber(string.lower(sep[2]))==nil then
            spawnweapon = string.lower(sep[3])
            allowspawn = 1
            quantity = tonumber(string.lower(sep[2]))
        end
    end
    
    if string.lower(text) == "request explosives" then
        allowspawn = 0
        
        print( "explosives armed!" )
    end
    
    if string.lower(text) == "request insertion" then
        allowspawn = 0
        print( "preparing insertion" )
        customspawn = 1
        
    end
    
    if string.lower(text) == "cancel insertion" then
        allowspawn = 0
        print ("insertion canceled")
        customspawn = 0
    end
    
    
end
hook.Add( "PlayerSay", "ISaid", ISaid );

local ShootSoundFire = Sound( "Airboat.FireGunHeavy" )
local ShootSoundFail = Sound( "WallHealth.Deny" )
local YawIncrement = 20
local PitchIncrement = 10

if CLIENT then
    language.Add ("Undone_CrabLaunch", "Undone Supply Canister.")
end


function SWEP:PrimaryAttack(bSecondary)
    local tr = self.Owner:GetEyeTrace()
    self:ShootEffects(self)
    
    if (SERVER) then 
        local aBaseAngle = tr.HitNormal:Angle()
        local aBasePos = tr.HitPos
        local bScanning = true
        local iPitch = 10
        local iYaw = -180
        local iLoopLimit = 0
        local iProcessedTotal = 0
        local tValidHits = {} 
        
        while (bScanning == true && iLoopLimit < 500) do
            iYaw = iYaw + YawIncrement
            iProcessedTotal = iProcessedTotal + 1        
            if (iYaw >= 180) then
                iYaw = -180
                iPitch = iPitch - PitchIncrement
            end
            
            local tLoop = util.QuickTrace( aBasePos, (aBaseAngle+Angle(iPitch,iYaw,0)):Forward()*40000 )
            if (tLoop.HitSky || bSecondary) then 
                table.insert(tValidHits,tLoop) 
            end
            
            if (iPitch <= -80) then
                bScanning = false
            end
            iLoopLimit = iLoopLimit + 1
        end
        
        local iHits = table.Count(tValidHits)
        if (iHits > 0) then
            local iRand = math.random(1,iHits) 
            local tRand = tValidHits[iRand]             
            --Canister Spawn
            ent = ents.Create( "env_headcrabcanister" )
            ent:SetPos( aBasePos )
            ent:SetAngles( (tRand.HitPos-tRand.StartPos):Angle() )
            ent:SetKeyValue( "HeadcrabType", 0 )
            ent:SetKeyValue( "HeadcrabCount", 0 )
            ent:SetKeyValue( "FlightSpeed", 4500 )
            ent:SetKeyValue( "FlightTime", 5 )
            if allowspawn == 1 then
                ent:SetKeyValue( "Damage", math.random(25,75) )
                ent:SetKeyValue( "DamageRadius", 50 )
            end
            if allowspawn == 0 then
                ent:SetKeyValue( "Damage", math.random(300,900) )
                ent:SetKeyValue( "DamageRadius", 500)
            end
            
            
            ent:SetKeyValue( "SmokeLifetime", 30 )
            ent:SetKeyValue( "StartingHeight",  0 )
            local iSpawnFlags = 8192
            if (bSecondary) then iSpawnFlags = iSpawnFlags + 4096 end //If Secondary, spawn impacted.
            ent:SetKeyValue( "spawnflags", iSpawnFlags )
            
            ent:Spawn()
            
            ent:Input("FireCanister", self.Owner, self.Owner)
            
            
            if allowspawn == 0 and ent:IsValid() then
                timer.Create( "'splode"..tostring(ent:EntIndex()), 5.25, 1, function() Poof(ent) end )
                
            elseif allowspawn == 1 and ent:IsValid() then
                timer.Create( "eject"..tostring(ent:EntIndex()), 5.5, 1, function() SpawnDrop(ent) end )
                undo.Create("CrabLaunch")
                undo.AddEntity( ent )
                undo.SetPlayer( self.Owner )
                undo.AddFunction(function()
                        if timer.Exists("eject"..tostring(ent:EntIndex())) == true then
                            timer.Remove("eject"..tostring(ent:EntIndex()))
                        end
                        if timer.Exists("'splode"..tostring(ent:EntIndex())) == true then
                            timer.Remove("'splode"..tostring(ent:EntIndex()))
                        end
                    end)
                undo.Finish()
            end
            
            
            
            
            self.Owner:ChatPrint("Sending "..spawnweapon)
            
            
            self:EmitSound( ShootSoundFire )
        else
            self:EmitSound( ShootSoundFail )
            self.Owner:ChatPrint("No trajectories found, we need an opening to fire the canister.")
        end
        tLoop = nil
        tValidHits = nil
        
        
        
    end
    
    
end

function Poof( ent )
    if !IsValid(ent) then return end

    local d = EffectData()
    d:SetOrigin( ent:GetPos() )
    d:SetScale( 3 )
    
    util.Effect("poof", d )
    
    ent:Remove()
    
end

--Weapon Spawn Function


function SpawnDrop( can )
    local att
    
    
    
    --headcrab = can:LookupAttachment( "headcrab" )
    
    
    
    att = can:GetAttachment(can:LookupAttachment( "headcrab" ))        
    
    ang = att.Ang
    local pos = att.Pos + ang:Forward()*45
    
    for i=1,quantity do
        local gun = ents.Create( spawnweapon )
        gun:SetPos( pos )
        gun:SetAngles( ang )
        gun:Spawn( )
        local droptrace = util.QuickTrace( pos, pos-Vector(0,0,100), {can, gun} )
        if string.Explode("_",spawnweapon)[1]=="npc" then
            gun:SetAngles(Angle(0,0,0))
            
        elseif not string.Explode("_",spawnweapon)[1]=="npc" then
            if droptrace.Hit == false then
                gun:SetParent( can )
            end
        end
    end
end

--[[
if CLIENT then

function SWEP:MenuCreate()
local Frame = vgui.Create( "Frame" ); //Create a frame
Frame:SetSize( 200, 200 ); //Set the size to 200x200
Frame:SetPos( 100, 100 ); //Move the frame to 100,100
Frame:SetVisible( true );  //Visible
Frame:MakePopup( ); //Make the frame
Frame:PostMessage( "SetTitle", "text", "This is the title" ); //Set the title to "This is the title"   

local Button = vgui.Create( "Button", Frame ); //Create a button that is attached to Frame
Button:SetText( "Click me!" ); //Set the button's text to "Click me!"
Button:SetPos( 30, 5 ); //Set the button's position relative to it's parent(Frame)
Button:SetWide( 100 ); //Sets the width of the button you're making
function Button:DoClick( ) //This is called when the button is clicked
self:SetText( "Clicked" ); //Set the text to "Clicked"
end

end
end
]]--
/*
if SERVER then
if customspawn == 1 then
function GM:PlayerSpawn(ply)
ply:SetPos(SpawnPos)
end
end
end
*/

function SWEP:ShouldDropOnDie()
return true
end


--Reload opens options menu
--[[
function SWEP:Reload()
if CLIENT then
    MenuCreate()
end
end
]]--


 
 