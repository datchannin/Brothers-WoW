/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warlock_lifetap_skill <- this.inherit("scripts/skills/skill", {
	m = {
		base_tap = 10,
	},
	function create()
	{
		this.m.ID = "actives.lifetap_skill";
		this.m.Name = "Life Tap";
		this.m.Description = "This skill allows you to reduce Fatigue using your Hitpoints.";
		this.m.Icon = "ui/perks/skill_warlock_lifetap.png";
		this.m.IconDisabled = "ui/perks/skill_warlock_lifetap_sw.png";
		this.m.Overlay = "skill_warlock_lifetap";
		this.m.SoundOnUse = [
			"sounds/combat/warlock_lifetap.wav"
		];
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = true;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
		this.m.MaxLevelDifference = 4;
	}

	function getTotalTap()
	{
		local total_tap = this.m.base_tap;

		return total_tap;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_tap = getTotalTap();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "You will lose [color=" + this.Const.UI.Color.DamageValue + "]" + total_tap + "[/color] Hitpoints."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "You will remove [color=" + this.Const.UI.Color.DamageValue + "]" + total_tap*2 + "[/color] Fatigue points."
		});

		if (!isUsable())
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You don\'t have enough Hitpoints to use this skill."
			});
		}

		return ret;
	}

	function isUsable()
	{
		local _user = this.getContainer().getActor();
		local hitpoints = getTotalTap();

		if (this.skill.isUsable())
		{
			if (_user.getHitpoints() > hitpoints)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local hitpoints = getTotalTap();
		local fatigue = hitpoints*2;

		if (_user.getHitpoints() < (hitpoints + 1))
		{
			return false;
		}

		_user.setHitpoints(_user.getHitpoints() - hitpoints);
		_user.setFatigue(_user.getFatigue() - fatigue);

		this.spawnIcon("effect_warlock_lifetap", _user.getTile());
		_user.getSkills().update();
		_user.setDirty(true);

		return true;
	}
});