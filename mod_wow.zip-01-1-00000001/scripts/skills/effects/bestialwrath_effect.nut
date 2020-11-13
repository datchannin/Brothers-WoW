/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.bestialwrath_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 1,
		BasePower = 25
	},
	function create()
	{
		this.m.ID = "effects.bestialwrath";
		this.m.Name = "Bestial Wrath";
		this.m.Icon = "ui/perks/perk_hunter_bestialwrath.png";
		this.m.IconMini = "effect_mini_bestialwrath";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function setPower( _d )
	{
		this.m.BasePower = _d;
	}

	function getDescription()
	{
		return "This pet is under powerful buff for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.BasePower + "%[/color]"
			}
		];
	}

	function reset()
	{
		if (this.m.TurnsLeft != 1)
		{
			this.m.TurnsLeft = 1;
		}
	}

	function onUpdate( _properties )
	{
		local percent = this.m.BasePower * 0.01;
		_properties.DamageTotalMult *= (1 + percent);
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
	
	function onAdded()
	{
		local actor = this.getContainer().getActor();

		if (this.Const.Tactical.BestialWrathParticles.len() != 0)
		{
			for( local i = 0; i < this.Const.Tactical.BestialWrathParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.BestialWrathParticles[i].Brushes, actor.getTile(), this.Const.Tactical.BestialWrathParticles[i].Delay, this.Const.Tactical.BestialWrathParticles[i].Quantity, this.Const.Tactical.BestialWrathParticles[i].LifeTimeQuantity, this.Const.Tactical.BestialWrathParticles[i].SpawnRate, this.Const.Tactical.BestialWrathParticles[i].Stages);
			}
		}
	}
});