this.perk_wow_blessingofmight <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.blessingofmight";
		this.m.Name = this.Const.Wow_strings.PerkName.BlessingofMight;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BlessingofMight;
		this.m.Icon = "ui/perks/perk_paladin_blessingofmight.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});