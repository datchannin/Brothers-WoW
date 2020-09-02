/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.41*/
this.unleashedfury_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.unleashedfury";
		this.m.Name = "Unleashed Fury";
		this.m.Description = "";
		this.m.Icon = "ui/perks/perk_hunter_unleashedfury.png";
		this.m.IconMini = "effect_mini_unleashfury";
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
		_properties.MeleeSkill += 30;
		_properties.Bravery += 30;
	}
});