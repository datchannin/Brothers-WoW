/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.druid_dash_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseDuration = 1
	},
	function create()
	{
		this.m.ID = "actives.dash_skill";
		this.m.Name = "Dash";
		this.m.Description = "Allows druid to move faster. Action Point costs for movement on all terrain will be [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] point per tile. And fatigue cost will be [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] points per tile.";
		this.m.Icon = "ui/perks/skill_druid_dash.png";
		this.m.IconDisabled = "ui/perks/skill_druid_dash_sw.png";
		this.m.Overlay = "skill_druid_dash";
		this.m.SoundOnUse = [
			"sounds/combat/rogue_sprint.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTotalDuration()
	{
		local duration = this.m.BaseDuration;

		return duration;
	}

	function getTooltip()
	{
		local duration = getTotalDuration();
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
				icon = "ui/icons/special.png",
				text = "Action Point and fatigue costs for movement on all terrain will be reduced. Effect duration is [color=" + this.Const.UI.Color.PositiveValue + "]" + duration + "[/color] turn(s)"
			}
		];
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.catform"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUpdate( _properties )
	{
	}

	function onUse( _user, _targetTile )
	{
		local dash = _user.getSkills().getSkillByID("effects.dash");
		local duration = getTotalDuration();

		if (dash != null)
		{
			dash.reset();
		}
		else
		{
			local effect = this.new("scripts/skills/effects/dash_effect");
			effect.setDuration(duration);
			_user.getSkills().add(effect);
		}

		return true;
	}
});