this.perk_wow_poison <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.poison";
		this.m.Name = this.Const.Wow_strings.PerkName.Poison;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Poison;
		this.m.Icon = "ui/perks/perk_rogue_poison.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});