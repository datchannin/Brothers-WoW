/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.druid_frenziedregeneration_skill <- this.inherit("scripts/skills/skill", {
	m = {
		PercentRegenerate = 25
	},
	function create()
	{
		this.m.ID = "actives.frenziedregeneration_skill";
		this.m.Name = "Frenzied Regeneration";
		this.m.Description = "Bear can use this skill to regenerate part of his maximum Hitpoints.";
		this.m.Icon = "ui/perks/skill_druid_frenziedregeneration.png";
		this.m.IconDisabled = "ui/perks/skill_druid_frenziedregeneration_sw.png";
		this.m.Overlay = "skill_druid_frenziedregeneration";
		this.m.SoundOnUse = [
			"sounds/combat/druid_frienziedregeneration.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "You spend part of your turn to regenerate [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.PercentRegenerate + "[/color]% of your maximum Hitpoints."
		});

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.bearform"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUse( _user, _targetTile )
	{
		local MaximumHitpoints = _user.getHitpointsMax();
		local CurrentHitpoints = _user.getHitpoints();
		local AbsentHitpoints = MaximumHitpoints - CurrentHitpoints;
		local TryRegenerate = this.Math.floor((MaximumHitpoints*this.m.PercentRegenerate)/100);

		if (!AbsentHitpoints)
		{
			return true;
		}

		if (TryRegenerate >= AbsentHitpoints)
		{
			_user.setHitpoints(MaximumHitpoints);
		}
		else
		{
			_user.setHitpoints(CurrentHitpoints + TryRegenerate);
		}

		return true;
	}
});

