this.perk_wow_holypower <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.holypower";
		this.m.Name = this.Const.Wow_strings.PerkName.HolyPower;
		this.m.Description = this.Const.Wow_strings.PerkDescription.HolyPower;
		this.m.Icon = "ui/perks/perk_paladin_holypower.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});