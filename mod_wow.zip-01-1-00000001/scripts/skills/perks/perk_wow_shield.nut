/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.perk_wow_shield <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.shield";
		this.m.Name = this.Const.Wow_strings.PerkName.Shield;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Shield;
		this.m.Icon = "ui/perks/perk_priest_shield.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.powerwordshield_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/priest_powerwordshield_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.powerwordshield_skill");
	}
});