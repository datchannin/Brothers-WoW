this.perk_wow_manashield <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.manashield";
		this.m.Name = this.Const.Wow_strings.PerkName.ManaShield;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ManaShield;
		this.m.Icon = "ui/perks/perk_mage_manashield.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});