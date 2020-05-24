this.perk_wow_kick <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.kick";
		this.m.Name = this.Const.Wow_strings.PerkName.Kick;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Kick;
		this.m.Icon = "ui/perks/perk_rogue_kick.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});