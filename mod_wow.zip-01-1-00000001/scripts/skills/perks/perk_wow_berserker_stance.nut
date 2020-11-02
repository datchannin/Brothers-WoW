/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_berserker_stance <- this.inherit("scripts/skills/skill", {
	m = {
		BaseMultDoneValue = 10,
		T0_warrior_set = false
	},
	function create()
	{
		this.m.ID = "perk.wow.warrior.berserker_stance";
		this.m.Name = this.Const.Wow_strings.PerkName.BerserkerStance;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BerserkerStance;
		this.m.Icon = "ui/perks/perk_warrior_berserkerstance.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getMultValue()
	{
		local total_mult_value = this.m.BaseMultDoneValue;

		if (this.m.T0_warrior_set)
		{
			total_mult_value += 5;
		}

		return total_mult_value;
	}

	function onCombatStarted()
	{
		local total_mult_value = getMultValue();
		local effect = this.new("scripts/skills/effects/berserkerstance_effect");
		effect.setDamageDoneValue(total_mult_value);
		this.getContainer().add(effect);
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.berserkerstance");
	}
	
	function onUpdate( _properties )
	{
		this.m.T0_warrior_set = _properties.isFullSetWarriorT0();
	}
});