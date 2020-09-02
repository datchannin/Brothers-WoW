/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.41*/
this.perk_wow_moonfury <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.moonfury";
		this.m.Name = this.Const.Wow_strings.PerkName.Moonfury;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Moonfury;
		this.m.Icon = "ui/perks/perk_druid_moonfury.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.moonfury_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_moonfury_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.moonfury_skill");
	}
});