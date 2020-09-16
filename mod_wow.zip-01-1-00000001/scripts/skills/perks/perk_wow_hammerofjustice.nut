/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 081, game_version = 1.4.0.41*/
this.perk_wow_hammerofjustice <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.hammerofjustice";
		this.m.Name = this.Const.Wow_strings.PerkName.HammerofJustice;
		this.m.Description = this.Const.Wow_strings.PerkDescription.HammerofJustice;
		this.m.Icon = "ui/perks/perk_paladin_hammerofjustice.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.hammerofjustice_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/paladin_hammerofjustice_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.hammerofjustice_skill");
	}
});