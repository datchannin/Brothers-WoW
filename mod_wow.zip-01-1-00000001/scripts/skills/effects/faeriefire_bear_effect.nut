/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.faeriefire_bear_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.faeriefire_bear";
		this.m.Name = "Faerie Fire";
		this.m.Description = "This effect can changes depending on druid form or state when he used it.";
		this.m.Icon = "ui/perks/effect_druid_faeriefire.png";
		this.m.IconMini = "effect_mini_faeriefire";
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

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "Melee Skill is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points."
		});
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "This effect will be applied for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s)."
		});

		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.MeleeSkill -= 10;
	}

	function reset()
	{
		this.m.TurnsLeft = 2;
	}

	function onTurnStart()
	{
		if (--this.m.TurnsLeft < 0)
		{
			this.removeSelf();
		}
	}
});