this.perk_wow_masterthrowing <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.masterthrowing";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterThrowing;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterThrowing;
		this.m.Icon = "ui/perks/perk_hunter_masterthrowing.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});