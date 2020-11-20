/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_defensive_stance <- this.inherit("scripts/skills/skill", {
	m = {
		BaseMultTakeValue = 10,
		T0_warrior_set = false
	},
	function create()
	{
		this.m.ID = "perk.wow.warrior.defensive_stance";
		this.m.Name = this.Const.Wow_strings.PerkName.DefensiveStance;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DefensiveStance;
		this.m.Icon = "ui/perks/perk_warrior_defensivestance.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getMultValue()
	{
		local total_mult_value = this.m.BaseMultTakeValue;

		if (this.m.T0_warrior_set)
		{
			total_mult_value += 5;
		}

		return total_mult_value;
	}

	function onCombatStarted()
	{
		local total_mult_value = getMultValue();
		local effect = this.new("scripts/skills/effects/defensivestance_effect");
		effect.setDamageTakenValue(total_mult_value);
		this.getContainer().add(effect);
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.defensivestance");
	}
	
	function onUpdate( _properties )
	{
		this.m.T0_warrior_set = _properties.isFullSetWarriorT0();
	}
});