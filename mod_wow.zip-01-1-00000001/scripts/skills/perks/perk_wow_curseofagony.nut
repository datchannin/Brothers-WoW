/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.perk_wow_curseofagony <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.curseofagony";
		this.m.Name = this.Const.Wow_strings.PerkName.CurseofAgony;
		this.m.Description = this.Const.Wow_strings.PerkDescription.CurseofAgony;
		this.m.Icon = "ui/perks/perk_warlock_curseofagony.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.curseofagony_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warlock_curseofagony_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.curseofagony_skill");
	}
});