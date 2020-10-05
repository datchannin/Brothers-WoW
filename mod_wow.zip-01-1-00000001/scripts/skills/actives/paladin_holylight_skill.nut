/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.paladin_holylight_skill <- this.inherit("scripts/skills/skill", {
	m = {
		heal_base_min = 7,
		heal_base_max = 14,
		CurrentLevel = 1,
		holypower = false
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

		if (this.m.holypower)
		{
			total_heal_min += 10;
		}

		scale_value = this.Math.floor(total_heal_min * this.m.CurrentLevel * this.Const.PaladinScale.holy_heal_min);

		total_heal_min += scale_value;

		return total_heal_min;
	}

	function getTotalMaxHeal()
	{
		local total_heal_max = this.m.heal_base_max;
		local scale_value = 0;

		if (this.m.holypower)
		{
			total_heal_max += 10;
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

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.holypower = user.getSkills().hasSkill("perk.wow.paladin.holypower");
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

		this.Time.scheduleEvent(this.TimeUnit.Real, 1200, this.onApplyEffect.bindenv(this), {
			Skill = this,
			Target = targetEntity,
			Healnumber = healnumber,
		});
		
		return true;
	}
	
	function onApplyEffect( _data )
	{
		local targetEntity = _data.Target;
		local healnumber = _data.Healnumber;

		this.spawnIcon("effect_paladin_holylight", targetEntity.getTile());

		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[0], this.Const.Sound.Volume.Skill, targetEntity.getPos());
		}

		if (targetEntity.getHitpoints() == targetEntity.getHitpointsMax())
		{
			return;
		}

		if (!targetEntity.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " was healed for " + this.Math.min(targetEntity.getHitpointsMax() - targetEntity.getHitpoints(), healnumber) + " hitpoints");
		}
		targetEntity.setHitpoints(this.Math.min(targetEntity.getHitpointsMax(), targetEntity.getHitpoints() + healnumber));

		targetEntity.onUpdateInjuryLayer();
	}
});