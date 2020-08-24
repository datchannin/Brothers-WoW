/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.perk_wow_heal <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.heal";
		this.m.Name = this.Const.Wow_strings.PerkName.Heal;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Heal;
		this.m.Icon = "ui/perks/perk_priest_heal.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.heal_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/priest_heal_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.heal_skill");
	}
});