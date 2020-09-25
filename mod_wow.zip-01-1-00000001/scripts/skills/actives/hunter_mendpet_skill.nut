/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.hunter_mendpet_skill <- this.inherit("scripts/skills/skill", {
	m = {
		heal_base_min = 15,
		heal_base_max = 25,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.mendpet_skill";
		this.m.Name = "Mend Pet";
		this.m.Description = "Heal Winterwolf during the battle.";
		this.m.Icon = "ui/perks/skill_hunter_mendpet.png";
		this.m.IconDisabled = "ui/perks/skill_hunter_mendpet_sw.png";
		this.m.Overlay = "skill_hunter_mendpet";
		this.m.SoundOnUse = [
			"sounds/combat/hunter_mendpet.wav"
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
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 8;
	}

	function getTotalHealMin()
	{
		local total_heal_min = this.m.heal_base_min;
		local scale = 0;

		scale = this.Math.floor(total_heal_min * this.m.CurrentLevel * this.Const.HunterScale.pet_mend_min);

		total_heal_min += scale;

		return total_heal_min;
	}

	function getTotalHealMax()
	{
		local total_heal_max = this.m.heal_base_max;
		local scale = 0;

		scale = this.Math.floor(total_heal_max * this.m.CurrentLevel * this.Const.HunterScale.pet_mend_max);

		total_heal_max += scale;

		return total_heal_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local heal_min = getTotalHealMin();
		local heal_max = getTotalHealMax();

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/heal.png",
			text = "Heal the Winterwolf for [color=" + this.Const.UI.Color.PositiveValue + "]" + heal_min + "[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]" + heal_max + "[/color] value."
		});

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
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

		if (!targetEntity.getSkills().hasSkill("effects.winterwolfgetheal"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local heal_min = getTotalHealMin();
		local heal_max = getTotalHealMax();
		local healnumber = this.Math.rand(heal_min, heal_max);

		this.spawnIcon("effect_hunter_mendpet", targetEntity.getTile());
		if (targetEntity.getHitpoints() == targetEntity.getHitpointsMax())
		{
			return;
		}
		
		if (!targetEntity.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + "was healed for " + this.Math.min(targetEntity.getHitpointsMax() - targetEntity.getHitpoints(), healnumber) + " hitpoints");
		}
		targetEntity.setHitpoints(this.Math.min(targetEntity.getHitpointsMax(), targetEntity.getHitpoints() + healnumber));
		targetEntity.onUpdateInjuryLayer();

		return true;
	}
});