this.perk_wow_unleashfury <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.unleashfury";
		this.m.Name = this.Const.Wow_strings.PerkName.UnleashFury;
		this.m.Description = this.Const.Wow_strings.PerkDescription.UnleashFury;
		this.m.Icon = "ui/perks/perk_hunter_unleashfury.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});