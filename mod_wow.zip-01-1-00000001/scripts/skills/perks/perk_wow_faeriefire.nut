/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.perk_wow_faeriefire <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.faeriefire";
		this.m.Name = this.Const.Wow_strings.PerkName.FaerieFire;
		this.m.Description = this.Const.Wow_strings.PerkDescription.FaerieFire;
		this.m.Icon = "ui/perks/perk_druid_faeriefire.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.faeriefire_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_faeriefire_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.faeriefire_skill");
	}
});