/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.warlock_drainstamina_skill <- this.inherit("scripts/skills/skill", {
	m = {
		base_drain = 10,
		drainfunnel = false
	},
	function create()
	{
		this.m.ID = "actives.drainstamina_skill";
		this.m.Name = "Drain Stamina";
		this.m.Description = "Try to drain the stamina of the target. Increases target Fatigue instead of decreasing warlock Fatigue.";
		this.m.Icon = "ui/perks/skill_warlock_drainstamina.png";
		this.m.IconDisabled = "ui/perks/skill_warlock_drainstamina_sw.png";
		this.m.Overlay = "skill_warlock_drainstamina";
		this.m.SoundOnUse = [
			"sounds/combat/warlock_drainsoul_precast.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/warlock_drainsoul_cast.wav",
		];
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 1000;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 0;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 4;
	}

	function getTotalDrain()
	{
		local total_drain = this.m.base_drain;

		if (this.m.drainfunnel)
		{
			total_drain = this.Math.floor(1.2*total_drain);
		}

		return total_drain;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_drain = getTotalDrain();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Increases target Fatigue by [color=" + this.Const.UI.Color.DamageValue + "]" + total_drain + "[/color] points."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Decreases warlock Fatigue by [color=" + this.Const.UI.Color.DamageValue + "]" + total_drain + "[/color] points."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/hitchance.png",
			text = "Has [color=" + this.Const.UI.Color.DamageValue + "] 100% [/color] chance to hit."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color] tiles."
		});

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.drainfunnel = user.getSkills().hasSkill("perk.wow.warlock.drainfunnel");
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
		local targetEntity = _targetTile.getEntity();
		this.getContainer().setBusy(true);

		if (this.Const.Tactical.StaminaParticles.len() != 0)
		{
			for( local i = 0; i < this.Const.Tactical.StaminaParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.StaminaParticles[i].Brushes, _targetTile, this.Const.Tactical.StaminaParticles[i].Delay, this.Const.Tactical.StaminaParticles[i].Quantity * 0.5, this.Const.Tactical.StaminaParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.StaminaParticles[i].SpawnRate, this.Const.Tactical.StaminaParticles[i].Stages);
			}
		}

		this.Time.scheduleEvent(this.TimeUnit.Real, this.m.Delay, this.onApplyDirect.bindenv(this), {
			Skill = this,
			TargetTile = _targetTile,
			User = _user
		});

		return true;
	}

	function onApplyDirect( _data )
	{
		local targetEntity = _data.TargetTile.getEntity();
		local userEntity = _data.User;

		local userFatigue_current = userEntity.getFatigue();
		local targetFatigue_current = targetEntity.getFatigue();
		local targetFatigue_max = targetEntity.getFatigueMax();
		local targetFatigue_delta = targetFatigue_max - targetFatigue_current;
		local drainvalue_base = getTotalDrain();
		local drainvalue = 0;

		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(_data.Skill.m.SoundOnHit[this.Math.rand(0, _data.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, targetEntity.getPos());
		}

		if (targetFatigue_delta == 0)
		{
			return;
		}

		drainvalue = this.Math.minf(drainvalue_base, targetFatigue_delta);

		targetEntity.setFatigue(targetFatigue_current + drainvalue);
		userEntity.setFatigue(userFatigue_current - drainvalue);

		this.spawnIcon("effect_warlock_drainstamina", userEntity.getTile());
		this.spawnIcon("effect_warlock_drainstamina", targetEntity.getTile());
		userEntity.getSkills().update();
		userEntity.setDirty(true);

		_data.Skill.getContainer().setBusy(false);

		return true;
	}
});