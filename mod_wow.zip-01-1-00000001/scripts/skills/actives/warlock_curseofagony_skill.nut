/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.warlock_curseofagony_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseMinShadowDamage = 14,
		BaseMaxShadowDamage = 18,
		BaseTurnsDuration = 2,
		soulshard = false,
		feldomination = false,
		grimreach = false,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.curseofagony_skill";
		this.m.Name = "Curse of Agony";
		this.m.Description = "Curse the enemy with this spell and enjoy watching the torment of the victim.";
		this.m.Icon = "ui/perks/skill_warlock_curseofagony.png";
		this.m.IconDisabled = "ui/perks/skill_warlock_curseofagony_sw.png";
		this.m.Overlay = "skill_warlock_curseofagony";
		this.m.SoundOnUse = [
			"sounds/combat/warlock_curseofagony.wav",
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
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 40;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
	}

	function getTotalShadowMinDamage()
	{
		local total_damage_min = this.m.BaseMinShadowDamage;
		local scale_damage = 0;

		if (this.m.feldomination)
		{
			total_damage_min += 7;
		}

		scale_damage = this.Math.floor(total_damage_min * this.m.CurrentLevel * Const.WarlockScale.shadow_damage_min);

		total_damage_min += scale_damage;

		if (this.m.soulshard)
		{
			total_damage_min = total_damage_min * 2;
		}

		return total_damage_min;
	}

	function getTotalShadowMaxDamage()
	{
		local total_damage_max = this.m.BaseMaxShadowDamage;
		local scale_damage = 0;

		if (this.m.feldomination)
		{
			total_damage_max += 7;
		}

		scale_damage = this.Math.floor(total_damage_max * this.m.CurrentLevel * Const.WarlockScale.shadow_damage_max);

		total_damage_max += scale_damage;

		if (this.m.soulshard)
		{
			total_damage_max = total_damage_max * 2;
		}

		return total_damage_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_shadow_min = getTotalShadowMinDamage();
		local total_shadow_max = getTotalShadowMaxDamage();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_max + "[/color] damage to hitpoints, duration is [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.BaseTurnsDuration + "[/color] turn(s)."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow_max + "[/color] damage to armor, duration is [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.BaseTurnsDuration + "[/color] turn(s)."
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

		if (this.m.soulshard)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Damage deal is doubled, but using this skill consumes your \'Soul Shard\'."
			});
		}

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.soulshard = user.getSkills().hasSkill("effects.soulshard");
		this.m.feldomination = user.getSkills().hasSkill("perk.wow.warlock.feldomination");
		this.m.grimreach = user.getSkills().hasSkill("perk.wow.warlock.grimreach");
	}

	function onAfterUpdate( _properties )
	{
		if ((this.m.grimreach))
		{
			this.m.MaxRange = 6;
		}
		else
		{
			this.m.MaxRange = 3;
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local targetEntity = _targetTile.getEntity();

		if (!targetEntity.isAlive())
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local total_shadow_min = getTotalShadowMinDamage();
		local total_shadow_max = getTotalShadowMaxDamage();
		local curse_duration = this.m.BaseTurnsDuration;
		local curse = targetEntity.getSkills().getSkillByID("effects.curseofagony");

		if (curse == null)
		{
			//local effect = this.new("scripts/skills/effects/curseofagony_effect");
			//effect.resetTime(curse_duration);
			//effect.setMinDamage(total_shadow_min);
			//effect.setMaxDamage(total_shadow_max);
			//targetEntity.getSkills().add(effect);
		}
		else
		{
			//poison.resetTime(curse_duration);
			//poison.setMinDamage(total_shadow_min);
			//poison.setMaxDamage(total_shadow_max);
		}

		this.spawnIcon("effect_warlock_curseofagony", _targetTile);
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " is cursed");

		return true;
	}
});