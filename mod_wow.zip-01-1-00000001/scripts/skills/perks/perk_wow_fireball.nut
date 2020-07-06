this.perk_wow_fireball <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.fireball";
		this.m.Name = this.Const.Wow_strings.PerkName.Fireball;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Fireball;
		this.m.Icon = "ui/perks/perk_mage_fireball.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});