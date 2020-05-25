this.perk_wow_masterflail <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.masterflail";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterFlail;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterFlail;
		this.m.Icon = "ui/perks/perk_rogue_masterflail.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});