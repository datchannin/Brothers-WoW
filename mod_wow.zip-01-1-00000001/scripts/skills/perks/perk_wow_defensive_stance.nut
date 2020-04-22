this.perk_wow_defensive_stance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.defensive_stance";
		this.m.Name = this.Const.Wow_strings.PerkName.DefensiveStance;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DefensiveStance;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		_properties.DamageReceivedTotalMult *= 0.9;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}

		if (_skill == null)
		{
			return;
		}
		else
		{
			_properties.DamageTotalMult *= 0.9;
		}
	}

});