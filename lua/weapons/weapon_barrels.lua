AddCSLuaFile()

SWEP.Category = "Toybox Classics"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModelFOV = 64                              
SWEP.ViewModel = "models/weapons/c_arms_animations.mdl"      
SWEP.UseHands = true
SWEP.WorldModel = "models/Barrel/barrel.mdl"     
SWEP.AutoSwitchTo = true 
SWEP.Slot = 2 
SWEP.HoldType = "rpg"                            
SWEP.PrintName = "Barrels."                         
SWEP.Author = "Manne"                            
SWEP.Spawnable = true                               
SWEP.AutoSwitchFrom = false                        
SWEP.FiresUnderwater = true                        
SWEP.Weight = 5                                     
SWEP.DrawCrosshair = true                           
                    
SWEP.SlotPos = 2                                    
SWEP.DrawAmmo = false                                
       
SWEP.Instructions = "Shoot them barrels"           
SWEP.Contact = ""                     
SWEP.Purpose = "Kill Things"         
SWEP.base = "weapon_base" 
//General Info\\ 
SWEP.Primary.NumberofShots = 1                   
SWEP.Primary.Force = 60                          
SWEP.Primary.Spread = 3                         
SWEP.Primary.Sound = "pewdie/barrels.wav"       
SWEP.Primary.DefaultClip = 40000                     
SWEP.Primary.Automatic = true                   
SWEP.Primary.AngVelocity = Angle(0,0,0)           
SWEP.Primary.Ammo = "none"                      
SWEP.Primary.Model = "models/props_c17/woodbarrel001.mdl" 
SWEP.Primary.Recoil = 0                           
SWEP.Primary.Delay = 0                          
SWEP.Primary.TakeAmmo = 0                         
SWEP.Primary.ClipSize = 0                        
SWEP.Primary.Damage = 9999999999                          
//PrimaryProp Settings \\ 
function SWEP:PrimaryAttack() 
self:TakePrimaryAmmo(self.Primary.TakeAmmo) 
self:Throw_Attack (self.Primary.Model, self.Primary.Sound, self.Primary.AngVelocity) 
self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay ) 
self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay ) 
end 
//SWEP:PrimaryFire()\\ 
//SWEP:Throw_Attack(Model, Sound, Angle)\\ 
function SWEP:Throw_Attack (Model, Sound, Angle) 
local tr = self.Owner:GetEyeTrace() 
self.Weapon:EmitSound (Sound) 
self.BaseClass.ShootEffects (self) 
if (!SERVER) then return end 
local ent = ents.Create ("prop_physics") 
ent:SetModel (Model) 
ent:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector() * 16)) 
ent:SetAngles (self.Owner:EyeAngles()) 
ent:Spawn() 
local phys = ent:GetPhysicsObject() 
local shot_length = tr.HitPos:Length() 
phys:ApplyForceCenter (self.Owner:GetAimVector():GetNormalized() * math.pow (shot_length, 7)) 
--phys:AddAngleVelocity(Angle) 
cleanup.Add (self.Owner, "props", ent) 
undo.Create ("Thrown model") 
undo.AddEntity (ent) 
undo.SetPlayer (self.Owner) 
undo.Finish() 
end 
//Throw_Attack(Model, Sound, Angle)\\ 
SWEP.Secondary.NumberofShots = 1                   
SWEP.Secondary.Force = 67                         
SWEP.Secondary.Spread = 23                       
SWEP.Secondary.Sound = "pewdie/die.wav"        
SWEP.Secondary.DefaultClip = 1                   
SWEP.Secondary.Automatic = false                  
SWEP.Secondary.Ammo = "none"                    
SWEP.Secondary.Recoil = 0                         
SWEP.Secondary.Delay = 0                         
SWEP.Secondary.TakeAmmo = 0                       
SWEP.Secondary.ClipSize = 1                  
SWEP.Secondary.Damage = 1                         
SWEP.Secondary.Magnitude = "203"                  
//Secondary Fire Variables\\ 
//SWEP:SecondaryFire()\\ 
function SWEP:SecondaryAttack() 
if ( !self:CanSecondaryAttack() ) then return end 
local rnda = -self.Secondary.Recoil 
local rndb = self.Secondary.Recoil * math.random(-1, 1) 
self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) ) 
local eyetrace = self.Owner:GetEyeTrace() 
self.Weapon:EmitSound ( self.Secondary.Sound ) 
self:ShootEffects() 
if SERVER then
local explode = ents.Create("env_explosion") 
explode:SetPos( eyetrace.HitPos ) 
explode:SetOwner( self.Owner ) 
explode:Spawn() 
explode:SetKeyValue("iMagnitude","203") 
explode:Fire("Explode", 0, 0 ) 
explode:EmitSound("weapon_AWP.Single", 400, 400 ) 
self.Weapon:SetNextPrimaryFire( CurTime() + self.Secondary.Delay ) 
self.Weapon:SetNextSecondaryFire( CurTime() + self.Secondary.Delay ) 
self:TakePrimaryAmmo(self.Secondary.TakeAmmo) 
end
end 
//SWEP:SecondaryFire()\\ 


    function SWEP:Deploy()
    self.Weapon:EmitSound("pewdie/rawr.wav")
    self:SendWeaponAnim(ACT_VM_DRAW)
end

 function SWEP:ShouldDropOnDie()
            return true;
        end