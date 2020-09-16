/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.drainsoul_effect <- this.inherit("scripts/skills/skill", {
	m = {},

	function create()
	{
		this.m.ID = "effects.drainsoul";
		this.m.Name = "Drunk Soul";
		this.m.Icon = "ui/perks/skill_warlock_drainsoul.png";
		this.m.IconMini = "effect_mini_moonfury";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}


	function getDescription()
	{
		return "You have drank the enemy soul! Use it as fast as you can until soul is under your control!";
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

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.setDirty(true);
	}
	
	function onTurnEnd()
	{
		this.removeSelf();
	}
});