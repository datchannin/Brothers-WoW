this.perk_wow_camouflage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.camouflage";
		this.m.Name = this.Const.Wow_strings.PerkName.Camouflage;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Camouflage;
		this.m.Icon = "ui/perks/perk_rogue_camouflage.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});