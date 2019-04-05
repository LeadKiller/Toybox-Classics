function EFFECT:Init(data)
	
	local origin = data:GetOrigin()
	local ent = data:GetEntity()
	local mag = data:GetMagnitude()
	local NumParticles = 256
	local emitter = ParticleEmitter(origin)
	
	if mag == 0 then
		sound.Play("HL1/ambience/particle_suck2.wav", origin, 150, 125)
	else
		sound.Play("weapons/physcannon/energy_sing_explosion2.wav", origin, 150, 50)
	end
	
		for i = 0, NumParticles do
		
			local pos = origin + (VectorRand():GetNormal()*math.random(-200, 200)) //Make me a sphere full of random positions chef
			local particle = emitter:Add("sprites/haxatomglow", pos)			
			if (particle) then
				if mag == 0 then //I'm using mag to decide whether the particles should be pulled in, or pushed out. 0 for in, 1 for out. Although you could have any value except 0.
					particle:SetVelocity((pos - ent:GetPos()) * -1) //Slow pull in
				else
					particle:SetVelocity((pos - ent:GetPos()) * 12) //Faster push out, hopefully
				end
				particle:SetLifeTime(0)
				particle:SetDieTime(2.5)
				particle:SetStartAlpha(255)
				particle:SetEndAlpha(0)		
				particle:SetStartSize(10)
				particle:SetEndSize(0)	
				particle:SetCollide(true)
				particle:SetAirResistance(65)
				particle:SetBounce(1)
			end
			
		end
		
	emitter:Finish()
	
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()

end