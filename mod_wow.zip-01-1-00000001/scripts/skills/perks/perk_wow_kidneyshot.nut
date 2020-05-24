this.perk_wow_kidneyshot <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.kidneyshot";
		this.m.Name = this.Const.Wow_strings.PerkName.KidneyShot;
		this.m.Description = this.Const.Wow_strings.PerkDescription.KidneyShot;
		this.m.Icon = "ui/perks/perk_rogue_kidneyshot.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});