this.perk_wow_divineshield <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.divineshield";
		this.m.Name = this.Const.Wow_strings.PerkName.DivineShield;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DivineShield;
		this.m.Icon = "ui/perks/perk_paladin_divineshield.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});