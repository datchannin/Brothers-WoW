this.perk_wow_petsummon <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.petsummon";
		this.m.Name = this.Const.Wow_strings.PerkName.Petsummon;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Petsummon;
		this.m.Icon = "ui/perks/perk_hunter_petsummon.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});