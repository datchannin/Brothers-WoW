/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.berserkerrage_effect <- this.inherit("scripts/skills/skill", {
	m = {
		MultValue = 25
	},
	function create()
	{
		this.m.ID = "effects.berserkerrage";
		this.m.Name = "Berserker Rage";
		this.m.Description = "Your rage gives you possibility to increase damage done for one turn.";
		this.m.Icon = "ui/perks/effect_warrior_berserkerrage.png";
		this.m.IconMini = "effect_mini_berserkerrage";
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
				text = "Damage done will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MultValue + "%[/color]"
			}
		];
	}

	function setValue( _d )
	{
		this.m.MultValue = _d;
	}

	function onUpdate( _properties )
	{
		local adding = this.m.MultValue * 0.01;
		_properties.DamageTotalMult *= (1 + adding);
	}

	function onTurnStart()
	{
		this.removeSelf();
	}
});