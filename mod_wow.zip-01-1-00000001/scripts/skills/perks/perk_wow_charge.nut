/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_charge <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.charge";
		this.m.Name = this.Const.Wow_strings.PerkName.Charge;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Charge;
		this.m.Icon = "ui/perks/perk_warrior_charge.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}	
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.charge_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warrior_charge_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.charge_skill");
	}
});