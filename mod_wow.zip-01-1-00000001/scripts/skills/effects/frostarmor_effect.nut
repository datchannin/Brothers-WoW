/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.frostarmor_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.frostarmor";
		this.m.Name = "Frost Armor";
		this.m.Icon = "ui/perks/perk_mage_frostarmor.png";
		this.m.IconMini = "effect_mini_frostarmor";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Circle of Snow is around this character.";
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
				icon = "ui/icons/special.png",
				text = "Ignores hostile Zone of Control"
			},
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsImmuneToZoneOfControl = true;
	}

	function onTurnStart()
	{
		this.removeSelf();
	}
});