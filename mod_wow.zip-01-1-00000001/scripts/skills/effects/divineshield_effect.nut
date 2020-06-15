this.divineshield_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 1
	},
	function create()
	{
		this.m.ID = "effects.divineshield";
		this.m.Name = "Divine Shield";
		this.m.Description = "This powerful buff gives you Immunity for one turn.";
		this.m.Icon = "ui/perks/perk_paladin_divineshield.png";
		this.m.IconMini = "effect_mini_divineshield";
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
				icon = "ui/icons/special.png",
				text = "You have Immunity for one turn."
			}
		];
	}

	function onAdded()
	{
		this.m.TurnsLeft = 1;
	}

	function onTurnEnd()
	{
		if (this.m.TurnsLeft == 0)
		{
			this.removeSelf();
		}
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult = 0;
		_properties.IsImmuneToOverwhelm = true;
		_properties.IsImmuneToZoneOfControl = true;
		_properties.IsImmuneToStun = true;
		_properties.IsImmuneToRoot = true;
		_properties.IsImmuneToKnockBackAndGrab = true;
		_properties.IsImmuneToDisarm = true;
		_properties.IsImmuneToSurrounding = true;
		_properties.IsImmuneToBleeding = true;
		_properties.IsImmuneToPoison = true;
		_properties.IsImmuneToDamageReflection = true;
	}

	function onTurnStart()
	{
		this.m.TurnsLeft = 0;
	}
});