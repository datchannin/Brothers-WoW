/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_unbreakablewill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.unbreakablewill";
		this.m.Name = this.Const.Wow_strings.PerkName.UnbreakableWill;
		this.m.Description = this.Const.Wow_strings.PerkDescription.UnbreakableWill;
		this.m.Icon = "ui/perks/perk_priest_unbreakablewill.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});