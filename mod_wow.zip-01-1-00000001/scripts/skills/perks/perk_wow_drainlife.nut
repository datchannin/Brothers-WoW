/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_drainlife <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.drainlife";
		this.m.Name = this.Const.Wow_strings.PerkName.DrainLife;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DrainLife;
		this.m.Icon = "ui/perks/perk_warlock_drainlife.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.drainlife_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warlock_drainlife_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.drainlife_skill");
	}
});