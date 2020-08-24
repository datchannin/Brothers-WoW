/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.blessingofmight_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.blessingofmight";
		this.m.Name = "Blessing of Might";
		this.m.Icon = "ui/perks/perk_paladin_blessingofmight.png";
		this.m.IconMini = "effect_mini_blessingofmight";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is under powerful buff for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] Damage"
			}
		];
	}

	function reset()
	{
		if (this.m.TurnsLeft != 2)
		{
			this.m.TurnsLeft = 2;
		}
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult *= 1.2;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});