/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.08, game_version = 1.4.0.39*/
this.priest_heal_skill <- this.inherit("scripts/skills/skill", {
	m = {
		heal_base_min = 12,
		heal_base_max = 25,
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
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 4;
	}

	function getTotalMinHeal()
	{
		local total_heal_min = this.m.heal_base_min;

		return total_heal_min;
	}

	function getTotalMaxHeal()
	{
		local total_heal_max = this.m.heal_base_max;

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
			icon = "ui/icons/special.png",
			text = "Heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]" + total_heal_min + "[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]" + total_heal_max + "[/color] Hitpoints."
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
			Healnumber = healnumber,
		});
		
		return true;
	}

	function onApplyEffect( _data )
	{
		local targetEntity = _data.Target;
		local healnumber = _data.Healnumber;

		this.spawnIcon("effect_priest_heal", targetEntity.getTile());

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

		_data.Skill.getContainer().setBusy(false);
	}
});