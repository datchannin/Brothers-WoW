/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.01, game_version = 1.4.0.40*/
this.perk_wow_mastershield <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.mastershield";
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
	
	function onCombatStarted()
	{
		this.getContainer().add(this.new("scripts/skills/effects/stunimmune_effect"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.stun_immun");
	}
});