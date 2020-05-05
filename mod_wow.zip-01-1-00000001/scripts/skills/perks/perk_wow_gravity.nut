this.perk_wow_gravity <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.gravity";
		this.m.Name = this.Const.Wow_strings.PerkName.Gravity;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Gravity;
		this.m.Icon = "ui/perks/perk_warrior_gravity.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});