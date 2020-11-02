/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warrior_mobility_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ChargeMax = 4,
		ChargeCurrent = 0,
		T0_warrior_armor = false
	},
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
				text = "Using this gives you 2 additional Action Points. You can use it no more than [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.ChargeMax + "[/color] times per turn."
			}
		];
		
		if (this.m.ChargeCurrent)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You have [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.ChargeCurrent + "[/color] more charges to use it on this turn."
			});
		}
		else
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You can not use it now."
			});
		}
		
		return ret;
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			if (this.m.ChargeCurrent > 0)
			{
				return true;
			}
		}
		
		return false;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.T0_warrior_armor = _properties.T0_warrior_armor;
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.T0_warrior_armor)
		{
			this.m.FatigueCost = 6;
		}
		else
		{
			this.m.FatigueCost = 7;
		}
	}

	function onTurnStart()
	{
		this.m.ChargeCurrent = this.m.ChargeMax;
	}

	function onUse( _user, _targetTile )
	{
		this.m.ChargeCurrent = this.m.ChargeCurrent - 1;
		_user.setActionPoints(this.Math.min(_user.getActionPointsMax(), _user.getActionPoints() + 2));

		return true;
	}

});

