this.perk_wow_charge <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.charge";
		this.m.Name = this.Const.Wow_strings.PerkName.Charge;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Charge;
		this.m.Icon = "ui/perks/perk_warrior_charge.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});