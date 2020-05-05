this.perk_wow_blood_thirst <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.blood_thirst";
		this.m.Name = this.Const.Wow_strings.PerkName.BloodThirst;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BloodThirst;
		this.m.Icon = "ui/perks/perk_warrior_bloodthirst.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});