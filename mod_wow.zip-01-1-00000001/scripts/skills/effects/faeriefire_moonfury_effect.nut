/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.faeriefire_moonfury_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.faeriefire_moonfury";
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
			icon = "ui/icons/bravery.png",
			text = "Bravery is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points."
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
		_properties.Bravery -= 10;
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