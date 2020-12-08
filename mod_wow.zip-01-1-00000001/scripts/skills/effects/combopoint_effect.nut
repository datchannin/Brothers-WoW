/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.combopoint_effect <- this.inherit("scripts/skills/skill", {
	m = {
		ComboPointQuantity = 0
	},
	function create()
	{
		this.m.ID = "effects.combopoint";
		this.m.Name = "Combo Points";
		this.m.Icon = "ui/perks/perk_rogue_sinisterstrike.png";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = false;
	}

	function addComboPoint()
	{
		this.m.ComboPointQuantity++;
	}

	function resetComboPoint()
	{
		this.m.ComboPointQuantity = 0;
	}	

	function getDescription()
	{
		return "This character has a Combo Point(s). He will be able use finish move soon!";
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
		if (this.m.ComboPointQuantity == 1)
		{
			this.m.Icon = "ui/perks/perk_rogue_sinisterstrike.png";
		}
		else if (this.m.ComboPointQuantity > 1)
		{
			this.m.Icon = "ui/perks/perk_rogue_sinisterstrike_sw.png";
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
	}
});