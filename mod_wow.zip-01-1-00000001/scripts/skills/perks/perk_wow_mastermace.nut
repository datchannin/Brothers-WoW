this.perk_wow_mastermace <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.mastermace";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterMace;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterMace;
		this.m.Icon = "ui/perks/perk_rogue_mastermace.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});