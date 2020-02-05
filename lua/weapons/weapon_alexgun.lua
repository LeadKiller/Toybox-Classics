AddCSLuaFile()

//General Settings \\
SWEP.AdminSpawnable = true                          // Is the swep spawnable for admin
SWEP.Category = "Toybox Classics"

SWEP.UseHands = true
SWEP.ViewModelFOV = 64                              // How much of the weapon do u see ?
SWEP.ViewModel = "models/weapons/v_alyxgun.mdl"      // The viewModel, the model you se when you are holding it-.-
SWEP.WorldModel = "models/weapons/v_alyxgun.mdl"     // The worlmodel, The model you see when it's down on the ground
SWEP.AutoSwitchTo = false                           // when someone walks over the swep, should i automatectly change to your swep ?
SWEP.Slot = 2                                       // Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.HoldType = "Pistol"                            // How the swep is hold Pistol smg greanade melee
SWEP.PrintName = "Alex's pistol"                         // your sweps name
SWEP.Author = "Alex"                            // Your name
SWEP.Spawnable = true                               //  Can everybody spawn this swep ? - If you want only admin keep this false and adminsapwnable true.
SWEP.AutoSwitchFrom = false                         // Does the weapon get changed by other sweps if you pick them up ?
SWEP.FiresUnderwater = true                        // Does your swep fire under water ?
SWEP.Weight = 5                                     // Chose the weight of the Swep
SWEP.DrawCrosshair = true                           // Do you want it to have a crosshair ?
// SWEP.Category = "Alex's Custom Sweps"                      // Make your own catogory for the swep
SWEP.SlotPos = 2                                    // Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.DrawAmmo = true                                // Does the ammo show up when you are using it ? True / False
SWEP.ReloadSound = "Weapon_Pistol.Reload"           // Reload sound, you can use the default ones, or you can use your one; Example; "sound/myswepreload.waw"
SWEP.Instructions = "shoots fast"              // How do pepole use your swep ?
SWEP.Contact = ""                     // How Pepole chould contact you if they find bugs, errors, etc
SWEP.Purpose = "kill"          // What is the purpose with this swep ?
//General settings\\

//PrimaryFire Settings\\
SWEP.Primary.Sound = "Weapon_357.Single"        // The sound that plays when you shoot :]
SWEP.Primary.Damage = 15                           // How much damage the swep is doing
SWEP.Primary.TakeAmmo = 1                          // How much ammo does it take for each shot ?
SWEP.Primary.ClipSize = 30                         // The clipsize
SWEP.Primary.Ammo = "pistol"                       // ammmo type pistol/ smg1
SWEP.Primary.DefaultClip = 300                      // How much ammo does the swep come with `?
SWEP.Primary.Spread = 0.0                          //  Does the bullets spread all over, if you want it fire exactly where you are aiming leave it o.1
SWEP.Primary.NumberofShots = 2                     // How many bullets you are firing each shot.
SWEP.Primary.Automatic = false                     // Is the swep automatic ?
SWEP.Primary.Recoil = 0                            //  How much we should punch the view
SWEP.Primary.Delay = 0.0000001                           // How long time before you can fire again
SWEP.Primary.Force = 999999999                            // The force of the shot
//PrimaryFire settings\\

//Secondary Fire Variables\\
SWEP.Secondary.NumberofShots = 1                  // How many explosions for each shot
SWEP.Secondary.Force = 66666666                         // Explosions Force
SWEP.Secondary.Spread = 0.1                       // How much the explosion does spread
SWEP.Secondary.Sound = "Weapon_FlareGun.Single"        // Fire sound
SWEP.Secondary.DefaultClip = 0                   // How much ammo the secoindary swep comes with
SWEP.Secondary.Automatic = true                  // Is it automactic ?
SWEP.Secondary.Ammo = "gauss"                    // Leave as Pistol !
SWEP.Secondary.Recoil = 0                         // How uch we should punch the  view
SWEP.Secondary.Delay = 0.1                        //  How long you have to wait before fire a new shot
SWEP.Secondary.TakeAmmo = 0                       // How much ammo Does it take ?
SWEP.Secondary.ClipSize = 0                      // ClipSize
SWEP.Secondary.Damage = 50000                        -- The damage the explosion does.
SWEP.Secondary.Magnitude = "500"                  -- How big its the explosion ?
//Secondary Fire Variables\\

//SWEP:Initialize()\\
function SWEP:Initialize()
    util.PrecacheSound(self.Primary.Sound)
    util.PrecacheSound(self.Secondary.Sound)
    if ( SERVER ) then
        self:SetWeaponHoldType( self.HoldType )
    end
end
//SWEP:Initialize()\\

//SWEP:PrimaryFire()\\
function SWEP:PrimaryAttack()
    if ( !self:CanPrimaryAttack() ) then return end
    local bullet = {}
        bullet.Num = self.Primary.NumberofShots
        bullet.Src = self.Owner:GetShootPos()
        bullet.Dir = self.Owner:GetAimVector()
        bullet.Spread = Vector( self.Primary.Spread * 0.1 , self.Primary.Spread * 0.1, 0)
        bullet.Tracer = 0
        bullet.Force = self.Primary.Force
        bullet.Damage = self.Primary.Damage
        bullet.AmmoType = self.Primary.Ammo
    local rnda = self.Primary.Recoil * -1
    local rndb = self.Primary.Recoil * math.random(-1, 1)
    self:ShootEffects()
    self.Owner:FireBullets( bullet )
    self.Weapon:EmitSound(Sound(self.Primary.Sound))
    self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) )
    self:TakePrimaryAmmo(self.Primary.TakeAmmo)
    self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
    self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
end
//SWEP:PrimaryFire()\\

//SWEP:SecondaryFire()\\
function SWEP:SecondaryAttack()
    if ( !self:CanSecondaryAttack() ) then return end
    local rnda = -self.Secondary.Recoil
    local rndb = self.Secondary.Recoil * math.random(-1, 1)
    self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) )
    local eyetrace = self.Owner:GetEyeTrace()
    self.Weapon:EmitSound ( self.Secondary.Sound )
    self:ShootEffects()
    local explode = ents.Create("env_explosion")
    explode:SetPos( eyetrace.HitPos )
    explode:SetOwner( self.Owner )
    explode:Spawn()
    explode:SetKeyValue("iMagnitude","175")
    explode:Fire("Explode", 0, 0 )
    explode:EmitSound("weapon_AWP.Single", 400, 400 )
    self.Weapon:SetNextPrimaryFire( CurTime() + self.Secondary.Delay )
    self.Weapon:SetNextSecondaryFire( CurTime() + self.Secondary.Delay )
    self:TakePrimaryAmmo(self.Secondary.TakeAmmo)
end
//SWEP:SecondaryFire()\\


 
function SWEP:PostDrawViewModel(vm)
	if vm:GetSubMaterial(0) ~= "color" then -- remove hev
		vm:SetSubMaterial(0, "color")
	end
end

function SWEP:Holster()
	if IsValid(self.Owner) and IsValid(self.Owner:GetViewModel()) then
		local vm = self.Owner:GetViewModel()
		vm:SetSubMaterial()
	end
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

function SWEP:DrawWorldModel()
	if self:GetSubMaterial(0) ~= "color" then -- remove hev
		self:SetSubMaterial(0, "color")
	end

	self:DrawModel()
end