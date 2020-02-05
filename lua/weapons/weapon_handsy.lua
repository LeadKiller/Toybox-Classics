if (SERVER) then
    AddCSLuaFile()
    SWEP.Weight        = 13.37
    SWEP.AutoSwitchTo    = false
    SWEP.AutoSwitchFrom    = false
end

if ( CLIENT ) then
    SWEP.PrintName            = "Handsy"            
    SWEP.Slot                = 1
    SWEP.SlotPos            = 7
    SWEP.DrawAmmo            = false
    SWEP.DrawCrosshair        = true
end

SWEP.Author        = "Oose"
SWEP.Contact        = ""
SWEP.Purpose        = "Throw things at your enemies."
SWEP.Instructions    = "Primary fire to toss prop, secondary to swap item."
SWEP.Category        = "Toybox Classics"

SWEP.Base            = "weapon_base"
SWEP.HoldType            = "melee"

SWEP.Spawnable            = true
SWEP.AdminOnly        = true

SWEP.ViewModel            = "models/props_lab/cactus.mdl"
SWEP.WorldModel            = ""

SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic        = false
SWEP.Primary.Ammo        = "none"

SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic    = false
SWEP.Secondary.Ammo        = "none"


-- This is the entire list of props that could possibly be spawned
SWEP.contents = {
"models/props_c17/consolebox03a.mdl",
"models/props_c17/computer01_keyboard.mdl",
"models/props_junk/garbage_metalcan001a.mdl",
"models/props_junk/garbage_metalcan002a.mdl",
"models/props_junk/PopCan01a.mdl",
"models/props_junk/watermelon01.mdl",
"models/props_junk/PlasticCrate01a.mdl",
"models/props_junk/metal_paintcan001b.mdl",
"models/props_junk/MetalBucket01a.mdl",
"models/props_junk/metalgascan.mdl",
"models/props_junk/meathook001a.mdl",
"models/props_lab/cactus.mdl",
"models/props_lab/citizenradio.mdl",
"models/props_lab/desklamp01.mdl",
"models/props_lab/huladoll.mdl",
"models/props_vehicles/carparts_tire01a.mdl",
"models/props_interiors/Furniture_chair03a.mdl",
"models/props_c17/playgroundTick-tack-toe_block01a.mdl",
"models/props_c17/playground_swingset_seat01a.mdl",
"models/props_lab/binderredlabel.mdl",
"models/props_lab/clipboard.mdl",
"models/props_lab/jar01b.mdl",
"models/props_junk/TrafficCone001a.mdl",
"models/props_c17/cashregister01a.mdl",
"models/props_c17/doll01.mdl",
"models/props_c17/BriefCase001a.mdl",
"models/props_c17/lamp001a.mdl",
"models/props_c17/metalPot001a.mdl",
"models/props_c17/metalPot002a.mdl",
"models/props_c17/tv_monitor01.mdl",
"models/props_c17/SuitCase_Passenger_Physics.mdl",
"models/props_combine/breenbust.mdl",
"models/props_combine/breenclock.mdl",
"models/props_combine/breenglobe.mdl",
"models/props_interiors/pot01a.mdl",
"models/props_interiors/pot02a.mdl",
"models/props_interiors/SinkKitchen01a.mdl",
"models/props_junk/garbage_bag001a.mdl",
"models/props_junk/garbage_takeoutcarton001a.mdl",
"models/props_junk/garbage_plasticbottle001a.mdl",
"models/props_junk/garbage_plasticbottle002a.mdl",
"models/props_junk/garbage_plasticbottle003a.mdl",
"models/props_junk/garbage_newspaper001a.mdl",
"models/props_junk/garbage_milkcarton001a.mdl",
"models/props_junk/garbage_milkcarton002a.mdl",
"models/props_junk/Shoe001a.mdl"
}

for k, v in pairs(SWEP.contents) do
    util.PrecacheModel(v)
end

SWEP.model = "Something went wrong, lol"
SWEP.spawned = { nil }

--[[-------------------------------------------------------
    Initialize ( For setting hold type I guess )
---------------------------------------------------------]]
function SWEP:Initialize() 
    self:SetWeaponHoldType( self.HoldType )
    self:RandModel()
end

--[[-------------------------------------------------------
    Precache ( I don't know what this does! Cool! )
---------------------------------------------------------]]
function SWEP:Precache()
end

--[[-------------------------------------------------------
    Reload
---------------------------------------------------------]]
function SWEP:Reload()
    for _,v in pairs(self.spawned) do
        SafeRemoveEntity(v)
    end
    self.spawned = {}
end

--[[-------------------------------------------------------
    Think
---------------------------------------------------------]]
function SWEP:Think()
end

--[[-------------------------------------------------------
    PrimaryAttack
---------------------------------------------------------]]
function SWEP:PrimaryAttack()
    if SERVER then
        local ply = self:GetOwner()
        local EyeAng = ply:EyeAngles()
        local EyeFor = (EyeAng:Forward() + Vector(0,0,0.2)):GetNormalized()
        local new = ents.Create( "prop_physics" )
        new:SetModel( self.model )
        new:SetPos( ply:GetShootPos() + EyeFor * 16 )
        new:SetAngles( EyeAng )
        new:Spawn()
        new:Activate()
        local EntPhys = new:GetPhysicsObject()
        if IsValid(EntPhys) then
        local EntMass = EntPhys:GetMass() * 2
        EntPhys:SetMass( EntMass )
        local Force = EyeFor * EntMass * 850 + ply:GetVelocity() * EntMass * 0.6
        local Position = new:GetPos()
        EntPhys:ApplyForceOffset( Force, Position + VectorRand() * 5 )
        end

        undo.Create("thrown item")
                undo.AddEntity(new)
                undo.SetPlayer(ply)
        undo.Finish()

        self.spawned[(#self.spawned)+1] = new
        
        self:RandModel()
    end
end

--[[-------------------------------------------------------
    SecondaryAttack
---------------------------------------------------------]]
function SWEP:SecondaryAttack()
    self:RandModel()
end

--[[-------------------------------------------------------
    Set the viewmodel ( this is sort of important! )
---------------------------------------------------------]]
function SWEP:GetViewModelPosition( pos, ang )
    ply = self:GetOwner()
    local EyePo = ply:GetShootPos()
    local EyeAng = ply:EyeAngles()
    local EyeFo = EyeAng:Forward()
    local EyeRi = EyeAng:Right()
    local EyeUp = EyeAng:Up()
    pos = EyePo + EyeFo * 32 + EyeRi * 11 + EyeUp * -14
    ang = ( EyeFo * -1):Angle()
    return pos, ang
end

function SWEP:RandModel()
    self.model = table.Random( self.contents )
    self.ViewModel    = self.model
    self:SetModel( self.model )
    if IsValid(self:GetOwner()) then
        --[[self:GetOwner():ConCommand( "use " .. "weapon_physcannon" )
        self:GetOwner():ConCommand( "use " .. self:GetClass() )]]--
        self:GetOwner():GetViewModel():SetModel(self.model)
    end
end