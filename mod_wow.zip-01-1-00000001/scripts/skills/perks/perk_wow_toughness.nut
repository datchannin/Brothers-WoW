/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.perk_wow_toughness <- this.inherit("scripts/skills/skill", {
	m = {
		BaseValue = 3,
		WarriorLevel = 1
	},
	function create()
	{
		this.m.ID = "perk.wow.warrior.toughness";
		this.m.Name = this.Const.Wow_strings.PerkName.Toughness;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Toughness;
		this.m.Icon = "ui/perks/perk_warrior_toughness.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getValue()
	{
		local result = this.m.BaseValue;
		local scale_value = 0;

		scale_value = this.m.WarriorLevel * Const.WarriorScale.toughness;

		result += scale_value;
		
		return result;
	}

	function getDescription()
	{
		local value = getValue();
	
		return "You have skill in armor using. Armor damage taken is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + value + "%[/color]";
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local value = getValue();
		local value_percent = value * 0.01;

		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill != null && !_skill.isAttack())
		{
			return;
		}

		_properties.DamageReceivedArmorMult *= (1 - value_percent);
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.WarriorLevel = user.getLevel();
	}
});