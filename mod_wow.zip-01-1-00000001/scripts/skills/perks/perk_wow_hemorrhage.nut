this.perk_wow_hemorrhage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.hemorrhage";
		this.m.Name = this.Const.Wow_strings.PerkName.Hemorrhage;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Hemorrhage;
		this.m.Icon = "ui/perks/perk_rogue_hemorrhage.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});