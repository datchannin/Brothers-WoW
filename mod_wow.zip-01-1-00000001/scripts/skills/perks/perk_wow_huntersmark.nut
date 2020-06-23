this.perk_wow_huntersmark <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.huntersmark";
		this.m.Name = this.Const.Wow_strings.PerkName.HuntersMark;
		this.m.Description = this.Const.Wow_strings.PerkDescription.HuntersMark;
		this.m.Icon = "ui/perks/perk_hunter_huntersmark.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});