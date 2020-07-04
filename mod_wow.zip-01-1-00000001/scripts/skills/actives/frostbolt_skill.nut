this.frostbolt_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_min = 18,
		damage_max = 22,
	},
	function create()
	{
		this.m.ID = "actives.frostbolt_skill";
		this.m.Name = "Frostbolt";
		this.m.Description = "Throws a fiery ball that causes Frost damage to your target.";
		this.m.KilledString = "Chilled!";
		this.m.Icon = "ui/perks/skill_mage_frostbolt.png";
		this.m.IconDisabled = "ui/perks/skill_mage_frostbolt_sw.png";
		this.m.Overlay = "skill_mage_frostbolt";
		this.m.SoundOnUse = [
			//"sounds/combat/mage_fireball_precast1.wav"
		];
		this.m.SoundOnHit = [
			//"sounds/combat/mage_fireball_cast1.wav",
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
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 5;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Frostbolt;
		this.m.ProjectileTimeScale = 1.5;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Damage target for [color=" + this.Const.UI.Color.DamageValue + "] 18-22 [/color] points."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has a chance to apply \'Freeze\' effect on the target."
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
		_properties.DamageRegularMin = this.m.damage_min;
		_properties.DamageRegularMax = this.m.damage_max;
		_properties.DamageRegularMult = 1;
		_properties.DamageArmorMult = 1;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();

		this.Time.scheduleEvent(this.TimeUnit.Real, this.m.Delay, this.onApplyDirect.bindenv(this), {
			Skill = this,
			TargetTile = _targetTile,
			User = _user
		});
		
		this.Time.scheduleEvent(this.TimeUnit.Real, (this.m.Delay*2), this.onApplyFreeze.bindenv(this), {
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
		
		return _data.Skill.attackEntity(user, targetEntity);
	}

	function onApplyFreeze( _data )
	{
		local targetEntity = _data.TargetTile.getEntity();
		local freeze = targetEntity.getSkills().getSkillByID("effects.freeze");

		if (freeze == null)
		{
			//targetEntity.getSkills().add(this.new("scripts/skills/effects/burn_effect"));
		}
		else
		{
			//freeze.resetTime();
		}
		
		this.spawnIcon("effect_mage_freeze_apply", _data.TargetTile);

		return true;
	}
});

