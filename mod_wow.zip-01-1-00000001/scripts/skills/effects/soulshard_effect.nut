/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 081, game_version = 1.4.0.41*/
this.soulshard_effect <- this.inherit("scripts/skills/skill", {
	m = {
		masterdemonologist = false
	},
	function create()
	{
		this.m.ID = "effects.soulshard";
		this.m.Name = "Soul Shard";
		this.m.Icon = "ui/perks/perk_warlock_drainsoul.png";
		this.m.IconMini = "effect_mini_soulshard";
		this.m.Overlay = "effect_warlock_soulshard";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "You have the \'Soul Shard\' with the part of the enemy\'s soul! Use it as fast as you can until soul still is under your control!";
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

		return ret;
	}

	function onUpdate( _properties )
	{
		this.m.masterdemonologist = this.m.Container.hasSkill("perk.wow.warlock.masterdemonologist");
	}

	function onTurnEnd()
	{
		if (!this.m.masterdemonologist)
		{
			this.removeSelf();
		}
	}
});