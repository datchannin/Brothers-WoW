/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.perk_wow_disarm <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.disarm";
		this.m.Name = this.Const.Wow_strings.PerkName.Disarm;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Disarm;
		this.m.Icon = "ui/perks/perk_rogue_disarm.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.rogue_disarm_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/rogue_disarm_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.rogue_disarm_skill");
	}
});