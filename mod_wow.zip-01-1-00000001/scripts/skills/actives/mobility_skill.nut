/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.01, game_version = 1.4.0.40*/
this.mobility_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.mobility";
		this.m.Name = "Mobility";
		this.m.Description = "Focus on this battle. Do more, but pay the full price.";
		this.m.Icon = "ui/perks/skill_warrior_mobility.png";
		this.m.IconDisabled = "ui/perks/skill_warrior_mobility_sw.png";
		this.m.Overlay = "skill_warrior_mobility";
		this.m.SoundOnUse = [
			"sounds/combat/warrior_mobility1.wav",
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 7;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = [
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
				id = 7,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "Using this gives you 2 additional Action Points."
			}
		];
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		_user.setActionPoints(this.Math.min(_user.getActionPointsMax(), _user.getActionPoints() + 2));

		return true;
	}

});

