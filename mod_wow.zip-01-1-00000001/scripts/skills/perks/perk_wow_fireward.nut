this.perk_wow_fireward <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.fireward";
		this.m.Name = this.Const.Wow_strings.PerkName.FireWard;
		this.m.Description = this.Const.Wow_strings.PerkDescription.FireWard;
		this.m.Icon = "ui/perks/perk_mage_fireward.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});