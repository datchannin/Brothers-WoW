/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.perk_wow_frostbolt <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.frostbolt";
		this.m.Name = this.Const.Wow_strings.PerkName.Frostbolt;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Frostbolt;
		this.m.Icon = "ui/perks/perk_mage_frostbolt.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.frostbolt_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/mage_frostbolt_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.frostbolt_skill");
	}
});