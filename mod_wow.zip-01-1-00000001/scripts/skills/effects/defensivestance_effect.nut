/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.defensivestance_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.defensivestance";
		this.m.Name = "Defensive Stance";
		this.m.Description = "A defensive combat stance. Damage done is decreased and all direct damage taken is decreased too.";
		this.m.Icon = "ui/perks/perk_warrior_defensivestance.png";
		this.m.IconMini = "effect_mini_defensivestance";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
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
				text = "Damage done is decreased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Damage received is decreased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]"
			}
		];
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		_properties.DamageReceivedTotalMult *= 0.9;
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult *= 0.9;
	}
});

