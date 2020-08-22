/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.08, game_version = 1.4.0.39*/
this.fireward_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.fireward";
		this.m.Name = "Fire Ward";
		this.m.Icon = "ui/perks/perk_mage_fireward.png";
		this.m.IconMini = "effect_mini_fireward";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Circle of Fire is around this character.";
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
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color]"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Ranged Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color]"
			},
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 20;
		_properties.RangedDefense += 20;
	}

	function onTurnStart()
	{
		this.removeSelf();
	}
});