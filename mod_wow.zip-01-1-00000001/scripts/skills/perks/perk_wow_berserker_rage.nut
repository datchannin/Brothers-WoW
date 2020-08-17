/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.05, game_version = 1.4.0.37*/
this.perk_wow_berserker_rage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.berserker_rage";
		this.m.Name = this.Const.Wow_strings.PerkName.BerserkerRage;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BerserkerRage;
		this.m.Icon = "ui/perks/perk_warrior_berserkerrage.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.berserkerrage_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warrior_berserkerrage_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.berserkerrage_skill");
	}
});