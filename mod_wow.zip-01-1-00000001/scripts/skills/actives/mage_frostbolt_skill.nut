/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.mage_frostbolt_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_base_min = 18,
		damage_base_max = 22,
		CurrentLevel = 1,
		arcticreach = false,
		winterschill = false,
		magicabsorption = false,
		magicinstability = false,
		iceattunement = false,
		fireattunement = false,
		T0_mage_armor = false,
		T0_mage_set = false,
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
			"sounds/combat/mage_frostbolt_precast1.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/mage_frostbolt_cast1.wav",
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
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 4;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Frostbolt;
		this.m.ProjectileTimeScale = 1.5;
	}

	function getTotalFrostMinDamage()
	{
		local total_damage_min = this.m.damage_base_min;
		local scale = 0;

		if (this.m.arcticreach)
		{
			total_damage_min += 5;
		}

		if (this.m.iceattunement)
		{
			total_damage_min += 7;
			if (this.m.T0_mage_armor)
			{
				total_damage_min += 7;
			}
		}

		if (this.m.fireattunement)
		{
			total_damage_min -= 4;
			if (this.m.T0_mage_armor)
			{
				total_damage_min -= 4;
			}
		}

		if (this.m.T0_mage_set)
		{
			total_damage_min += 10;
		}

		scale = this.Math.floor(total_damage_min * this.m.CurrentLevel * this.Const.MageScale.frost_damage_min);

		total_damage_min += scale;

		return total_damage_min;
	}

	function getTotalFrostMaxDamage()
	{
		local total_damage_max = this.m.damage_base_max;
		local scale = 0;

		if (this.m.arcticreach)
		{
			total_damage_max += 5;
		}

		if (this.m.iceattunement)
		{
			total_damage_max += 7;
			if (this.m.T0_mage_armor)
			{
				total_damage_max += 7;
			}
		}

		if (this.m.fireattunement)
		{
			total_damage_max -= 4;
			if (this.m.T0_mage_armor)
			{
				total_damage_max -= 4;
			}
		}

		if (this.m.T0_mage_set)
		{
			total_damage_max += 10;
		}

		scale = this.Math.floor(total_damage_max * this.m.CurrentLevel * this.Const.MageScale.frost_damage_max);

		total_damage_max += scale;

		return total_damage_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_frost_min = getTotalFrostMinDamage();
		local total_frost_max = getTotalFrostMaxDamage();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_frost_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_frost_max + "[/color] damage to hitpoints."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_frost_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_frost_max + "[/color] damage to armor."
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

		if (this.m.winterschill)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "] 100% [/color] chance to apply [color=" + this.Const.UI.Color.PositiveValue + "] \'Freeze\' [/color] effect on the target."
			});
		}

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		if (!this.Tactical.isActive())
		{
			return true;
		}

		if (this.skill.isUsable())
		{
			if (!this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
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
		local targetEntity = _targetTile.getEntity();
		
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (targetEntity == null)
		{
			return false;
		}

		if (targetEntity.getType() == this.Const.EntityType.Ghost)
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.arcticreach = user.getSkills().hasSkill("perk.wow.mage.arcticreach");
		this.m.winterschill = user.getSkills().hasSkill("perk.wow.mage.winterschill");
		this.m.magicabsorption = user.getSkills().hasSkill("perk.wow.mage.magicabsorption");
		this.m.magicinstability = user.getSkills().hasSkill("perk.wow.mage.magicinstability");
		this.m.fireattunement = user.getSkills().hasSkill("perk.wow.mage.fireattunement");
		this.m.iceattunement = user.getSkills().hasSkill("perk.wow.mage.iceattunement");
		this.m.T0_mage_set = _properties.isFullSetMageT0();
		this.m.T0_mage_armor = _properties.T0_mage_armor;
	}

	function onAfterUpdate( _properties )
	{
		if ((this.m.arcticreach) && (this.m.magicinstability))
		{
			this.m.MaxRange = 7;
		}
		else
		{
			if (this.m.arcticreach)
			{
				this.m.MaxRange = 6;
			}
			if (this.m.magicinstability)
			{
				this.m.MaxRange = 5;
			}
		}
		
		if (this.m.magicabsorption)
		{
			this.m.FatigueCost = 13;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local total_damage_min = getTotalFrostMinDamage();
			local total_damage_max = getTotalFrostMaxDamage();
		
			_properties.DamageRegularMin = total_damage_min;
			_properties.DamageRegularMax = total_damage_max;
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
		
		if (this.m.winterschill)
		{
			if (targetEntity)
			{
				local freeze = targetEntity.getSkills().getSkillByID("effects.freeze");

				if (freeze == null)
				{
					targetEntity.getSkills().add(this.new("scripts/skills/effects/freeze_effect"));
				}
				else
				{
					freeze.resetTime();
				}
				
				this.spawnIcon("effect_mage_freeze_apply", _data.TargetTile);
			}
		}
		_data.Skill.getContainer().setBusy(false);

		return true;
	}
});