/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.endurancetraining_effect <- this.inherit("scripts/skills/skill", {
	m = {},
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
		_properties.HitpointsMult *= 2;
		_properties.Stamina += 40;
	}

});