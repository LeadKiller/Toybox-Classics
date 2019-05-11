AddCSLuaFile()

SWEP.Category = "Toybox Classics"

--Credit to Me, K9, -NPGC-Dominate(UN?D)

-- Effect settings
SWEP.PrintName        = "Parkour"    -- The name of the weapon
SWEP.Slot            = 0                    -- The weapon slot this SWEP belongs in (0-5)
SWEP.SlotPos        = 0                    -- The position in the slot this weapon belongs in (0-infinity, DO NOT COVER UP EXISTING WEAPONS)
SWEP.DrawAmmo        = false                -- Display how much ammo this weapon has left?
SWEP.DrawCrosshair    = false                -- Display the crosshair?
SWEP.ViewModel        = "models/weapons/v_pistol.mdl"    -- First person model
SWEP.WorldModel        = "models/weapons/w_pistol.mdl"    -- Third person model
SWEP.ReloadSound    = "weapons/pistol/pistol_reload1.wav"    -- What sound should this weapon make when reloaded?
SWEP.HoldType        = "pistol"            -- What kind of weapon this is (to define how it's held)
-- Other settings
SWEP.Weight                = 0            -- How powerful is this weapon?
SWEP.AutoSwitchTo        = false        -- Automatically switch to this weapon if it's more powerful than what we're already holding
SWEP.AutoSwitchFrom        = false        -- Automatically switch from this weapon if what we pick up is more powerful than this weapon
SWEP.Spawnable            = true        -- Can clients spawn this weapon?
SWEP.AdminSpawnable        = false        -- Can admins spawn this weapon?
 
-- Weapon info
SWEP.Author            = "fishfingerdude"        -- Who made this
SWEP.Contact        = "kingkardas@hotmail.com"        -- How you can contact who made this
SWEP.Purpose        = "To hear the splintering of your leg bone and realise you're OK."    -- Why was this made?
SWEP.Instructions    = "Equip to take no fall damage and to gain speed. Left click to low jump, right click to high jump."        -- How do you use this?

-- Primary fire settings
SWEP.Primary.Sound                    = "weapons/smg1/smg1_fire1.wav"    -- What sound should this weapon make when fired?
SWEP.Primary.Damage                    = 0        -- How much damage each bullet inflicts
SWEP.Primary.NumShots                = 0            -- How many bullets we should shoot each time we fire the weapon (Use more than one for shotguns and the like)
SWEP.Primary.Recoil                    = 0            -- How much we should punch the view
SWEP.Primary.Cone                    = 0        -- How many degrees the bullets can spread (90 max)
SWEP.Primary.Delay                    = 0        -- How many seconds between each shot
SWEP.Primary.ClipSize                = 0        -- How big the clip is
SWEP.Primary.DefaultClip            = 0        -- How much ammo the gun comes with
SWEP.Primary.Tracer                    = 0        -- Fire a tracer round every so many bullets
SWEP.Primary.Force                    = 0            -- How much force the bullets have when they hit physics objects
SWEP.Primary.TakeAmmoPerBullet         = false    -- Take 1 ammo for each bullet = true, take 1 ammo for each shot = false
SWEP.Primary.Automatic                = false        -- Is this weapon automatic?
SWEP.Primary.Ammo                    = ""    -- Primary ammo type




-- Secondary fire settings
SWEP.Secondary.Sound                = "weapons/smg1/smg1_fire1.wav"        -- What sound should this weapon make when fired?
SWEP.Secondary.Damage                = 0            -- How much damage each bullet inflicts
SWEP.Secondary.NumShots                = 0        -- How many bullets we should shoot each time we fire the weapon (Use more than one for shotguns and the like)
SWEP.Secondary.Recoil                = 0        -- How much we should punch the view
SWEP.Secondary.Cone                    = 0            -- How many degrees the bullets can spread (90 max)
SWEP.Secondary.Delay                = 0        -- How many seconds between each shot
SWEP.Secondary.ClipSize                = 0            -- How big the clip is
SWEP.Secondary.DefaultClip            = 0            -- How much ammo the gun comes with
SWEP.Secondary.Tracer                = 0        -- Fire a tracer round every so many bullets
SWEP.Secondary.Force                = 0            -- How much force the bullets have when they hit physics objects
SWEP.Secondary.TakeAmmoPerBullet     = false    -- Take 1 ammo for each bullet = true, take 1 ammo for each shot = false
SWEP.Secondary.Automatic            = false        -- Is this weapon automatic?
SWEP.Secondary.Ammo                    = ""        -- Secondary ammo type

-- Functions that we can use to run certain code at certain times
-- I don't suggest you play around with this stuff unless you know what you're doing

function SWEP:Initialize()            -- Called when this script is run
end

function SWEP:PrimaryAttack()        -- Called when we press primary fire
    if self.Owner:IsOnGround() then
        self.Owner:SetVelocity(Vector(0,0,400))
        self.Owner:ViewPunch(Angle(20, 0, 0))    
    else
        self.Owner:SetVelocity(Vector(0,0,-1500))
    end
end

function SWEP:SecondaryAttack()        -- Called when we press secondary fire
    if self.Owner:IsOnGround() then
        self.Owner:SetVelocity(Vector(0,0,850))
        self.Owner:ViewPunch(Angle(45, 0, 0))
    end
end

function SWEP:Think()                -- Called every frame while this weapon is active
end

function SWEP:Reload()                -- Called when we reload
    if self.Owner:IsOnGround() then
        self.Owner:SetVelocity(Vector(0,0,1000))
        self.Owner:ViewPunch(Angle(180, 0, 0))
    end
    
    self:DefaultReload(ACT_VM_RELOAD)
    return true
end

function SWEP:Deploy()                -- Called when we take this weapon out
    GAMEMODE:SetPlayerSpeed(self.Owner, 600, 1050)
    self.Owner:DrawViewModel( false )
    self.Owner:DrawWorldModel( false )
    self.Owner:PrintMessage( HUD_PRINTCENTER, "Parkour mode activated" )
    self.Owner.ShouldReduceFallDamage = true
end

function SWEP:Holster()                -- Called when we put this weapon away
    self.Owner:PrintMessage( HUD_PRINTCENTER, "Parkour mode deactivated" )
    GAMEMODE:SetPlayerSpeed(self.Owner, 200, 350)
    if CLIENT then return end
    self.Owner:DrawViewModel (true)
    self.Owner:DrawWorldModel( true )
    return true
end

function SWEP:OnRemove()            -- Called right before this gun goes bye-bye
end

function SWEP:OnRestore()            -- Called when we load a save where you have this weapon, or if the admin changes the map
end

function SWEP:Precache()            -- Use this function to precache resources
end

function SWEP:OwnerChanged()        -- Called when this weapons is dropped or someone else picks it up
end

local function ReduceFallDamage( ent, dmginfo )
    
    if ent:IsPlayer() and ent.ShouldReduceFallDamage and dmginfo:IsFallDamage() then
        dmginfo:SetDamage( 0 )
    end
end
hook.Add( "EntityTakeDamage", "ReduceFallDamage", ReduceFallDamage )

//Placekeep