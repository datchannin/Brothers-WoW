this.perk_wow_sanctityaura <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.sanctityaura";
		this.m.Name = this.Const.Wow_strings.PerkName.SanctityAura;
		this.m.Description = this.Const.Wow_strings.PerkDescription.SanctityAura;
		this.m.Icon = "ui/perks/perk_paladin_sanctityaura.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});