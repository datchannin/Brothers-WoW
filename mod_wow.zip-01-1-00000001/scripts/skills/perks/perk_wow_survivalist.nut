this.perk_wow_survivalist <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.survivalist";
		this.m.Name = this.Const.Wow_strings.PerkName.Survivalist;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Survivalist;
		this.m.Icon = "ui/perks/perk_hunter_survivalist.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});