this.perk_wow_masterdagger <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.masterdagger";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterDagger;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterDagger;
		this.m.Icon = "ui/perks/perk_rogue_masterdagger.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});