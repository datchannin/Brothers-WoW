/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.greatnessofmind_effect <- this.inherit("scripts/skills/skill", {
	m = {
		ExpBonus = 40
	},
	function create()
	{
		this.m.ID = "effects.greatnessofmind";
		this.m.Name = "Greatness of Mind";
		this.m.Description = "One of your companions cleared your mind. You get additional experience from battle.";
		this.m.Icon = "ui/perks/perk_mage_greatnessofmind.png";
		this.m.IconMini = "effect_mini_greatnessofmind";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/xp_received.png",
			text = "Get [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.ExpBonus + "%[/color] additional experience from battle"
		});

		return ret;
	}

	function SetValue( _d )
	{
		this.m.ExpBonus = _d;
	}

	function onUpdate( _properties )
	{
		local bonus_percent = this.m.ExpBonus;
		local bonus = (bonus_percent * 0.01) + 1;
		_properties.XPGainMult *= bonus;
	}
});

