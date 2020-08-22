/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.08, game_version = 1.4.0.39*/
this.perk_wow_repairmaster <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.repairmaster";
		this.m.Name = this.Const.Wow_strings.PerkName.RepairMaster;
		this.m.Description = this.Const.Wow_strings.PerkDescription.RepairMaster;
		this.m.Icon = "ui/perks/perk_priest_repairmaster.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});