this.perk_wow_retributionaura <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.retributionaura";
		this.m.Name = this.Const.Wow_strings.PerkName.RetributionAura;
		this.m.Description = this.Const.Wow_strings.PerkDescription.RetributionAura;
		this.m.Icon = "ui/perks/perk_paladin_retributionaura.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});