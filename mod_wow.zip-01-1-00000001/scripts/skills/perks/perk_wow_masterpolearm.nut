this.perk_wow_masterpolearm <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.masterpolearm";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterPolearm;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterPolearm;
		this.m.Icon = "ui/perks/perk_mage_masterpolearm.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});