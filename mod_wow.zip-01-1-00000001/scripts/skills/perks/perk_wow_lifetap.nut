/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.perk_wow_lifetap <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.lifetap";
		this.m.Name = this.Const.Wow_strings.PerkName.LifeTap;
		this.m.Description = this.Const.Wow_strings.PerkDescription.LifeTap;
		this.m.Icon = "ui/perks/perk_warlock_lifetap.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.lifetap_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/warlock_lifetap_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.lifetap_skill");
	}
});