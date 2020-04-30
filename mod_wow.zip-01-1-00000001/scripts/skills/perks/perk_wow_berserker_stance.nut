this.perk_wow_berserker_stance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.berserker_stance";
		this.m.Name = this.Const.Wow_strings.PerkName.BerserkerStance;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BerserkerStance;
		this.m.Icon = "ui/perks/perk_warrior_berserkerstance.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
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
		_properties.DamageReceivedTotalMult *= 1.1;
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
			_properties.DamageTotalMult *= 1.1;
		}
	}

});