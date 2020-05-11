this.perk_wow_defensive_stance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.defensive_stance";
		this.m.Name = this.Const.Wow_strings.PerkName.DefensiveStance;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DefensiveStance;
		this.m.Icon = "ui/perks/perk_warrior_defensivestance.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
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
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Damage"
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