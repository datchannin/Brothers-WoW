/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_pyroblast <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.pyroblast";
		this.m.Name = this.Const.Wow_strings.PerkName.Pyroblast;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Pyroblast;
		this.m.Icon = "ui/perks/perk_mage_pyroblast.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pyroblast_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/mage_pyroblast_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.pyroblast_skill");
	}
});