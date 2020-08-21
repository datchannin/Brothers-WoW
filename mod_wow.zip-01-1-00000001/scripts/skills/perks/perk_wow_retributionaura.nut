/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.perk_wow_retributionaura <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.retributionaura";
		this.m.Name = this.Const.Wow_strings.PerkName.RetributionAura;
		this.m.Description = this.Const.Wow_strings.PerkDescription.RetributionAura;
		this.m.Icon = "ui/perks/perk_paladin_retributionaura.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.retributionaura_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/paladin_retributionaura_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.retributionaura_skill");
	}
});