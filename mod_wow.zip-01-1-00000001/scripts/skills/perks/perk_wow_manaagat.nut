/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.perk_wow_manaagat <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.manaagat";
		this.m.Name = this.Const.Wow_strings.PerkName.ManaAgat;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ManaAgat;
		this.m.Icon = "ui/perks/perk_mage_manaagat.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.manaagat_skill"))
		{
			//this.m.Container.add(this.new("scripts/skills/actives/mage_manaagat_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.manaagat_skill");
	}
});