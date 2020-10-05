/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.unleash_winterwolf <- this.inherit("scripts/skills/skill", {
	m = {
		Item = null,
		Sounds0 = [
			"sounds/enemies/winterwolf_hurt_00.wav",
			"sounds/enemies/winterwolf_hurt_01.wav",
			"sounds/enemies/winterwolf_hurt_02.wav",
			"sounds/enemies/winterwolf_hurt_03.wav"
		],
		Sounds1 = [
			"sounds/enemies/winterwolf_death_00.wav"
		],
		Sounds2 = [
			"sounds/enemies/wardog_flee_00.wav",
			"sounds/enemies/wardog_flee_01.wav",
			"sounds/enemies/wardog_flee_02.wav",
			"sounds/enemies/wardog_flee_03.wav",
			"sounds/enemies/wardog_flee_04.wav"
		],
		Sounds3 = [
			"sounds/enemies/winterwolf_idle_00.wav"
		],
		Sounds4 = [
			"sounds/enemies/winterwolf_move_00.wav"
		],
		Sounds5 = [
			"sounds/enemies/winterwolf_bite_00.wav",
			"sounds/enemies/winterwolf_bite_01.wav",
			"sounds/enemies/winterwolf_bite_02.wav",
			"sounds/enemies/winterwolf_bite_03.wav",
			"sounds/enemies/winterwolf_bite_04.wav",
			"sounds/enemies/winterwolf_bite_05.wav"
		],
		IsMasterHasEnduranceTraining = 0,
		IsMasterHasThickHide = 0,
		IsMasterHasBestialSwiftness = 0,
		IsMasterHasUnleashFury = 0,
		CurrentHunterLevel = 1,
		BaseHealthBonus = 50,
		BaseStaminaBonus = 40,
		BaseMeleeDefenseBonus = 40,
		BaseRangedDefenseBonus = 40,
		BaseActionPointsBonus = 5,
		BaseFatigueRecoveryBonus = 10,
		BaseMeleeSkillBonus = 30,
		BaseBraveryBonus = 30
	},
	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.unleash_winterwolf";
		this.m.Name = "Unleash Winterwolf";
		this.m.Description = "Unleash your winterwolf and send him fighting against the enemy. Needs a free tile adjacent.";
		this.m.Icon = "ui/perks/skill_hunter_unleashwinterwolf.png";
		this.m.IconDisabled = "ui/perks/skill_hunter_unleashwinterwolf_sw.png";
		this.m.Overlay = "skill_hunter_unleashwinterwolf";
		this.m.SoundOnUse = [
			"sounds/combat/winterwolf_unleash1.wav",
			"sounds/combat/winterwolf_unleash2.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTotalBraveryBonus()
	{
		local bravery_bonus = this.m.BaseBraveryBonus;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentHunterLevel * this.Const.HunterScale.pet_bravery_bonus);
		bravery_bonus += scale;

		return bravery_bonus;
	}

	function getTotalMeleeSkillBonus()
	{
		local meleeskill_bonus = this.m.BaseMeleeSkillBonus;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentHunterLevel * this.Const.HunterScale.pet_meleeskill_bonus);
		meleeskill_bonus += scale;

		return meleeskill_bonus;
	}

	function getTotalFatigueRecoveryBonus()
	{
		local fatiguerecovery_bonus = this.m.BaseFatigueRecoveryBonus;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentHunterLevel * this.Const.HunterScale.pet_fatiguerecovery_bonus);
		fatiguerecovery_bonus += scale;

		return fatiguerecovery_bonus;
	}

	function getTotalActionPointsBonus()
	{
		local actionpoints_bonus = this.m.BaseActionPointsBonus;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentHunterLevel * this.Const.HunterScale.pet_actionpoints_bonus);
		actionpoints_bonus += scale;

		return actionpoints_bonus;
	}

	function getTotalRangedDefenseBonus()
	{
		local rangeddefense_bonus = this.m.BaseRangedDefenseBonus;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentHunterLevel * this.Const.HunterScale.pet_rangeddefense_bonus);
		rangeddefense_bonus += scale;

		return rangeddefense_bonus;
	}

	function getTotalMeleeDefenseBonus()
	{
		local meleedefense_bonus = this.m.BaseMeleeDefenseBonus;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentHunterLevel * this.Const.HunterScale.pet_meleedefense_bonus);
		meleedefense_bonus += scale;

		return meleedefense_bonus;
	}

	function getTotalHealthBonus()
	{
		local health_bonus = this.m.BaseHealthBonus;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentHunterLevel * this.Const.HunterScale.pet_health_bonus);
		health_bonus += scale;

		return health_bonus;
	}

	function getTotalStaminaBonus()
	{
		local stamina_bonus = this.m.BaseStaminaBonus;
		local scale = 0;

		scale = this.Math.floor(stamina_bonus * this.m.CurrentHunterLevel * this.Const.HunterScale.pet_stamina_bonus);
		stamina_bonus += scale;

		return stamina_bonus;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local health_bonus = getTotalHealthBonus();
		local stamina_bonus = getTotalStaminaBonus();
		local meleedefense_bonus = getTotalMeleeDefenseBonus();
		local rangeddefense_bonus = getTotalRangedDefenseBonus();
		local actionpoints_bonus = getTotalActionPointsBonus();
		local fatiguerecovery_bonus = getTotalFatigueRecoveryBonus();
		local meleeskill_bonus = getTotalMeleeSkillBonus();
		local bravery_bonus = getTotalBraveryBonus();

		if (this.m.IsMasterHasEnduranceTraining || this.m.IsMasterHasThickHide || this.m.IsMasterHasBestialSwiftness || this.m.IsMasterHasUnleashFury)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Your pet gets bonuses from your skills!"
			});
		}

		if (this.m.IsMasterHasEnduranceTraining)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/health.png",
				text = "Pet Hitpoints increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + health_bonus + "%[/color]."
			});

			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Pet Stamina increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + stamina_bonus + "[/color]."
			});
		}

		if (this.m.IsMasterHasThickHide)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Pet Melee Defense increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + meleedefense_bonus + "[/color]."
			});

			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Pet Range Defense increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + rangeddefense_bonus + "[/color]."
			});
		}

		if (this.m.IsMasterHasBestialSwiftness)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "Pet Action Points increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + actionpoints_bonus + "[/color]."
			});

			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Pet Fatigue Recovery increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + fatiguerecovery_bonus + "[/color]."
			});
		}

		if (this.m.IsMasterHasUnleashFury)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "Pet Melee Skill increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + meleeskill_bonus + "[/color]."
			});

			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Pet Bravery increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + bravery_bonus + "[/color]."
			});
		}

		return ret;
	}

	function addResources()
	{
		this.skill.addResources();

		foreach( r in this.m.Sounds0 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds1 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds2 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds3 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds4 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds5 )
		{
			this.Tactical.addResource(r);
		}
	}

	function isUsable()
	{
		if (this.m.Item.isUnleashed() || !this.skill.isUsable())
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local actor = this.getContainer().getActor();
		return this.skill.onVerifyTarget(_originTile, _targetTile) && _targetTile.IsEmpty;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.IsHidden = this.m.Item.isUnleashed();
		this.m.CurrentHunterLevel = user.getLevel();

		if (_properties.IsPetEnduranceTraining)
		{
			this.m.IsMasterHasEnduranceTraining = 1;
		}
		else
		{
			this.m.IsMasterHasEnduranceTraining = 0;
		}
		
		if (_properties.IsPetThickHide)
		{
			this.m.IsMasterHasThickHide = 1;
		}
		else
		{
			this.m.IsMasterHasThickHide = 0;
		}
		
		if (_properties.IsPetBestialSwiftness)
		{
			this.m.IsMasterHasBestialSwiftness = 1;
		}
		else
		{
			this.m.IsMasterHasBestialSwiftness = 0;
		}
		
		if (_properties.IsPetUnleashFury)
		{
			this.m.IsMasterHasUnleashFury = 1;
		}
		else
		{
			this.m.IsMasterHasUnleashFury = 0;
		}
	}

	function onUse( _user, _targetTile )
	{
		local entity = this.Tactical.spawnEntity(this.m.Item.getScript(), _targetTile.Coords.X, _targetTile.Coords.Y);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity.setItem(this.m.Item);
		entity.setName(this.m.Item.getName());
		entity.setVariant(this.m.Item.getVariant());
		this.m.Item.setEntity(entity);

		local health_bonus = getTotalHealthBonus();
		local health_bonus_mult = (health_bonus * 0.01) + 1;
		local stamina_bonus = getTotalStaminaBonus();
		local meleedefense_bonus = getTotalMeleeDefenseBonus();
		local rangeddefense_bonus = getTotalRangedDefenseBonus();
		local actionpoints_bonus = getTotalActionPointsBonus();
		local fatiguerecovery_bonus = getTotalFatigueRecoveryBonus();
		local meleeskill_bonus = getTotalMeleeSkillBonus();
		local bravery_bonus = getTotalBraveryBonus();

		if (!this.World.getTime().IsDaytime)
		{
			entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
		}

		if (this.m.IsMasterHasEnduranceTraining)
		{
			local endurancetraining = this.new("scripts/skills/effects/endurancetraining_effect");
			endurancetraining.SetStaminaBase(stamina_bonus);
			endurancetraining.SetHitpointsMultBase(health_bonus_mult);
			entity.getSkills().add(endurancetraining);
		}
		if (this.m.IsMasterHasThickHide)
		{
			local thickhide = this.new("scripts/skills/effects/thickhide_effect");
			thickhide.SetMeleeDefenseBase(meleedefense_bonus);
			thickhide.SetRangedDefenseBase(rangeddefense_bonus);
			entity.getSkills().add(thickhide);
		}
		if (this.m.IsMasterHasBestialSwiftness)
		{
			local bestialswiftness = this.new("scripts/skills/effects/bestialswiftness_effect");
			bestialswiftness.SetActionPointsBonusBase(actionpoints_bonus);
			bestialswiftness.SetFatigueRecoveryRateBase(fatiguerecovery_bonus);
			entity.getSkills().add(bestialswiftness);
		}
		if (this.m.IsMasterHasUnleashFury)
		{
			local unleashedfury = this.new("scripts/skills/effects/unleashedfury_effect");
			unleashedfury.SetMeleeSkillBase(meleeskill_bonus);
			unleashedfury.SetBraveryBase(bravery_bonus);
			entity.getSkills().add(unleashedfury);
		}
		entity.getSkills().add(this.new("scripts/skills/effects/winterwolfgetheal_effect"));

		if (this.m.CurrentHunterLevel >= 1)
		{
			entity.getSkills().add(this.new("scripts/skills/perks/perk_pathfinder"));
		}

		if (this.m.CurrentHunterLevel >= 3)
		{
			entity.getSkills().add(this.new("scripts/skills/perks/perk_nine_lives"));
		}
		
		if (this.m.CurrentHunterLevel >= 5)
		{
			entity.getSkills().add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			entity.getSkills().add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		}
		
		if (this.m.CurrentHunterLevel >= 7)
		{
			entity.getSkills().add(this.new("scripts/skills/perks/perk_steel_brow"));
		}
		
		if (this.m.CurrentHunterLevel >= 10)
		{
			entity.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
		}

		if (this.m.CurrentHunterLevel >= 12)
		{
			entity.getSkills().add(this.new("scripts/skills/perks/perk_underdog"));
		}

		this.m.IsHidden = true;
		return true;
	}

});