/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.elunesgrace_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.elunesgrace_trait";
		this.m.Name = "Elune\'s Grace";
		this.m.Icon = "ui/traits/elunesgrace_trait.png";
		this.m.Description = "This character was bleesed by Elune, he feels energized at night.";
		this.m.Titles = [];
		this.m.Excluded = [];
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

		if (!this.World.getTime().IsDaytime)
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Fatigue Recovery per turn at night"
			});
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Hitpoints Recovery per turn at night"
			});
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve at night"
			});
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "No morale check triggered upon losing hitpoints at night"
			});
		}
		else
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Does not give any bonuses at daytime"
			});
		}

		return ret;
	}

	function onUpdate( _properties )
	{
		if (!this.World.getTime().IsDaytime)
		{
			_properties.FatigueRecoveryRate += 3;
			_properties.HitpointsRecoveryRate += 3;
			_properties.Bravery += 5;
			_properties.IsAffectedByLosingHitpoints = false;
		}
	}
});

