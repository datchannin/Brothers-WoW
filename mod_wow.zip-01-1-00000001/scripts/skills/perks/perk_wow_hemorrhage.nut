/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.perk_wow_hemorrhage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.hemorrhage";
		this.m.Name = this.Const.Wow_strings.PerkName.Hemorrhage;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Hemorrhage;
		this.m.Icon = "ui/perks/perk_rogue_hemorrhage.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.hemorrhage_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/rogue_hemorrhage_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.hemorrhage_skill");
	}
});