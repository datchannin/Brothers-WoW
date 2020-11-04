/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.manashield_effect <- this.inherit("scripts/skills/skill", {
	m = {
		DamageTakenReduce = 10
	},
	function create()
	{
		this.m.ID = "effects.manashield";
		this.m.Name = "Mana Shield";
		this.m.Description = "Mage can use his mana to decrease damage taken.";
		this.m.Icon = "ui/perks/perk_mage_manashield.png";
		this.m.IconMini = "effect_mini_manashield";
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
				icon = "ui/icons/damage_received.png",
				text = "Damage received is decreased by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.DamageTakenReduce + "%[/color]"
			}
		];
	}

	function setValue( _d )
	{
		this.m.DamageTakenReduce = _d;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		local adding = this.m.DamageTakenReduce * 0.01;
		_properties.DamageReceivedTotalMult *= (1 - adding);
	}
});

