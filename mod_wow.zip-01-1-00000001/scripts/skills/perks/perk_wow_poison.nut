/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.perk_wow_poison <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.poison";
		this.m.Name = this.Const.Wow_strings.PerkName.Poison;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Poison;
		this.m.Icon = "ui/perks/perk_rogue_poison.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.poison_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/rogue_poison_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.poison_skill");
	}
});