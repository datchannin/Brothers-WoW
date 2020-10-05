/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.freeze_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},	
	
	function create()
	{
		this.m.ID = "effects.freeze";
		this.m.Name = "Frozen";
		this.m.Icon = "ui/perks/effect_mage_freeze.png";
		this.m.IconMini = "effect_mini_freeze";
		this.m.SoundOnUse = [
			"sounds/combat/mage_freeze_effect.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}


	function getDescription()
	{
		return "This character is under freeze effect. He is weaken and will be weaken for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
				id = 11,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Action Points"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35%[/color] Max Fatigue"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35%[/color] Initiative"
			}
		];
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		_properties.InitiativeMult *= 0.65;
		_properties.StaminaMult *= 0.65;
		_properties.ActionPoints -= 2;
	}

	function resetTime()
	{
		this.m.TurnsLeft = 2;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 2;
		
		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.2, this.getContainer().getActor().getPos());
		}
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});