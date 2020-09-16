/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.perk_wow_feralcharge <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.feralcharge";
		this.m.Name = this.Const.Wow_strings.PerkName.FeralCharge;
		this.m.Description = this.Const.Wow_strings.PerkDescription.FeralCharge;
		this.m.Icon = "ui/perks/perk_druid_feralcharge.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.feralcharge_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_feralcharge_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.feralcharge_skill");
	}
});