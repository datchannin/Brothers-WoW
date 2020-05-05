this.perk_wow_master_hammer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.master_hammer";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterHammer;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterHammer;
		this.m.Icon = "ui/perks/perk_warrior_masterhammer.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});