/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.perk_wow_sanctityaura <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.sanctityaura";
		this.m.Name = this.Const.Wow_strings.PerkName.SanctityAura;
		this.m.Description = this.Const.Wow_strings.PerkDescription.SanctityAura;
		this.m.Icon = "ui/perks/perk_paladin_sanctityaura.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.sanctityaura_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/paladin_sanctityaura_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.sanctityaura_skill");
	}
});