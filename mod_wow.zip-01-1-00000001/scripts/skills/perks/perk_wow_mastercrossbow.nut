this.perk_wow_mastercrossbow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.mastercrossbow";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterCrossbow;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterCrossbow;
		this.m.Icon = "ui/perks/perk_hunter_mastercrossbow.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});