this.perk_wow_endurance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.endurance";
		this.m.Name = this.Const.Wow_strings.PerkName.Endurance;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Endurance;
		this.m.Icon = "ui/perks/perk_rogue_endurance.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});