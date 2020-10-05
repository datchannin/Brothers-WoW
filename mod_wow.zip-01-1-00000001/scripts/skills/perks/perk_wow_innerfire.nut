/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.perk_wow_innerfire <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.innerfire";
		this.m.Name = this.Const.Wow_strings.PerkName.InnerFire;
		this.m.Description = this.Const.Wow_strings.PerkDescription.InnerFire;
		this.m.Icon = "ui/perks/perk_priest_innerfire.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.innerfire_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/priest_innerfire_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.innerfire_skill");
	}
});