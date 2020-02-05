include( "shared.lua" )

SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

local ammoconvar = CreateClientConVar("toyboxclassics_tmrcolt_showammo", "0", true)

language.Add( "weapon_tmrcolt", "TMAR Colt Pythons" )
killicon.AddFont( "weapon_tmrcolt", "HL2MPTypeDeath", "..", Color( 128, 128, 128, 200 ) )
surface.CreateFont( "weapon_tmrcolt", { font = "HalfLife2", size = ScreenScale(32) } )

local cross_tex = surface.GetTextureID("ghor/toybox_139296_crosshair3")
local color_noTarget = Color(128, 128, 128, 200)
local color_targetHealth = Color(128, 128, 128, 200)
local angle_zero = Angle(0, 0, 0)
local cm2_wOffset = Vector(1.5, -2, 2)

function SWEP:DoDrawCrosshair(x, y)
	local tr = self.Owner:GetEyeTrace()
	if (IsValid(tr.Entity) and (tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:Health() > 1)) then
		local health = tr.Entity:Health()
		local maxhealth = tr.Entity:GetMaxHealth()
		local calc = health / maxhealth * 255
		color_targetHealth.r = -calc
		color_targetHealth.g = calc
		color_targetHealth.b = 0
		surface.SetDrawColor(color_targetHealth)
	else
		surface.SetDrawColor(color_noTarget)
	end

	surface.SetTexture(cross_tex)
	surface.DrawTexturedRect(x - 8, y - 8, 16, 16)
	return true
end

function SWEP:DrawWeaponSelection(x,y,w,h,a)
	surface.SetFont("weapon_tmrcolt")
	surface.SetTextPos(x + w * 0.35, y + h * 0.15)
	surface.DrawText("e")
	surface.SetTextPos(x + w * 0.20, y + h * 0.30)
	surface.DrawText("e")
end

function SWEP:CustomAmmoDisplay()
	if !ammoconvar:GetBool() then
		return {Draw = false}
	end

	local ammoam = self:Clip1() + self:Clip2()

	if ammoam == -2 then
		ammoam = 0
	end

	if self:GetReloading() and ammoam == 5 then
		ammoam = 6
	end

	return {Draw = true, PrimaryClip = ammoam}
end

function SWEP:DrawWorldModel()
	self:DrawModel()
	if (IsValid(self.Owner)) then
		local matrix = self.Owner:GetBoneMatrix(self.Owner:LookupBone("ValveBiped.Bip01_L_Hand"))
		if (matrix) then
			local pos = matrix:GetTranslation()
			local ang = matrix:GetAngles()
			local cm = self.CModel_W2
			//local localpos, localang = self:GetBonePosition(0)
			pos, ang = LocalToWorld(cm2_wOffset, angle_zero, pos, ang)
			cm:SetPos(pos)
			cm:SetAngles(ang)
			cm:DrawModel()
		end
	end
end