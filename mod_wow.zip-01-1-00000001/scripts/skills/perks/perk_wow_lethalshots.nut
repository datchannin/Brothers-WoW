this.perk_wow_lethalshots <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.lethalshots";
		this.m.Name = this.Const.Wow_strings.PerkName.LethalShots;
		this.m.Description = this.Const.Wow_strings.PerkDescription.LethalShots;
		this.m.Icon = "ui/perks/perk_hunter_lethalshots.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});