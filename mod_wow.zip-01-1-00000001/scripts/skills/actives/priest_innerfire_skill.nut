/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.priest_innerfire_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.innerfire_skill";
		this.m.Name = "Inner Fire";
		this.m.Description = "Increases your Ranged and Melee Defense by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] points for [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] turns.";
		this.m.Icon = "ui/perks/skill_priest_innerfire.png";
		this.m.IconDisabled = "ui/perks/skill_priest_innerfire_sw.png";
		this.m.Overlay = "skill_priest_innerfire";
		this.m.SoundOnUse = [
			"sounds/combat/priest_innerfire.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 25;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color]"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Ranged Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color]"
			},
		];
	}

	function onUse( _user, _targetTile )
	{
		local effect = _user.getSkills().getSkillByID("effects.innerfire");

		if (effect != null)
		{
			effect.reset();
		}
		else
		{
			_user.getSkills().add(this.new("scripts/skills/effects/innerfire_effect"));
		}

		return true;
	}
});