/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_sprint <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.sprint";
		this.m.Name = this.Const.Wow_strings.PerkName.Sprint;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Sprint;
		this.m.Icon = "ui/perks/perk_rogue_sprint.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.sprint_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/rogue_sprint_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.sprint_skill");
	}
});