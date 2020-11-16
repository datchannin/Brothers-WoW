/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.sprint_effect <- this.inherit("scripts/skills/skill", {
	m = {
		BaseDuration = 1,
		TurnsLeft = 1
	},
	function create()
	{
		this.m.ID = "effects.sprint";
		this.m.Name = "Sprint";
		this.m.Icon = "ui/perks/perk_rogue_sprint.png";
		this.m.IconMini = "effect_mini_sprint";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is under \'Sprint\' effect for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Action Point cost for movement now is [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] on all terrain"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Fatigue cost for movement now is [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] on all terrain"
			},
		];
	}

	function setDuration( _d )
	{
		this.m.BaseDuration = _d;
	}

	function onAdded()
	{
		this.m.TurnsLeft = this.m.BaseDuration;
	}

	function reset()
	{
		this.m.TurnsLeft = this.m.BaseDuration;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		actor.m.ActionPointCosts = this.Const.SprintMovementAPCost;
		actor.m.FatigueCosts = clone this.Const.SprintMovementFatigueCost;
		actor.m.LevelActionPointCost = 0;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			local actor = this.getContainer().getActor();
			actor.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
			actor.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
			actor.m.LevelActionPointCost = this.Const.Movement.LevelDifferenceActionPointCost;
			this.removeSelf();
		}
	}
});