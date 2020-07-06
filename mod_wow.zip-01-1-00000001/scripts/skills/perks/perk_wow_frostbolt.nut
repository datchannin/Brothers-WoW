this.perk_wow_frostbolt <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.frostbolt";
		this.m.Name = this.Const.Wow_strings.PerkName.Frostbolt;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Frostbolt;
		this.m.Icon = "ui/perks/perk_mage_frostbolt.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});