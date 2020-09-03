/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.barkskin_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.barkskin";
		this.m.Name = "Barkskin";
		this.m.Description = "This ability changes its effect depending on current druid form or state. Effect will be removed if druid removes his form or state.";
		this.m.Icon = "ui/perks/effect_druid_barkskin.png";
		this.m.IconMini = "effect_mini_barkskin";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		if (this.m.Container.hasSkill("effects.bearform"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Damage taken reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			});
			
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points."
			});
		}

		if (this.m.Container.hasSkill("effects.catform"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			});
		}

		if (this.m.Container.hasSkill("effects.moonfury"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Ranged Defense increased by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points."
			});
		}
		
		return ret;
	}

	function onUpdate( _properties )
	{
	}

	function onTurnStart()
	{
		this.removeSelf();
	}
});