/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.warlock_shadowbolt_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_base_min = 20,
		damage_base_max = 35,
		destructivereach = false,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.shadowbolt_skill";
		this.m.Name = "Shadowbolt";
		this.m.Description = "Throws a fiery ball that causes Shadow damage to your target.";
		this.m.KilledString = "Torn apart!";
		this.m.Icon = "ui/perks/skill_warlock_shadowbolt.png";
		this.m.IconDisabled = "ui/perks/skill_warlock_shadowbolt_sw.png";
		this.m.Overlay = "skill_warlock_shadowbolt";
		this.m.SoundOnUse = [
			"sounds/combat/warlock_shadowbolt_precast.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/warlock_shadowbolt_cast.wav"
		];
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 1500;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = true;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 40;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Shadowbolt;
		this.m.ProjectileTimeScale = 1.5;
	}

	function getTotalShadowMinDamage()
	{
		local total_damage_min = this.m.damage_base_min;
		local scale_damage = 0;

		scale_damage = this.Math.floor(this.m.damage_base_min * this.m.CurrentLevel * Const.WarlockScale.shadow_damage_min);

		total_damage_min += scale_damage;

		return total_damage_min;
	}

	function getTotalShadowMaxDamage()
	{
		local total_damage_max = this.m.damage_base_max;
		local scale_damage = 0;

		scale_damage = this.Math.floor(this.m.damage_base_max * this.m.CurrentLevel * Const.WarlockScale.shadow_damage_max);

		total_damage_max += scale_damage;

		return total_damage_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_shadow_min = getTotalShadowMinDamage();
		local total_shadow_max = getTotalShadowMaxDamage();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_max + "[/color] damage to hitpoints."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_max + "[/color] damage to armor."
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

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.destructivereach = user.getSkills().hasSkill("perk.wow.warlock.destructivereach");
	}

	function onAfterUpdate( _properties )
	{
		if ((this.m.destructivereach))
		{
			this.m.MaxRange = 8;
		}
		else
		{
			this.m.MaxRange = 5;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local damage_min = getTotalShadowMinDamage();
			local damage_max = getTotalShadowMaxDamage();

			_properties.DamageRegularMin = damage_min;
			_properties.DamageRegularMax = damage_max;
			_properties.DamageRegularMult = 1;
			_properties.DamageArmorMult = 1;
		}
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		this.getContainer().setBusy(true);

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
		local user = _data.User;

		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(_data.Skill.m.SoundOnHit[this.Math.rand(0, _data.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, targetEntity.getPos());
		}
		_data.Skill.attackEntity(user, targetEntity);

		if (!targetEntity.isAlive() || targetEntity.isDying())
		{
			return;
		}

		_data.Skill.getContainer().setBusy(false);

		return true;
	}
});