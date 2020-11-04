/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.priest_heal_skill <- this.inherit("scripts/skills/skill", {
	m = {
		heal_base_min = 12,
		heal_base_max = 25,
		CurrentLevel = 1,
		holyreach = false,
		spiritalhealing = false,
		blessedrecovery = false,
		unbreakablewill = false,
		renew = false,
		T0_priest_armor = false
	},
	function create()
	{
		this.m.ID = "actives.heal_skill";
		this.m.Name = "Heal";
		this.m.Description = "Use Light inside the priest to heal the target.";
		this.m.Icon = "ui/perks/skill_priest_heal.png";
		this.m.IconDisabled = "ui/perks/skill_priest_heal_sw.png";
		this.m.Overlay = "skill_priest_heal";
		this.m.SoundOnUse = [
			"sounds/combat/priest_heal_precast.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/priest_heal_cast.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 22;
		this.m.MinRange = 0;
		this.m.MaxRange = 4;
	}

	function getTotalMinHeal()
	{
		local total_heal_min = this.m.heal_base_min;
		local scale = 0;

		if (this.m.spiritalhealing)
		{
			total_heal_min += 15;
		}

		scale = this.Math.floor(total_heal_min * this.m.CurrentLevel * this.Const.PriestScale.heal_min);
		total_heal_min += scale;

		return total_heal_min;
	}

	function getTotalMaxHeal()
	{
		local total_heal_max = this.m.heal_base_max;
		local scale = 0;

		if (this.m.spiritalhealing)
		{
			total_heal_max += 15;
		}

		scale = this.Math.floor(total_heal_max * this.m.CurrentLevel * this.Const.PriestScale.heal_max);
		total_heal_max += scale;

		return total_heal_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_heal_min = getTotalMinHeal();
		local total_heal_max = getTotalMaxHeal();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/heal.png",
			text = "Heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]" + total_heal_min + "[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]" + total_heal_max + "[/color] Hitpoints."
		});

		if (this.m.renew)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "] 100% [/color] chance to apply [color=" + this.Const.UI.Color.PositiveValue + "] \'Renew\' [/color] effect on the target."
			});
		}

		if (this.m.blessedrecovery)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "] 100% [/color] chance to remove some injuries from the target."
			});
		}

		if (this.m.T0_priest_armor)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "] 100% [/color] chance to remove a Bleeding from the target."
			});
		}

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
		this.m.CurrentLevel = user.getLevel();
		this.m.holyreach = user.getSkills().hasSkill("perk.wow.priest.holyreach");
		this.m.spiritalhealing = user.getSkills().hasSkill("perk.wow.priest.spiritalhealing");
		this.m.renew = user.getSkills().hasSkill("perk.wow.priest.renew");
		this.m.blessedrecovery = user.getSkills().hasSkill("perk.wow.priest.blessedrecovery");
		this.m.unbreakablewill = user.getSkills().hasSkill("perk.wow.priest.unbreakablewill");
		this.m.T0_priest_armor = _properties.T0_priest_armor;
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.holyreach)
		{
			this.m.MaxRange = 7;
		}
		
		if (this.m.unbreakablewill)
		{
			this.m.FatigueCost = 12;
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
		local targetEntity = _targetTile.getEntity();
		local total_heal_min = getTotalMinHeal();
		local total_heal_max = getTotalMaxHeal();

		local healnumber = this.Math.rand(total_heal_min, total_heal_max);

		this.getContainer().setBusy(true);

		this.Time.scheduleEvent(this.TimeUnit.Real, 1200, this.onApplyEffect.bindenv(this), {
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
		local user = _data.User;
		local healnumber = _data.Healnumber;
		local skills = targetEntity.getSkills();
		local real_healnumber = 0;

		this.spawnIcon("effect_priest_heal", targetEntity.getTile());

		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[0], this.Const.Sound.Volume.Skill, targetEntity.getPos());
		}

		if (this.m.renew)
		{
			if (targetEntity)
			{
				local renew = targetEntity.getSkills().getSkillByID("effects.renew");

				if (renew == null)
				{
					targetEntity.getSkills().add(this.new("scripts/skills/effects/renew_effect"));
				}
				else
				{
					renew.resetTime();
				}

				this.spawnIcon("effect_priest_renew_apply", targetEntity.getTile());
			}
		}

		if (this.m.blessedrecovery)
		{
			skills.removeByID("injury.cut_achilles_tendon");
			skills.removeByID("injury.cut_arm");
			skills.removeByID("injury.cut_arm_sinew");
			skills.removeByID("injury.cut_artery");
			skills.removeByID("injury.cut_leg_muscles");
			skills.removeByID("injury.cut_throat_injury");
			skills.removeByID("injury.deep_abdominal_cut");
			skills.removeByID("injury.deep_chest_cut");
			skills.removeByID("injury.deep_face_cut");
			skills.removeByID("injury.broken_arm");
			skills.removeByID("injury.broken_leg");
			skills.removeByID("injury.broken_nose");
			skills.removeByID("injury.broken_ribs");
			skills.removeByID("injury.fractured_elbow");
			skills.removeByID("injury.fractured_hand");
			skills.removeByID("injury.fractured_ribs");
			skills.removeByID("injury.fractured_skull");
			skills.removeByID("injury.pierced_arm_muscles");
			skills.removeByID("injury.pierced_cheek");
			skills.removeByID("injury.pierced_chest");
			skills.removeByID("injury.pierced_hand");
			skills.removeByID("injury.pierced_leg_muscles");
			skills.removeByID("injury.pierced_lung");
			skills.removeByID("injury.pierced_side");
			skills.removeByID("injury.split_hand");
			skills.removeByID("injury.split_nose");
			skills.removeByID("injury.split_shoulder");
		}

		if (this.m.T0_priest_armor)
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