this.perk_wow_master_sword <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.master_sword";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterSword;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterSword;
		this.m.Icon = "ui/perks/perk_warrior_mastersword.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInSwords = true;
	}
});