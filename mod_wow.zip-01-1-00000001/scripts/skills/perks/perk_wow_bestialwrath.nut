/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_bestialwrath <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.bestialwrath";
		this.m.Name = this.Const.Wow_strings.PerkName.BestialWrath;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BestialWrath;
		this.m.Icon = "ui/perks/perk_hunter_bestialwrath.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.bestialwrath_skill"))
		{
			//this.m.Container.add(this.new("scripts/skills/actives/hunter_bestialwrath_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.bestialwrath_skill");
	}
});