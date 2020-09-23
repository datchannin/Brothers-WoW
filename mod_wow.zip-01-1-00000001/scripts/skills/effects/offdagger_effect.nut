/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.offdagger_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.offdagger";
		this.m.Name = "Offhand Dagger";
		this.m.Icon = "ui/perks/perk_rogue_camouflage.png";
		this.m.IconMini = "effect_mini_camouflage";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character uses additional offhand dagger. His mainhand weapon skills accept new effects.";
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
			}
		];
	}

	function onAdded()
	{
	}

	function onUpdate( _properties )
	{
	}

	function onTurnEnd()
	{
	}
});