AddCSLuaFile()

SWEP.base = "weapon_base"
SWEP.Category = "Tehkingofkebab"
SWEP.Author = "Tehkingofkebab"
SWEP.Contact = "tehkingofkebab on Steam"
SWEP.Purpose = "Shootin', and ..uhm..stuff."
SWEP.Instructions = "Primary fire fires the weapon(obviusly), secondary toggles Iron Sights."
SWEP.PrintName = "Electron Pistol"
SWEP.Slot = 2
SWEP.SlotPos = 5
SWEP.DrawCrosshair = true
SWEP.DrawAmmo = true
SWEP.ViewModelFlip    = false
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true
SWEP.HoldType = "pistol"
SWEP.Spawnable     = false
SWEP.AdminSpawnable     = true
SWEP.AutoSwitchTo     = false
SWEP.AutoSwitchFrom     = true
SWEP.FiresUnderwater     = false
SWEP.ViewModelFOV = 70
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBonescales = {["ValveBiped.square"] = Vector(0.009, 0.009, 0.009)}

SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 120
SWEP.Primary.Recoil = 0.5
SWEP.Primary.Damage = 25
SWEP.Primary.NumberofShots = 1
SWEP.Primary.Spread = 0.3
SWEP.Primary.Delay = 0.1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "AR2"
SWEP.Primary.Sound = "AlyxEMP.Discharge"
SWEP.Primary.Force = 25
SWEP.Primary.TakeAmmo = 1

SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic    = false
SWEP.Secondary.Ammo    = "none"

SWEP.IronSightsPos = Vector(-5.7, -13.443, 3)
SWEP.IronSightsAng = Vector(0.574, -1.149, 1.72)

SWEP.Category = "Toybox Classics"
SWEP.Spawnable = true

SWEP.VElements = {
    ["via6"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.square", pos = Vector(-1.119, -0.969, 2.157), angle = Angle(0, 0, 90), size = Vector(0.25, 0.25, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["vial2"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.square", pos = Vector(-1.119, -0.969, -3.037), angle = Angle(0, 0, 90), size = Vector(0.25, 0.25, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["battery"] = { type = "Model", model = "models/Items/car_battery01.mdl", bone = "ValveBiped.square", pos = Vector(0, 0, 0), angle = Angle(-0.475, 0, -89.462), size = Vector(0.159, 0.565, 0.159), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["hammer"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.hammer", pos = Vector(0.018, -0, -0.219), angle = Angle(-155.838, 90, -0), size = Vector(0.09, 0.09, 0.09), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["iron2"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.square", pos = Vector(-0.163, -0.912, -3.643), angle = Angle(0, 90, 180), size = Vector(0.054, 0.054, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["iron3"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.square", pos = Vector(-0.008, -0.758, 3.15), angle = Angle(0, -90, 0), size = Vector(0.057, 0.057, 0.057), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["vial5"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.square", pos = Vector(-1.119, -0.969, -0.593), angle = Angle(0, 0, 90), size = Vector(0.25, 0.25, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["iron"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.square", pos = Vector(0.157, -0.912, -3.643), angle = Angle(0, 90, 180), size = Vector(0.054, 0.054, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["vial"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.square", pos = Vector(1.161, -0.939, -3.401), angle = Angle(180, 0, 90), size = Vector(0.25, 0.25, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["vial3"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.square", pos = Vector(1.161, -0.939, -1.188), angle = Angle(180, 0, 90), size = Vector(0.25, 0.25, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["vial4"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.square", pos = Vector(1.161, -0.939, 1.332), angle = Angle(180, 0, 90), size = Vector(0.25, 0.25, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:Initialize()
    if ( SERVER ) then
        self:SetHoldType( self.HoldType )
    end

    if CLIENT then
        // Create a new table for every weapon instance
        self.VElements = table.FullCopy( self.VElements )
        self.WElements = table.FullCopy( self.WElements )
        self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )
        self:CreateModels(self.VElements) // create viewmodels
        self:CreateModels(self.WElements) // create worldmodels
        
        // init view model bone build function
        if IsValid(self.Owner) then
            local vm = self.Owner:GetViewModel()
            if IsValid(vm) then
                self:ResetBonePositions(vm)
                
                // Init viewmodel visibility
                if (self.ShowViewModel == nil or self.ShowViewModel) then
                    vm:SetColor(Color(255,255,255,255))
                else
                    // we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
                    vm:SetColor(Color(255,255,255,1))
                    // ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
                    // however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
                    vm:SetMaterial("Debug/hsv")         
                end
            end
        end
        
    end
end
 
 
function SWEP:OnRemove()
    if CLIENT then
        self:RemoveModels()
    end
end

function SWEP:PrimaryAttack()

   if ( !self:CanPrimaryAttack() ) then return end
   local bullet = {}
       bullet.Num = self.Primary.NumberofShots
       bullet.Src = self.Owner:GetShootPos()
       bullet.Dir = self.Owner:GetAimVector()
       bullet.Spread = Vector( self.Primary.Spread * 0.1 , self.Primary.Spread * 0.1, 0)
       bullet.Tracer = 1
       bullet.TracerName = "ToolTracer"
       bullet.Force = self.Primary.Force
       bullet.Damage = self.Primary.Damage
       bullet.AmmoType = self.Primary.Ammo
   local rnda = -self.Primary.Recoil
   local rndb = self.Primary.Recoil * math.random(-1, 1)
   self:ShootEffects()
   self.Owner:FireBullets( bullet )
   self.Weapon:EmitSound(Sound(self.Primary.Sound))
   self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) )
   self:TakePrimaryAmmo(self.Primary.TakeAmmo)
   self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

end

local IRONSIGHT_TIME = 0.1


function SWEP:GetViewModelPosition( pos, ang )

    if ( !self.IronSightsPos ) then return pos, ang end

    local bIron = self.Weapon:GetNetworkedBool( "Ironsights" )
    
    if ( bIron != self.bLastIron ) then
    
        self.bLastIron = bIron
        self.fIronTime = CurTime()
        
        if ( bIron ) then
            self.SwayScale     = 0.3
            self.BobScale     = 0.1
        else
            self.SwayScale     = 1.0
            self.BobScale     = 1.0
        end
    
    end
    
    local fIronTime = self.fIronTime or 0

    if ( !bIron && fIronTime < CurTime() - IRONSIGHT_TIME ) then
        return pos, ang
    end
    
    local Mul = 1.0
    
    if ( fIronTime > CurTime() - IRONSIGHT_TIME ) then
    
        Mul = math.Clamp( (CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1 )
        
        if (!bIron) then Mul = 1 - Mul end
    
    end

    local Offset    = self.IronSightsPos
    
    if ( self.IronSightsAng ) then
    
        ang = ang * 1
        ang:RotateAroundAxis( ang:Right(),         self.IronSightsAng.x * Mul )
        ang:RotateAroundAxis( ang:Up(),         self.IronSightsAng.y * Mul )
        ang:RotateAroundAxis( ang:Forward(),     self.IronSightsAng.z * Mul )
    
    
    end
    
    local Right     = ang:Right()
    local Up         = ang:Up()
    local Forward     = ang:Forward()
    
    

    pos = pos + Offset.x * Right * Mul
    pos = pos + Offset.y * Forward * Mul
    pos = pos + Offset.z * Up * Mul

    return pos, ang
    
end



function SWEP:SetIronsights( b )

    self.Weapon:SetNetworkedBool( "Ironsights", b )

end


SWEP.NextSecondaryAttack = 0

function SWEP:SecondaryAttack()

    if ( !self.IronSightsPos ) then return end
    if ( self.NextSecondaryAttack > CurTime() ) then return end
    
    bIronsights = !self.Weapon:GetNetworkedBool( "Ironsights", false )
    
    self:SetIronsights( bIronsights )
    
    self.NextSecondaryAttack = CurTime() + 0.3
    
end


function SWEP:PrimaryAttack()

   if ( !self:CanPrimaryAttack() ) then return end
   local bullet = {}
       bullet.Num = self.Primary.NumberofShots
       bullet.Src = self.Owner:GetShootPos()
       bullet.Dir = self.Owner:GetAimVector()
       bullet.Spread = Vector( self.Primary.Spread * 0.1 , self.Primary.Spread * 0.1, 0)
       bullet.Tracer = 1
       bullet.TracerName = "ToolTracer"
       bullet.Force = self.Primary.Force
       bullet.Damage = self.Primary.Damage
       bullet.AmmoType = self.Primary.Ammo
   local rnda = -self.Primary.Recoil
   local rndb = self.Primary.Recoil * math.random(-1, 1)
   self:ShootEffects()
   self.Owner:FireBullets( bullet )
   self.Weapon:EmitSound(Sound(self.Primary.Sound))
   self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) )
   self:TakePrimaryAmmo(self.Primary.TakeAmmo)
   self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

end

function SWEP:Holster()
    if CLIENT and IsValid(self.Owner) then
        local vm = self.Owner:GetViewModel()
        if IsValid(vm) then
            self:ResetBonePositions(vm)
        end
    end
    
    return true
end

function SWEP:OnRemove()
    self:Holster()
end

if CLIENT then
    SWEP.vRenderOrder = nil
    function SWEP:ViewModelDrawn()
        
        local vm = self.Owner:GetViewModel()
        if !IsValid(vm) then return end
        
        if (!self.VElements) then return end
        
        self:UpdateBonePositions(vm)
        if (!self.vRenderOrder) then
            
            // we build a render order because sprites need to be drawn after models
            self.vRenderOrder = {}
            for k, v in pairs( self.VElements ) do
                if (v.type == "Model") then
                    table.insert(self.vRenderOrder, 1, k)
                elseif (v.type == "Sprite" or v.type == "Quad") then
                    table.insert(self.vRenderOrder, k)
                end
            end
            
        end
        for k, name in ipairs( self.vRenderOrder ) do
        
            local v = self.VElements[name]
            if (!v) then self.vRenderOrder = nil break end
            if (v.hide) then continue end
            
            local model = v.modelEnt
            local sprite = v.spriteMaterial
            
            if (!v.bone) then continue end
            
            local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
            
            if (!pos) then continue end
            
            if (v.type == "Model" and IsValid(model)) then
                model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
                ang:RotateAroundAxis(ang:Up(), v.angle.y)
                ang:RotateAroundAxis(ang:Right(), v.angle.p)
                ang:RotateAroundAxis(ang:Forward(), v.angle.r)
                model:SetAngles(ang)
                //model:SetModelScale(v.size)
                local matrix = Matrix()
                matrix:Scale(v.size)
                model:EnableMatrix( "RenderMultiply", matrix )
                
                if (v.material == "") then
                    model:SetMaterial("")
                elseif (model:GetMaterial() != v.material) then
                    model:SetMaterial( v.material )
                end
                
                if (v.skin and v.skin != model:GetSkin()) then
                    model:SetSkin(v.skin)
                end
                
                if (v.bodygroup) then
                    for k, v in pairs( v.bodygroup ) do
                        if (model:GetBodygroup(k) != v) then
                            model:SetBodygroup(k, v)
                        end
                    end
                end
                
                if (v.surpresslightning) then
                    render.SuppressEngineLighting(true)
                end
                
                render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
                render.SetBlend(v.color.a/255)
                model:DrawModel()
                render.SetBlend(1)
                render.SetColorModulation(1, 1, 1)
                
                if (v.surpresslightning) then
                    render.SuppressEngineLighting(false)
                end
                
            elseif (v.type == "Sprite" and sprite) then
                
                local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
                render.SetMaterial(sprite)
                render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
                
            elseif (v.type == "Quad" and v.draw_func) then
                
                local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
                ang:RotateAroundAxis(ang:Up(), v.angle.y)
                ang:RotateAroundAxis(ang:Right(), v.angle.p)
                ang:RotateAroundAxis(ang:Forward(), v.angle.r)
                
                cam.Start3D2D(drawpos, ang, v.size)
                    v.draw_func( self )
                cam.End3D2D()
            end
            
        end
        
    end
    SWEP.wRenderOrder = nil
    function SWEP:DrawWorldModel()
        
        if (self.ShowWorldModel == nil or self.ShowWorldModel) then
            self:DrawModel()
        end
        
        if (!self.WElements) then return end
        
        if (!self.wRenderOrder) then
            self.wRenderOrder = {}
            for k, v in pairs( self.WElements ) do
                if (v.type == "Model") then
                    table.insert(self.wRenderOrder, 1, k)
                elseif (v.type == "Sprite" or v.type == "Quad") then
                    table.insert(self.wRenderOrder, k)
                end
            end
        end
        
        if (IsValid(self.Owner)) then
            bone_ent = self.Owner
        else
            // when the weapon is dropped
            bone_ent = self
        end
        
        for k, name in pairs( self.wRenderOrder ) do
        
            local v = self.WElements[name]
            if (!v) then self.wRenderOrder = nil break end
            if (v.hide) then continue end
            
            local pos, ang
            
            if (v.bone) then
                pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
            else
                pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
            end
            
            if (!pos) then continue end
            
            local model = v.modelEnt
            local sprite = v.spriteMaterial
            
            if (v.type == "Model" and IsValid(model)) then
                model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
                ang:RotateAroundAxis(ang:Up(), v.angle.y)
                ang:RotateAroundAxis(ang:Right(), v.angle.p)
                ang:RotateAroundAxis(ang:Forward(), v.angle.r)
                model:SetAngles(ang)
                //model:SetModelScale(v.size)
                local matrix = Matrix()
                matrix:Scale(v.size)
                model:EnableMatrix( "RenderMultiply", matrix )
                
                if (v.material == "") then
                    model:SetMaterial("")
                elseif (model:GetMaterial() != v.material) then
                    model:SetMaterial( v.material )
                end
                
                if (v.skin and v.skin != model:GetSkin()) then
                    model:SetSkin(v.skin)
                end
                
                if (v.bodygroup) then
                    for k, v in pairs( v.bodygroup ) do
                        if (model:GetBodygroup(k) != v) then
                            model:SetBodygroup(k, v)
                        end
                    end
                end
                
                if (v.surpresslightning) then
                    render.SuppressEngineLighting(true)
                end
                
                render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
                render.SetBlend(v.color.a/255)
                model:DrawModel()
                render.SetBlend(1)
                render.SetColorModulation(1, 1, 1)
                
                if (v.surpresslightning) then
                    render.SuppressEngineLighting(false)
                end
                
            elseif (v.type == "Sprite" and sprite) then
                
                local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
                render.SetMaterial(sprite)
                render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
                
            elseif (v.type == "Quad" and v.draw_func) then
                
                local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
                ang:RotateAroundAxis(ang:Up(), v.angle.y)
                ang:RotateAroundAxis(ang:Right(), v.angle.p)
                ang:RotateAroundAxis(ang:Forward(), v.angle.r)
                
                cam.Start3D2D(drawpos, ang, v.size)
                    v.draw_func( self )
                cam.End3D2D()
            end
            
        end
        
    end
    function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
        
        local bone, pos, ang
        if (tab.rel and tab.rel != "") then
            
            local v = basetab[tab.rel]
            
            if (!v) then return end
            
            // Technically, if there exists an element with the same name as a bone
            // you can get in an infinite loop. Let's just hope nobody's that stupid.
            pos, ang = self:GetBoneOrientation( basetab, v, ent )
            
            if (!pos) then return end
            
            pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
            ang:RotateAroundAxis(ang:Up(), v.angle.y)
            ang:RotateAroundAxis(ang:Right(), v.angle.p)
            ang:RotateAroundAxis(ang:Forward(), v.angle.r)
                
        else
        
            bone = ent:LookupBone(bone_override or tab.bone)
            if (!bone) then return end
            
            pos, ang = Vector(0,0,0), Angle(0,0,0)
            local m = ent:GetBoneMatrix(bone)
            if (m) then
                pos, ang = m:GetTranslation(), m:GetAngles()
            end
            
            if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
                ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
                ang.r = -ang.r // Fixes mirrored models
            end
        
        end
        
        return pos, ang
    end
    function SWEP:CreateModels( tab )
        if (!tab) then return end
        // Create the clientside models here because Garry says we can't do it in the render hook
        for k, v in pairs( tab ) do
            if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
                    string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
                
                v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
                if (IsValid(v.modelEnt)) then
                    v.modelEnt:SetPos(self:GetPos())
                    v.modelEnt:SetAngles(self:GetAngles())
                    v.modelEnt:SetParent(self)
                    v.modelEnt:SetNoDraw(true)
                    v.createdModel = v.model
                else
                    v.modelEnt = nil
                end
                
            elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
                and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
                
                local name = v.sprite.."-"
                local params = { ["$basetexture"] = v.sprite }
                // make sure we create a unique name based on the selected options
                local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
                for i, j in pairs( tocheck ) do
                    if (v[j]) then
                        params["$"..j] = 1
                        name = name.."1"
                    else
                        name = name.."0"
                    end
                end

                v.createdSprite = v.sprite
                v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
                
            end
        end
        
    end
    
    local allbones
    local hasGarryFixedBoneScalingYet = false

    function SWEP:UpdateBonePositions(vm)
        
        if self.ViewModelBoneMods then
            
            if (!vm:GetBoneCount()) then return end
            
            // !! WORKAROUND !! //
            // We need to check all model names :/
            local loopthrough = self.ViewModelBoneMods
            if (!hasGarryFixedBoneScalingYet) then
                allbones = {}
                for i=0, vm:GetBoneCount() do
                    local bonename = vm:GetBoneName(i)
                    if (self.ViewModelBoneMods[bonename]) then 
                        allbones[bonename] = self.ViewModelBoneMods[bonename]
                    else
                        allbones[bonename] = { 
                            scale = Vector(1,1,1),
                            pos = Vector(0,0,0),
                            angle = Angle(0,0,0)
                        }
                    end
                end
                
                loopthrough = allbones
            end
            // !! ----------- !! //
            
            for k, v in pairs( loopthrough ) do
                local bone = vm:LookupBone(k)
                if (!bone) then continue end
                
                // !! WORKAROUND !! //
                local s = Vector(v.scale.x,v.scale.y,v.scale.z)
                local p = Vector(v.pos.x,v.pos.y,v.pos.z)
                local ms = Vector(1,1,1)
                if (!hasGarryFixedBoneScalingYet) then
                    local cur = vm:GetBoneParent(bone)
                    while(cur >= 0) do
                        local pscale = loopthrough[vm:GetBoneName(cur)].scale
                        ms = ms * pscale
                        cur = vm:GetBoneParent(cur)
                    end
                end
                
                s = s * ms
                // !! ----------- !! //
                
                if vm:GetManipulateBoneScale(bone) != s then
                    vm:ManipulateBoneScale( bone, s )
                end
                if vm:GetManipulateBoneAngles(bone) != v.angle then
                    vm:ManipulateBoneAngles( bone, v.angle )
                end
                if vm:GetManipulateBonePosition(bone) != p then
                    vm:ManipulateBonePosition( bone, p )
                end
            end
        else
            self:ResetBonePositions(vm)
        end
           
    end
     
    function SWEP:ResetBonePositions(vm)
        
        if (!vm:GetBoneCount()) then return end
        for i=0, vm:GetBoneCount() do
            vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
            vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
            vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
        end
        
    end

    /**************************
        Global utility code
    **************************/

    // Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
    // Does not copy entities of course, only copies their reference.
    // WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
    function table.FullCopy( tab )
        if (!tab) then return nil end
        
        local res = {}
        for k, v in pairs( tab ) do
            if (type(v) == "table") then
                res[k] = table.FullCopy(v) // recursion ho!
            elseif (type(v) == "Vector") then
                res[k] = Vector(v.x, v.y, v.z)
            elseif (type(v) == "Angle") then
                res[k] = Angle(v.p, v.y, v.r)
            else
                res[k] = v
            end
        end
        
        return res
        
    end
    
end