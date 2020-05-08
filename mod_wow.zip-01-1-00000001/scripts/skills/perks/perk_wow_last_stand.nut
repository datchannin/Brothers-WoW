this.perk_wow_last_stand <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.last_stand";
		this.m.Name = this.Const.Wow_strings.PerkName.LastStand;
		this.m.Description = this.Const.Wow_strings.PerkDescription.LastStand;
		this.m.Icon = "ui/perks/perk_warrior_laststand.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});