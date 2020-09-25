/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.mentalstrength_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 1,
		BaseValue = 10,
	},	

	function create()
	{
		this.m.ID = "effects.mentalstrength";
		this.m.Name = "Mental Strength";
		this.m.Icon = "ui/perks/perk_priest_mentalstrength.png";
		this.m.IconMini = "effect_mini_mentalstrength";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is under \'Mental Strength\' effect, armor damage taken is reduces by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.BaseValue + "%[/color] for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function resetTime( _t )
	{
		this.m.TurnsLeft = _t;
	}

	function setValue( _d1 )
	{
		this.m.BaseValue = _d1;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local value = this.m.BaseValue;
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
	}
});