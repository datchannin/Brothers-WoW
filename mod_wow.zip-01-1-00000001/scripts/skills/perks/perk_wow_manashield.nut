/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_manashield <- this.inherit("scripts/skills/skill", {
	m = {
		BaseMultTakenValue = 10,
		T0_mage_head = false
	},
	function create()
	{
		this.m.ID = "perk.wow.mage.manashield";
		this.m.Name = this.Const.Wow_strings.PerkName.ManaShield;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ManaShield;
		this.m.Icon = "ui/perks/perk_mage_manashield.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getMultValue()
	{
		local total_mult_value = this.m.BaseMultTakenValue;

		if (this.m.T0_mage_head)
		{
			total_mult_value += 5;
		}

		return total_mult_value;
	}

	function onCombatStarted()
	{
		local total_mult_value = getMultValue();
		local effect = this.new("scripts/skills/effects/manashield_effect");
		effect.setValue(total_mult_value);
		this.getContainer().add(effect);
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.manashield");
	}
	
	function onUpdate( _properties )
	{
		this.m.T0_mage_head = _properties.T0_mage_head;
	}
});