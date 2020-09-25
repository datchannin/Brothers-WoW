/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.hemorrhage_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.hemorrhage";
		this.m.Name = "Hemorrhage";
		this.m.Icon = "ui/perks/perk_rogue_hemorrhage.png";
		this.m.IconMini = "effect_mini_hemorrhage";
		this.m.Overlay = "skill_rogue_hemorrhage";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Damage taken by this character is increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color] for " + this.m.TurnsLeft + "[/color] more turn(s).";
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

	function onAdded()
	{
		this.m.TurnsLeft = 2;
	}

	function reset()
	{
		this.m.TurnsLeft = 2;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		_properties.DamageReceivedTotalMult *= 1.1;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});

