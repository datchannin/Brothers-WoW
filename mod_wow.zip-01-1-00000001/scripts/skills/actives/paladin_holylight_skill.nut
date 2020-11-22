/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_holylight_skill <- this.inherit("scripts/skills/skill", {
	m = {
		heal_base_min = 7,
		heal_base_max = 14,
		SpellHolyPower = 0,
		CurrentLevel = 1,
		cleanse = false,
		holypower = false,
		T0_paladin_armor = false
	},
	function create()
	{
		this.m.ID = "actives.holylight_skill";
		this.m.Name = "Holy Light";
		this.m.Description = "Heal target with Holy Light.";
		this.m.Icon = "ui/perks/skill_paladin_holylight.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_holylight_sw.png";
		this.m.Overlay = "skill_paladin_holylight";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_holylight_precast.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/paladin_holylight_cast.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.MinRange = 0;
		this.m.MaxRange = 2;
	}

	function getTotalMinHeal()
	{
		local total_heal_min = this.m.heal_base_min;
		local scale_value = 0;

		total_heal_min += this.m.SpellHolyPower;

		if (this.m.holypower)
		{
			total_heal_min += 10;
		}

		if (this.m.T0_paladin_armor)
		{
			total_heal_min += 5;
		}

		scale_value = this.Math.floor(total_heal_min * this.m.CurrentLevel * this.Const.PaladinScale.holy_heal_min);

		total_heal_min += scale_value;

		return total_heal_min;
	}

	function getTotalMaxHeal()
	{
		local total_heal_max = this.m.heal_base_max;
		local scale_value = 0;

		total_heal_max += this.m.SpellHolyPower;

		if (this.m.holypower)
		{
			total_heal_max += 10;
		}

		if (this.m.T0_paladin_armor)
		{
			total_heal_max += 5;
		}

		scale_value = this.Math.floor(total_heal_max * this.m.CurrentLevel * this.Const.PaladinScale.holy_heal_max);

		total_heal_max += scale_value;

		return total_heal_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local heal_min = getTotalMinHeal();
		local heal_max = getTotalMaxHeal();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/heal.png",
			text = "Heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]" + heal_min + "[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]" + heal_max + "[/color] Hitpoints."
		});

		if (this.m.cleanse)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "] 100% [/color] chance to remove a [color=" + this.Const.UI.Color.NegativeValue + "] Bleeding [/color] from the target."
			});
		}

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.holypower = user.getSkills().hasSkill("perk.wow.paladin.holypower");
		this.m.cleanse = user.getSkills().hasSkill("perk.wow.paladin.cleanse");
		this.m.T0_paladin_armor = _properties.T0_paladin_armor;
		this.m.SpellHolyPower = _properties.SpellHolyPower;
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.holypower)
		{
			this.m.FatigueCost = 15;
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local targetEntity = _targetTile.getEntity();

		if (targetEntity.getHitpoints() <= 0)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(targetEntity))
		{
			return false;
		}

		if (!targetEntity.isAlive())
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local heal_min = getTotalMinHeal();
		local heal_max = getTotalMaxHeal();
		local targetEntity = _targetTile.getEntity();
		local healnumber = this.Math.rand(heal_min, heal_max);

		this.getContainer().setBusy(true);

		this.Time.scheduleEvent(this.TimeUnit.Virtual, 1200, this.onApplyEffect.bindenv(this), {
			Skill = this,
			Target = targetEntity,
			User = _user,
			Healnumber = healnumber,
		});
		
		return true;
	}
	
	function onApplyEffect( _data )
	{
		local targetEntity = _data.Target;
		local healnumber = _data.Healnumber;
		local user = _data.User;
		local real_healnumber = 0;

		this.spawnIcon("effect_paladin_holylight", targetEntity.getTile());

		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[0], this.Const.Sound.Volume.Skill, targetEntity.getPos());
		}

		if (this.m.cleanse)
		{
			while (targetEntity.getSkills().hasSkill("effects.bleeding"))
			{
				targetEntity.getSkills().removeByID("effects.bleeding");
			}
		}

		if (targetEntity.getHitpoints() == targetEntity.getHitpointsMax())
		{
			return;
		}

		if (!targetEntity.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " was healed for " + this.Math.min(targetEntity.getHitpointsMax() - targetEntity.getHitpoints(), healnumber) + " hitpoints");
		}
		
		real_healnumber = this.Math.min(targetEntity.getHitpointsMax() - targetEntity.getHitpoints(), healnumber);
		user.addXP(real_healnumber);
		
		targetEntity.setHitpoints(this.Math.min(targetEntity.getHitpointsMax(), targetEntity.getHitpoints() + healnumber));

		targetEntity.onUpdateInjuryLayer();
		
		_data.Skill.getContainer().setBusy(false);
	}
});