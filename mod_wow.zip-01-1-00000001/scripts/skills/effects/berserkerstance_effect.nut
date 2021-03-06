/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.berserkerstance_effect <- this.inherit("scripts/skills/skill", {
	m = {
		DamageDoneValue = 10
	},
	function create()
	{
		this.m.ID = "effects.berserkerstance";
		this.m.Name = "Berserker Stance";
		this.m.Description = "An aggressive stance. Damage done is increased but all direct damage taken is increased too.";
		this.m.Icon = "ui/perks/perk_warrior_berserkerstance.png";
		this.m.IconMini = "effect_mini_berserkerstance";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function setDamageDoneValue( _d_ )
	{
		this.m.DamageDoneValue = _d_;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.DamageDoneValue + "%[/color]"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Damage received is increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]"
			}
		];
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		_properties.DamageReceivedTotalMult *= 1.1;
	}

	function onUpdate( _properties )
	{
		local adding = this.m.DamageDoneValue * 0.01;
		_properties.DamageTotalMult *= (1 + adding);
		_properties.TargetAttractionMult *= 1.1;
	}
});

