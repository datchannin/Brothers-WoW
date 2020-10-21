/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.adrenalinerush_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.adrenalinerush";
		this.m.Name = "Adrenaline Rush";
		this.m.Description = "Adrenaline in your veins allows you to restore part of your Fatigue.";
		this.m.Icon = "ui/perks/perk_rogue_adrenalinerush.png";
		this.m.IconMini = "effect_mini_adrenalinerush";
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
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Fatigue Recovery per turn"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.FatigueRecoveryRate += 5;
	}
});

