/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
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
		this.m.IconMini = "effect_mini_adrenalinerush";
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
			}
		];
	}

	function SetValue( _d )
	{
		this.m.ExpBonus = _d;
	}

	function onUpdate( _properties )
	{
		local bonus_percent = this.m.ExpBonus;
		local bonus = (bonus_percent * 0.01) + 1;
		this.logInfo("bonus = " + bonus);
		_properties.XPGainMult *= bonus;
	}
});

