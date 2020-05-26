this.hemorrhage_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.hemorrhage";
		this.m.Name = "Hemorrhage";
		this.m.Icon = "ui/perks/perk_rogue_hemorrhage.png";
		this.m.IconMini = "perk_30_mini";
		this.m.Overlay = "perk_30";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Damage taken by this character is increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color] for this turn.";
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
				id = 6,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Damage taken increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]"
			},
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

	function onTurnStart()
	{
		this.removeSelf();
	}

});

