/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.perk_wow_drainstamina <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.drainstamina";
		this.m.Name = this.Const.Wow_strings.PerkName.DrainStamina;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DrainStamina;
		this.m.Icon = "ui/perks/perk_warlock_drainstamina.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.drainstamina_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warlock_drainstamina_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.drainstamina_skill");
	}
});