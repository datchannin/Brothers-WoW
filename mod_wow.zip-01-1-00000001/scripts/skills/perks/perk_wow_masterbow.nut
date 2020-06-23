this.perk_wow_masterbow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.masterbow";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterBow;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterBow;
		this.m.Icon = "ui/perks/perk_hunter_masterbow.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});