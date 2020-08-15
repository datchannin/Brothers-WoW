/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
this.perk_wow_gravity <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.gravity";
		this.m.Name = this.Const.Wow_strings.PerkName.Gravity;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Gravity;
		this.m.Icon = "ui/perks/perk_warrior_gravity.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.gravity_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warrior_gravity_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.gravity_skill");
	}
});