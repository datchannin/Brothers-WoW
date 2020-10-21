/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.tigersfury_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.tigersfury";
		this.m.Name = "Tiger's Fury";
		this.m.Description = "Tiger rage increases damage done for one turn.";
		this.m.Icon = "ui/perks/effect_druid_tigersfury.png";
		this.m.IconMini = "effect_mini_tigersfury";
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
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage dealt will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult *= 1.2;
	}

	function onTurnStart()
	{
		this.removeSelf();
	}
});