/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_fear <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.fear";
		this.m.Name = this.Const.Wow_strings.PerkName.Fear;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Fear;
		this.m.Icon = "ui/perks/perk_warlock_fear.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.fear_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warlock_fear_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.fear_skill");
	}
});