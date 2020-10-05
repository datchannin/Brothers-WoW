/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.thickhide_effect <- this.inherit("scripts/skills/skill", {
	m = {
		MeleeDefenseBase = 40,
		RangedDefenseBase = 40
	},
	function create()
	{
		this.m.ID = "effects.thickhide";
		this.m.Name = "Thick Hide";
		this.m.Description = "";
		this.m.Icon = "ui/perks/perk_hunter_thickhide.png";
		this.m.IconMini = "effect_mini_thickhide";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function SetMeleeDefenseBase(_d)
	{
		this.m.MeleeDefenseBase = _d;
	}

	function SetRangedDefenseBase(_d)
	{
		this.m.RangedDefenseBase = _d;
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
		_properties.MeleeDefense += this.m.MeleeDefenseBase;
		_properties.RangedDefense += this.m.RangedDefenseBase;
	}
});