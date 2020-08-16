/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.04, game_version = 1.4.0.36*/
this.perk_wow_huntersmark <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.huntersmark";
		this.m.Name = this.Const.Wow_strings.PerkName.HuntersMark;
		this.m.Description = this.Const.Wow_strings.PerkDescription.HuntersMark;
		this.m.Icon = "ui/perks/perk_hunter_huntersmark.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.huntersmark_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/hunter_huntersmark_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.huntersmark_skill");
	}
});