this.perk_wow_sealofcommand <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.sealofcommand";
		this.m.Name = this.Const.Wow_strings.PerkName.SealofCommand;
		this.m.Description = this.Const.Wow_strings.PerkDescription.SealofCommand;
		this.m.Icon = "ui/perks/perk_paladin_sealofcommand.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});