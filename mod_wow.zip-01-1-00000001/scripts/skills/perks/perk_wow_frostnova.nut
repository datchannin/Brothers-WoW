/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_frostnova <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.frostnova";
		this.m.Name = this.Const.Wow_strings.PerkName.Frostnova;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Frostnova;
		this.m.Icon = "ui/perks/perk_mage_frostnova.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.frostnova_skill"))
		{
			//this.m.Container.add(this.new("scripts/skills/actives/mage_frostnova_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.frostnova_skill");
	}
});