/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.41*/
this.perk_wow_inspiration <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.inspiration";
		this.m.Name = this.Const.Wow_strings.PerkName.Inspiration;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Inspiration;
		this.m.Icon = "ui/perks/perk_priest_inspiration.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});