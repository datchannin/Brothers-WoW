this.perk_wow_berserker_rage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.berserker_rage";
		this.m.Name = this.Const.Wow_strings.PerkName.BerserkerRage;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BerserkerRage;
		this.m.Icon = "ui/perks/perk_warrior_berserkerrage.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});