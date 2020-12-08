/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.combopoint_effect <- this.inherit("scripts/skills/skill", {
	m = {
		ComboPointQuantity = 0,
		ComboPointMaximum = 5
	},
	function create()
	{
		this.m.ID = "effects.combopoint";
		this.m.Name = "Combo Points";
		this.m.Icon = "ui/perks/perk_rogue_combopoint_0.png";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = false;
	}

	function addComboPoint()
	{
		if (this.m.ComboPointQuantity < this.m.ComboPointMaximum)
		{
			this.m.ComboPointQuantity++;
		}
	}

	function resetComboPoint()
	{
		this.m.ComboPointQuantity = 0;
	}	

	function getDescription()
	{
		return "This character can use Combo Points. He can take points after some hits and spend it to finish move.";
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

	function onUpdate( _properties )
	{
		if (this.m.ComboPointQuantity == 0)
		{
			this.m.Icon = "ui/perks/perk_rogue_combopoint_0.png";
		}
		else if (this.m.ComboPointQuantity == 1)
		{
			this.m.Icon = "ui/perks/perk_rogue_combopoint_1.png";
		}
		else if (this.m.ComboPointQuantity == 2)
		{
			this.m.Icon = "ui/perks/perk_rogue_combopoint_2.png";
		}
		else if (this.m.ComboPointQuantity == 3)
		{
			this.m.Icon = "ui/perks/perk_rogue_combopoint_3.png";
		}
		else if (this.m.ComboPointQuantity == 4)
		{
			this.m.Icon = "ui/perks/perk_rogue_combopoint_4.png";
		}
		else if (this.m.ComboPointQuantity == 5)
		{
			this.m.Icon = "ui/perks/perk_rogue_combopoint_5.png";
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
	}
});