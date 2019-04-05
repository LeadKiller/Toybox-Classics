AddCSLuaFile()

if CLIENT then
SWEP.WepSelectIcon = surface.GetTextureID("ksicons/haxpl")
end

SWEP.PrintName = "The H44X!"
SWEP.ViewModelFOV            = 60
SWEP.ViewModelFlip            = false
SWEP.ViewModel                = "models/weapons/c_IRifle.mdl"
SWEP.WorldModel                = "models/weapons/w_IRifle.mdl"
SWEP.UseHands = true

SWEP.Category = "Toybox Classics"
SWEP.Spawnable                = true
SWEP.AdminSpawnable            = false

SWEP.CanPrimary             = true
SWEP.CanSecondary             = true
SWEP.Targets                 = {}

util.PrecacheSound("weapons/physgun_off.wav")
util.PrecacheSound("vo/npc/male01/thehacks01.wav")

function SWEP:DoHax(superadmin)

    self.Weapon:EmitSound( "weapons/physgun_off.wav", 100, 65 )
    self.Owner:EmitSound( "vo/npc/male01/thehacks01.wav", 125, 100 )

    for k, v in pairs (ents.GetAll()) do
        if v:IsValid() && v:IsPlayer() && v != self.Owner then
            if !superadmin && !v:IsAdmin() then
                table.insert(self.Targets, v)
                timer.Simple(1.8, function() if v:IsValid() then v:EmitSound( "vo/npc/male01/thehacks01.wav", 100, 170 ) end end)
                timer.Simple(1.8, function() if v:IsValid() then v:PrintMessage( HUD_PRINTCENTER, "0MGz h3 15 h4xxing!11!!?!" ) end end)
            elseif superadmin then
                table.insert(self.Targets, v)
                timer.Simple( 1.8, function() if v:IsValid() then v:EmitSound("vo/npc/male01/thehacks01.wav", 100, 170) end end)
                timer.Simple( 1.8, function() if v:IsValid() then v:PrintMessage(HUD_PRINTCENTER, "0MGz h3 15 h4xxing!11!!?!") end end)
            end
        elseif v:IsNPC() then
            table.insert(self.Targets, v)
            timer.Simple(1.8, function() if v:IsValid() then v:EmitSound( "vo/npc/male01/thehacks01.wav", 100, 170 ) end end)
        end
    end
    
    local data = EffectData()
    
    timer.Simple(3.3, function()
        if !IsValid(self) then return end
        if !self.Owner then return end
        data:SetMagnitude(0)
        data:SetOrigin(self.Owner:GetShootPos())
        data:SetEntity(self.Weapon)
        util.Effect("haxatomglow", data)
        util.ScreenShake( self.Owner:GetPos(), 50, 50, 4, 10000 )  
    end)
    
    timer.Simple(6.3, function()
        if !IsValid(self) then return end
        if !self.Owner then self.Charge = false return end
        data:SetMagnitude(1)
        data:SetOrigin(self.Owner:GetShootPos())
        util.Effect("haxatomglow", data)
        self:Boom()
    end)

end

function SWEP:Boom()

    for k, v in pairs (self.Targets) do
        if v:IsValid() then
            local data = EffectData()
            data:SetOrigin(v:GetPos())
            util.Effect("Explosion", data)
            util.BlastDamage(self.Weapon, self.Owner, v:GetPos(), 150, 90000)
            if v:IsPlayer() && v:Alive() then
                v:Kill()
            end
        end
    end
    
end


function SWEP:PrimaryAttack()

    if !SERVER || self:GetNextPrimaryFire() > CurTime() then return end
    
    self:DoHax(false)
    self:SetNextPrimaryFire(CurTime() + 7)
    
    return
                                
end

function SWEP:SecondaryAttack()

    if !SERVER || !self.Owner:IsSuperAdmin() || self:GetNextPrimaryFire() > CurTime() then return end
      
    self:DoHax(true)    
    self:SetNextPrimaryFire(CurTime() + 7)
    
    return

end