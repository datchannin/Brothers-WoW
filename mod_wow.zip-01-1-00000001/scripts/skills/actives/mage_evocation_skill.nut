/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.mage_evocation_skill <- this.inherit("scripts/skills/skill", {
	m = {
		isUsed = false,
		setFatigueValue = 0,
	},
	function create()
	{
		this.m.ID = "actives.evocation_skill";
		this.m.Name = "Evocation";
		this.m.Description = "Allows the mage to recover fatigue very quickly, even in battle. You can use this only once per combat.";
		this.m.Icon = "ui/perks/skill_mage_evocation.png";
		this.m.IconDisabled = "ui/perks/skill_mage_evocation_sw.png";
		this.m.Overlay = "skill_mage_evocation";
		this.m.SoundOnUse = [
			"sounds/combat/mage_evocation_precast1.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/mage_evocation_cast1.wav",
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 2200;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.skill.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Restores all your Fatigue."
		});
		
		if (this.m.isUsed)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You can not use this spell one more time during this battle."
			});
		}
		
		return ret;
	}

	function onCombatStarted()
	{
		this.m.isUsed = false;
	}

	function isUsable()
	{
		if (this.m.isUsed)
		{
			return false;
		}
		else
		{
			return this.skill.isUsable();
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.isUsed = true;
		this.getContainer().setBusy(true);

		this.Time.scheduleEvent(this.TimeUnit.Real, this.m.Delay, this.onRestoreMana.bindenv(this), {
			Skill = this,
			User = _user
		});

		return true;
	}
	
	function onRestoreMana( _data )
	{
		local user = _data.User;
		user.setFatigue(this.m.setFatigueValue);

		if (!user.isHiddenToPlayer())
		{
			if (_data.Skill.m.SoundOnHit.len() != 0)
			{
				this.Sound.play(_data.Skill.m.SoundOnHit[this.Math.rand(0, _data.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, user.getPos());
			}
		}

		user.getSkills().update();
		user.setDirty(true);
		this.getContainer().setBusy(false);

		return true;
	}
});