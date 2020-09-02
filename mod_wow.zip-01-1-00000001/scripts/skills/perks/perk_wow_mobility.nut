/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.perk_wow_mobility <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.mobility";
		this.m.Name = this.Const.Wow_strings.PerkName.Mobility;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Mobility;
		this.m.Icon = "ui/perks/perk_warrior_mobility.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.mobility"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warrior_mobility_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.mobility");
	}

});

