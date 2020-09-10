/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.rogue_poison_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BasePoisonDamage = 10,
		BaseTurnsDuration = 1,
		vilepoison = false,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.poison_skill";
		this.m.Name = "Poison";
		this.m.Description = "Poison the enemy with deadly toxin.";
		this.m.Icon = "ui/perks/skill_rogue_poison.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_poison_sw.png";
		this.m.Overlay = "skill_rogue_poison";
		this.m.SoundOnUse = [
			"sounds/combat/rogue_poison1.wav",
			"sounds/combat/rogue_poison2.wav",
			"sounds/combat/rogue_poison3.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTotalPoisonDamage()
	{
		local poison_damage = this.m.BasePoisonDamage;

		if (this.m.vilepoison)
		{
			poison_damage += 10;
		}

		return poison_damage;
	}

	function getTotalPoisonDuration()
	{
		local poison_duration = this.m.BaseTurnsDuration;

		if (this.m.vilepoison)
		{
			poison_duration += 1;
		}

		return poison_duration;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local poison_damage = getTotalPoisonDamage();
		local poison_duration = getTotalPoisonDuration();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/damage_poison.png",
			text = "Damage target for [color=" + this.Const.UI.Color.DamageValue + "]" + poison_damage + "[/color] hitpoints by deadly toxin, duration is [color=" + this.Const.UI.Color.PositiveValue + "]" + poison_duration + "[/color] turn(s)."
		});
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Your level is [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.CurrentLevel + "[/color]."
		});
		
		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.vilepoison = user.getSkills().hasSkill("perk.wow.rogue.vilepoison");
		this.m.CurrentLevel = user.getLevel();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local targetEntity = _targetTile.getEntity();

		if (targetEntity.getCurrentProperties().IsImmuneToPoison || targetEntity.getHitpoints() <= 0)
		{
			return false;
		}

		if (!targetEntity.isAlive())
		{
			return false;
		}

		if (targetEntity.getFlags().has("undead"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local poison_damage = getTotalPoisonDamage();
		local poison_duration = getTotalPoisonDuration();
		local poison = targetEntity.getSkills().getSkillByID("effects.rogue_poison");

		if (poison == null)
		{
			local effect = this.new("scripts/skills/effects/rogue_poison_effect");
			effect.resetTime(poison_duration);
			effect.setDamage(poison_damage);
			targetEntity.getSkills().add(effect);
		}
		else
		{
			poison.resetTime(poison_duration);
			poison.setDamage(poison_damage);
		}

		this.spawnIcon("status_effect_54", _targetTile);
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " is poisoned");

		return true;
	}
});