/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.warlock_drainsoul_skill <- this.inherit("scripts/skills/skill", {
	m = {
		base_damage_min = 15,
		base_damage_max = 25
	},
	function create()
	{
		this.m.ID = "actives.drainsoul_skill";
		this.m.Name = "Drain Soul";
		this.m.Description = "Try to drains the soul of the target. If the target dies while being drained, the caster gains charge for using destructive debuff.";
		this.m.KilledString = "Drained!";
		this.m.Icon = "ui/perks/skill_warlock_drainsoul.png";
		this.m.IconDisabled = "ui/perks/skill_warlock_drainsoul_sw.png";
		this.m.Overlay = "skill_warlock_drainsoul";
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
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = true;
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 1;
		this.m.MinRange = 1;
		this.m.MaxRange = 8;
		this.m.MaxLevelDifference = 4;
	}

	function getTotalDrainMinDamage()
	{
		local total_damage_min = this.m.base_damage_min;

		return total_damage_min;
	}

	function getTotalDrainMaxDamage()
	{
		local total_damage_max = this.m.base_damage_max;

		return total_damage_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_drain_min = getTotalDrainMinDamage();
		local total_drain_max = getTotalDrainMaxDamage();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_drain_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_drain_max + "[/color] damage to hitpoints."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_drain_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_drain_max + "[/color] damage to armor."
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
			icon = "ui/icons/hitchance.png",
			text = "Has [color=" + this.Const.UI.Color.DamageValue + "] 100% [/color] chance to drain soul if kill an enemy."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color] tiles."
		});

		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local total_drain_min = getTotalDrainMinDamage();
			local total_drain_max = getTotalDrainMaxDamage();
			_properties.DamageRegularMin = total_drain_min;
			_properties.DamageRegularMax = total_drain_max;
			_properties.DamageRegularMult = 1;
			_properties.DamageArmorMult = 1;
		}
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		this.getContainer().setBusy(true);

		if (this.Const.Tactical.SoulParticles.len() != 0)
		{
			for( local i = 0; i < this.Const.Tactical.SoulParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.SoulParticles[i].Brushes, _targetTile, this.Const.Tactical.SoulParticles[i].Delay, this.Const.Tactical.SoulParticles[i].Quantity * 0.5, this.Const.Tactical.SoulParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.SoulParticles[i].SpawnRate, this.Const.Tactical.SoulParticles[i].Stages);
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

		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(_data.Skill.m.SoundOnHit[this.Math.rand(0, _data.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, targetEntity.getPos());
		}
		
		_data.Skill.attackEntity(userEntity, targetEntity);
		_data.Skill.getContainer().setBusy(false);

		return true;
	}
	
	function onTargetKilled( _targetEntity, _skill )
	{
		local actor = this.getContainer().getActor();

		if (_skill == this)
		{
			actor.getSkills().update();
			this.m.Container.removeByID("effects.drainsoul");
			this.m.Container.add(this.new("scripts/skills/effects/drainsoul_effect"));
		}
	}
});