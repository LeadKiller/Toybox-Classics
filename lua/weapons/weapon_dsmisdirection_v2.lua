AddCSLuaFile()

SWEP.PrintName = "DS Misdirection v2";
SWEP.Category = "Toybox Classics";
SWEP.Slot = 3;
SWEP.SlotPos = 1;
SWEP.DrawAmmo = false;
SWEP.DrawCrosshair = true;
if(CLIENT)then
end

SWEP.Author = "Dessix Machina";
SWEP.Contact = "MegaDeath409@gmail.com";
SWEP.Purpose = "Shoot people from other directions.";
SWEP.Instructions = "Left click to shoot; Right click to set the destination point or create the ball; Reload to detonate the ball.";

SWEP.Spawnable = true;
SWEP.AdminSpawnable = false;

SWEP.ViewModel = "models/weapons/c_IRifle.mdl";
SWEP.WorldModel = "models/weapons/w_IRifle.mdl";
SWEP.UseHands = true;

SWEP.Primary.ClipSize = -1;
SWEP.Primary.DefaultClip = -1;
SWEP.Primary.Automatic = false;
SWEP.Primary.Ammo = "none";

SWEP.Secondary.ClipSize = -1;
SWEP.Secondary.DefaultClip = -1;
SWEP.Secondary.Automatic = false;
SWEP.Secondary.Ammo = "none";

SWEP.DestPos = nil
SWEP.Turret = nil

local ShootSound = Sound("Weapon_SMG1.Single");
local TurretShootSound = Sound("Weapon_AR2.Single");
local SetSound = Sound("Weapon_SMG1.Reload");

function SWEP:Think()
    if(self.DestPos and self.Turret and IsValid(self.Turret))then
        local dist = self.Turret:GetPos():Distance(self.DestPos)
        local phys = self.Turret:GetPhysicsObject()
        if(!(phys && IsValid(phys)))then return end
        if(dist < 35)then
            phys:SetVelocity(Vector(0,0,0))
            phys:AddAngleVelocity(-phys:GetAngleVelocity())
        else
            phys:ApplyForceCenter((self.DestPos - self.Turret:GetPos()):GetNormal()*750)
        end
    end
end

function SWEP.TraceRound(attacker, tr, damageinfo)
    local effectdata = EffectData()
    effectdata:SetOrigin( tr.HitPos )
    effectdata:SetStart( tr.StartPos )
    effectdata:SetAttachment( 1 )
    effectdata:SetEntity( attacker )
    util.Effect( "ToolTracer", effectdata ) 
end

function SWEP:PrimaryAttack()
    if(self.Turret and IsValid(self.Turret))then
        self.Primary.Automatic = true;
        local trRes = self.Owner:GetEyeTrace()
        if(trRes.Hit)then
            local targPos = trRes.HitPos
            if(trRes.Entity and trRes.Entity:IsValid())then
                targPos = targPos + trRes.HitNormal
            end
            local turretPos = self.Turret:GetPos()
            local targDir = (targPos - turretPos):GetNormal()
            turretPos = turretPos + targDir*24
            local bulletData = {}
            bulletData.Attacker = self.Owner
            bulletData.Num=8
            bulletData.Src=turretPos
            bulletData.Dir=targDir
            bulletData.Spread=Vector(0.05,0.05,0.05)
            bulletData.Force=10000
            bulletData.Damage=500
            bulletData.Tracer = 0
            bulletData.Callback = self.TraceRound

            self.Owner:FireBullets(bulletData)
            self.Turret:EmitSound(TurretShootSound)
            self:SetNextPrimaryFire(CurTime()+0.25)
        else
            self:ShootBullet(35, 1, 0.01)
        end
    else
        self.Primary.Automatic = false;
        self:ShootBullet(35, 1, 0.01)
    end
end

function SWEP:SecondaryAttack()
    local trRes = self.Owner:GetEyeTrace()
    self.Weapon:EmitSound(SetSound)
    if(self.Turret)then
        if(trRes.Hit)then
            self.DestPos = trRes.HitPos + trRes.HitNormal*10
        end
    else
        if (!SERVER) then return end
        local ent = ents.Create("prop_physics")
        if not(ent)then return end
        ent:SetModel("models/Roller_Spikes.mdl")
        ent:SetPos(self.Owner:EyePos() + (self.Owner:GetAimVector() * 30))
        ent:SetAngles(self.Owner:EyeAngles())
        ent:Spawn()
        local phys = ent:GetPhysicsObject()
        if !(phys && IsValid(phys)) then ent:Remove() return end
        phys:SetVelocity(self.Owner:GetVelocity())
        phys:ApplyForceCenter(self.Owner:GetAimVector():GetNormalized() * 7000)
        self.Turret = ent
    end
end

function SWEP:Reload()
    self:DetonateTurret()
end

function SWEP:OnDrop()
    self:DetonateTurret()
end

function SWEP:OnRemove()
    self:DetonateTurret()
end

function SWEP:ShouldDropOnDie()
    return false
end

function SWEP:DetonateTurret()
    self.Primary.Automatic = false;
    self:SetNextPrimaryFire(CurTime())
    self:SetNextSecondaryFire(CurTime()+10)
    self.DestPos = nil
    if(self.Turret and IsValid(self.Turret))then
        local explode = ents.Create( "env_explosion" ) -- creates the explosion
        explode:SetPos( self.Turret:GetPos() )
        explode:SetOwner( self.Owner ) -- this sets you as the person who made the explosion
        explode:Spawn() --this actually spawns the explosion
        explode:SetKeyValue( "iMagnitude", "220" ) -- the magnitude
        explode:Fire( "Explode", 0, 0 )
        self.Turret:Remove()
    end
    self.Turret = nil
end

 
 