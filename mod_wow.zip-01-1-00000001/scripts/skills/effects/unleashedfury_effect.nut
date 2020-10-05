/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.unleashedfury_effect <- this.inherit("scripts/skills/skill", {
	m = {
		MeleeSkillBase = 30,
		BraveryBase = 30
	},
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

	function SetMeleeSkillBase(_d)
	{
		this.m.MeleeSkillBase = _d;
	}

	function SetBraveryBase(_d)
	{
		this.m.BraveryBase = _d;
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
		_properties.MeleeSkill += this.m.MeleeSkillBase;
		_properties.Bravery += this.m.BraveryBase;
	}
});