/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.06, game_version = 1.4.0.38*/
this.mage_fireball_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_min = 15,
		damage_max = 25,
		blastwave = false,
		ignite = false,
		focus1 = false,
		focus2 = false,
		focus3 = false,
		magicabsorption = false,
		magicinstability = false,
		fireattunement = false
	},
	function create()
	{
		this.m.ID = "actives.fireball_skill";
		this.m.Name = "Fireball";
		this.m.Description = "Throws a fiery ball that causes Fire damage to your target.";
		this.m.KilledString = "Fired!";
		this.m.Icon = "ui/perks/skill_mage_fireball.png";
		this.m.IconDisabled = "ui/perks/skill_mage_fireball_sw.png";
		this.m.Overlay = "skill_mage_fireball";
		this.m.SoundOnUse = [
			"sounds/combat/mage_fireball_precast1.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/mage_fireball_cast1.wav",
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
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Fireball;
		this.m.ProjectileTimeScale = 1.5;
	}

	function getTotalFireMinDamage()
	{
		local total_damage_min = 15;
		if (this.m.blastwave)
		{
			total_damage_min += 5;
		}

		if (this.m.fireattunement)
		{
			total_damage_min += 5;
		}

		if (this.m.focus1)
		{
			total_damage_min += 3;
		}

		if (this.m.focus2)
		{
			total_damage_min += 3;
		}

		if (this.m.focus3)
		{
			total_damage_min += 3;
		}

		return total_damage_min;
	}

	function getTotalFireMaxDamage()
	{
		local total_damage_max = 25;
		if (this.m.blastwave)
		{
			total_damage_max += 5;
		}

		if (this.m.fireattunement)
		{
			total_damage_max += 5;
		}

		if (this.m.focus1)
		{
			total_damage_max += 3;
		}

		if (this.m.focus2)
		{
			total_damage_max += 3;
		}

		if (this.m.focus3)
		{
			total_damage_max += 3;
		}

		return total_damage_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_fire_min = getTotalFireMinDamage();
		local total_fire_max = getTotalFireMaxDamage();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_fire_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_fire_max + "[/color] damage to hitpoints."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_fire_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_fire_max + "[/color] damage to armor."
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

		if (this.m.ignite)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "] 70% [/color] chance to apply [color=" + this.Const.UI.Color.PositiveValue + "] \'Burn\' [/color] effect on the target."
			});
		}

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
		this.m.blastwave = user.getSkills().hasSkill("perk.wow.mage.blastwave");
		this.m.ignite = user.getSkills().hasSkill("perk.wow.mage.ignite");
		this.m.focus1 = user.getSkills().hasSkill("perk.wow.mage.magicfocus1");
		this.m.focus2 = user.getSkills().hasSkill("perk.wow.mage.magicfocus2");
		this.m.focus3 = user.getSkills().hasSkill("perk.wow.mage.magicfocus3");
		this.m.magicabsorption = user.getSkills().hasSkill("perk.wow.mage.magicabsorption");
		this.m.magicinstability = user.getSkills().hasSkill("perk.wow.mage.magicinstability");
		this.m.fireattunement = user.getSkills().hasSkill("perk.wow.mage.fireattunement");
	}

	function onAfterUpdate( _properties )
	{
		if ((this.m.blastwave) && (this.m.magicinstability))
		{
			this.m.MaxRange = 8;
		}
		else
		{
			if (this.m.blastwave)
			{
				this.m.MaxRange = 7;
			}
			if (this.m.magicinstability)
			{
				this.m.MaxRange = 6;
			}
		}
		
		if (this.m.magicabsorption)
		{
			this.m.FatigueCost = 18;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			this.m.damage_min = getTotalFireMinDamage();
			this.m.damage_max = getTotalFireMaxDamage();

			_properties.DamageRegularMin = this.m.damage_min;
			_properties.DamageRegularMax = this.m.damage_max;
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

		if (this.m.ignite)
		{
			local r;
			r = this.Math.rand(0, 9);
			if (r > 2)
			{
				if (targetEntity)
				{
					local burn = targetEntity.getSkills().getSkillByID("effects.burn");

					if (burn == null)
					{
						targetEntity.getSkills().add(this.new("scripts/skills/effects/burn_effect"));
					}
					else
					{
						burn.resetTime();
					}
					
					this.spawnIcon("effect_mage_burn_apply", _data.TargetTile);
				}
			}
		}
		_data.Skill.getContainer().setBusy(false);

		return true;
	}
});