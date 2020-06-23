this.perk_wow_mendpet <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.mendpet";
		this.m.Name = this.Const.Wow_strings.PerkName.MendPet;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MendPet;
		this.m.Icon = "ui/perks/perk_hunter_mendpet.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});