/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.endurancetraining_effect <- this.inherit("scripts/skills/skill", {
	m = {
		StaminaBase = 40,
		HitpointsMultBase = 2
	},
	function create()
	{
		this.m.ID = "effects.endurancetraining";
		this.m.Name = "Endurance Training";
		this.m.Description = "";
		this.m.Icon = "ui/perks/perk_hunter_endurancetraining.png";
		this.m.IconMini = "effect_mini_endurancetraining";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function SetStaminaBase(_d)
	{
		this.m.StaminaBase = _d;
	}

	function SetHitpointsMultBase(_d)
	{
		this.m.HitpointsMultBase = _d;
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
		];
	}

	function onUpdate( _properties )
	{
		_properties.HitpointsMult *= this.m.HitpointsMultBase;
		_properties.Stamina += this.m.StaminaBase;
	}

});