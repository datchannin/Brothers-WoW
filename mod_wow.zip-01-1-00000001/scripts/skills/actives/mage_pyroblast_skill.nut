/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.mage_pyroblast_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_base_min = 50,
		damage_base_max = 80,
		SpellFirePower = 0,
		CurrentLevel = 1,
		T0_mage_armor = false,
		fireattunement = false,
		iceattunement = false
	},
	function create()
	{
		this.m.ID = "actives.pyroblast_skill";
		this.m.Name = "Pyroblast";
		this.m.Description = "Throws a fiery blast that causes massive Fire damage to your target. Target should be under \'Burn\' effect.";
		this.m.KilledString = "Fired!";
		this.m.Icon = "ui/perks/skill_mage_pyroblast.png";
		this.m.IconDisabled = "ui/perks/skill_mage_pyroblast_sw.png";
		this.m.Overlay = "skill_mage_pyroblast";
		this.m.SoundOnUse = [
			"sounds/combat/mage_pyroblast_precast.ogg"
		];
		this.m.SoundOnHit = [
			"sounds/combat/mage_pyroblast_cast.ogg",
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
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 60;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Pyroblast;
		this.m.ProjectileTimeScale = 1.5;
	}

	function getTotalFireMinDamage()
	{
		local total_damage_min = this.m.damage_base_min;
		local scale = 0;

		total_damage_min += this.m.SpellFirePower;

		if (this.m.fireattunement)
		{
			total_damage_min += 7;
			if (this.m.T0_mage_armor)
			{
				total_damage_min += 7;
			}
		}

		if (this.m.iceattunement)
		{
			total_damage_min -= 4;
			if (this.m.T0_mage_armor)
			{
				total_damage_min -= 4;
			}
		}

		scale = this.Math.floor(total_damage_min * this.m.CurrentLevel * this.Const.MageScale.fire_damage_min);

		total_damage_min += scale;

		return total_damage_min;
	}

	function getTotalFireMaxDamage()
	{
		local total_damage_max = this.m.damage_base_max;
		local scale = 0;

		total_damage_max += this.m.SpellFirePower;

		if (this.m.fireattunement)
		{
			total_damage_max += 7;
			if (this.m.T0_mage_armor)
			{
				total_damage_max += 7;
			}
		}

		if (this.m.iceattunement)
		{
			total_damage_max -= 4;
			if (this.m.T0_mage_armor)
			{
				total_damage_max -= 4;
			}
		}

		scale = this.Math.floor(total_damage_max * this.m.CurrentLevel * this.Const.MageScale.fire_damage_max);

		total_damage_max += scale;

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

		ret.push({
			id = 9,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]Target should be under \'Burn\' effect.[/color]"
		});

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

		if (!targetEntity.getSkills().getSkillByID("effects.burn"))
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.fireattunement = user.getSkills().hasSkill("perk.wow.mage.fireattunement");
		this.m.iceattunement = user.getSkills().hasSkill("perk.wow.mage.iceattunement");
		this.m.SpellFirePower = _properties.SpellFirePower;
		this.m.T0_mage_armor = _properties.T0_mage_armor;
	}

	function onAfterUpdate( _properties )
	{
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local total_damage_min = getTotalFireMinDamage();
			local total_damage_max = getTotalFireMaxDamage();

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

		this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.Delay, this.onApplyDirect.bindenv(this), {
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