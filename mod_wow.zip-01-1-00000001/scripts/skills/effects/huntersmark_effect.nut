this.huntersmark_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.huntersmark";
		this.m.Name = "Hunter\'s Mark";
		this.m.Icon = "ui/perks/perk_hunter_huntersmark.png";
		this.m.IconMini = "effect_mini_huntersmark";
		this.m.Overlay = "skill_hunter_huntersmark";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Damage taken by this character is increased by [color=" + this.Const.UI.Color.NegativeValue + "]5%[/color] for [color=" + this.Const.UI.Color.NegativeValue + "] + this.m.TurnsLeft + [/color] more turn(s).";
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
				text = "Damage taken increased by [color=" + this.Const.UI.Color.NegativeValue + "]5%[/color]"
			},
		];
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		_properties.DamageReceivedTotalMult *= 1.05;
	}

	function resetTime()
	{
		this.m.TurnsLeft = 2;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 2;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});

