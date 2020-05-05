this.perk_wow_master_axe <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.master_axe";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterAxe;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterAxe;
		this.m.Icon = "ui/perks/perk_warrior_masteraxe.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});