/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.rogue_sprint_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseDuration = 1
	},
	function create()
	{
		this.m.ID = "actives.sprint_skill";
		this.m.Name = "Sprint";
		this.m.Description = "Allows rogue to move faster. Action Point costs for movement on all terrain will be [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] point per tile. And fatigue cost will be [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] points per tile.";
		this.m.Icon = "ui/perks/skill_rogue_sprint.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_sprint_sw.png";
		this.m.Overlay = "skill_rogue_sprint";
		this.m.SoundOnUse = [
			//"sounds/combat/rogue_sprint.wav"
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

	function onUpdate( _properties )
	{
	}

	function onUse( _user, _targetTile )
	{
		local sprint = _user.getSkills().getSkillByID("effects.sprint");
		local duration = getTotalDuration();

		if (sprint != null)
		{
			sprint.reset();
		}
		else
		{
			local effect = this.new("scripts/skills/effects/sprint_effect");
			effect.setDuration(duration);
			_user.getSkills().add(effect);
		}

		return true;
	}
});