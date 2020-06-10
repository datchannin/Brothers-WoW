this.perk_wow_holylight <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.holylight";
		this.m.Name = this.Const.Wow_strings.PerkName.Holylight;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Holylight;
		this.m.Icon = "ui/perks/perk_paladin_holylight.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});