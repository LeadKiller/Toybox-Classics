AddCSLuaFile()

SWEP.Author            = "Chrik"
SWEP.Instructions    = "Shooting flechettes. If the flechette hits a target, the target will turn into a gnome, fly up in the air, and blow up into bananas."

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = false

SWEP.Category = "Toybox Classics"

SWEP.ViewModel            = "models/weapons/c_357.mdl"
SWEP.WorldModel            = "models/weapons/w_357.mdl"
SWEP.UseHands = true

SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic        = true
SWEP.Primary.Ammo            = "none"

SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic    = false
SWEP.Secondary.Ammo            = "none"

SWEP.Weight                = 5
SWEP.AutoSwitchTo        = false
SWEP.AutoSwitchFrom        = false

SWEP.PrintName            = "Banana-Exploding-Gnome-Transforming-Flechette Gun"            
SWEP.Slot                = 2
SWEP.SlotPos            = 2
SWEP.DrawAmmo            = false
SWEP.DrawCrosshair        = true


local ShootSound = Sound( "NPC_Hunter.FlechetteShoot" )

/*---------------------------------------------------------
    Reload does nothing
---------------------------------------------------------*/
function SWEP:Reload()
end

/*---------------------------------------------------------
   Think does nothing
---------------------------------------------------------*/
function SWEP:Think()    
end


/*---------------------------------------------------------
    PrimaryAttack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

    self.Weapon:SetNextPrimaryFire( CurTime() + 0.1 )

    self:EmitSound( ShootSound )
    self:ShootEffects( self )
    
    // The rest is only done on the server
    if (!SERVER) then return end
    
    local Forward = self.Owner:EyeAngles():Forward()
    
    local ent = ents.Create( "hunter_flechette" )
    if ( IsValid( ent ) ) then
    
            ent:SetPos( self.Owner:GetShootPos() + Forward * 32 )
            ent:SetAngles( self.Owner:EyeAngles() )
        ent:Spawn()
        ent:SetColor(Color(0,0,0,255))
ent.IsGnome = true
        ent.Banana = true
        ent:SetVelocity( Forward * 2000 )
          if IsValid(self.Owner) then
    ent:SetOwner( self.Owner )
    end
    end
  
    
end

/*---------------------------------------------------------
    SecondaryAttack
---------------------------------------------------------*/
function SWEP:SecondaryAttack()

    // Right click does nothing..
    
end


/*---------------------------------------------------------
   Name: ShouldDropOnDie
   Desc: Should this weapon be dropped when its owner dies?
---------------------------------------------------------*/
function SWEP:ShouldDropOnDie()
    return false
end
if SERVER then
function TransformBanana(ply, dmg)
    local infl = dmg:GetInflictor()
    local att = dmg:GetAttacker()
    local amount = dmg:GetDamage()
        if IsValid(infl) and IsValid(ply) and infl.Banana and !IsValid(ply.Gnome) and !ply.IsGnome and ply:GetClass() != "prop_door_rotating" and not string.find(ply:GetClass(), "func")  and not string.find(ply:GetModel(),"ban") then
            if ply:GetClass() == "npc_barnacle" then return end
local ent = ents.Create("prop_physics")
            ent:SetPos(ply:GetPos() ) 
ent:SetModel("models/props_junk/gnome.mdl")
ent:SetAngles(Angle(0, ply:GetAngles().yaw,0) )
ent:Spawn()
            if ply:IsPlayer() then ply:SpectateEntity(ent) ply:Spectate(OBS_MODE_CHASE) end 
            ent:SetPos(ply:GetPos() - Vector(0,0,ply:OBBMins().z) ) 
ent.IsGnome = true
ply.Gnome = ent
timer.Simple(1 ,function() if IsValid(ent) then ent:EmitSound("vo/npc/male01/question06.wav",500,150) end end)
timer.Simple(3.5 ,function() if IsValid(ent) then ent:EmitSound("vo/npc/male01/no02.wav",500,150) 
ent:GetPhysicsObject():AddVelocity(Vector(0,0,2000)) end end)
timer.Simple(5, function()  if IsValid(ent) then 
                        if ply:IsPlayer() then
                           
                            local ed = ents.Create("prop_physics")
                            ed:SetPos(ent:GetPos())
                            ed:SetModel("models/props_junk/PopCan01a.mdl")
                            ed:Spawn()
                            ed:Fire("kill",0,10)
                            ed:SetColor(Color(0,0,0,0))
                            ed:SetRenderMode(RENDERMODE_TRANSALPHA)
                            ed:SetCollisionGroup(COLLISION_GROUP_WORLD)

                            ply:SpectateEntity(ed) ply:Spectate(OBS_MODE_CHASE) end 
                        local ex = ents.Create("env_explosion")
                        ex:SetPos(ent:GetPos() + Vector(0,0,40)) 
                        ex:SetKeyValue("iMagnitude",100)
                        ex:SetKeyValue("iRadius",100)
                        if IsValid(att) then
                        ex:SetOwner(att)
                        end
                        ex:Spawn()
                        ex:Fire("explode")
                        ex:Fire("kill",1,0.3)
                        local dk = "models/props/cs_italy/bananna_bunch.mdl"
                       
                        for i = 1,2 do
local p = ents.Create("prop_physics")
                            
                            p:SetModel(dk)
p:SetPos(ent:GetPos())
p:Spawn()
p.IsGnome = true
p:Fire("break")
                    end
ent:Remove()
end end)
            if ply:IsPlayer() then ply:KillSilent() else if ply.OnRemove then ply.OnRemove = function() end end ply:Remove() end
end
end
hook.Add("EntityTakeDamage","BananaTrans",TransformBanana)
end