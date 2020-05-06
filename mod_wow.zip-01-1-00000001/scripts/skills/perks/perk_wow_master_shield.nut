this.perk_wow_master_shield <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.master_shield";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterShield;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterShield;
		this.m.Icon = "ui/perks/perk_warrior_mastershield.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInShields = true;
	}
});