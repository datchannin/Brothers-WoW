/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.warlock_curseofdoom_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseShadowDamage = 50,
		BaseTurnsDuration = 4,
		soulshard = false,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.curseofdoom_skill";
		this.m.Name = "Curse of Doom";
		this.m.Description = "Curse the enemy with this spell. Damage from this curse has great scaling from warlock level.";
		this.m.Icon = "ui/perks/skill_warlock_curseofdoom.png";
		this.m.IconDisabled = "ui/perks/skill_warlock_curseofdoom_sw.png";
		this.m.Overlay = "skill_warlock_curseofdoom";
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
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 40;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
	}

	function getTotalShadowDamage()
	{
		local total_damage = this.m.BaseShadowDamage;
		local scale_damage = 0;

		scale_damage = this.Math.floor(total_damage * this.m.CurrentLevel * this.Const.WarlockScale.curseofdoom);

		total_damage += scale_damage;

		return total_damage;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_shadow = getTotalShadowDamage();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow + "[/color] damage to hitpoints after [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.BaseTurnsDuration + "[/color] turn(s)."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + total_shadow + "[/color] damage to armor after [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.BaseTurnsDuration + "[/color] turn(s)."
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
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemy will be retard while he is under curse effect."
		});

		if (this.m.soulshard)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "This skill consumes your \'Soul Shard\'."
			});
		}
		else
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You should have a \'Soul Shard\' for using this skill."
			});
		}

		return ret;
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			if (this.m.Container.hasSkill("effects.soulshard"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.soulshard = user.getSkills().hasSkill("effects.soulshard");
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
		local total_shadow = getTotalShadowDamage();
		local curse_duration = this.m.BaseTurnsDuration;

		targetEntity.getSkills().removeByID("effects.curseofdoom");
		_user.getSkills().removeByID("effects.soulshard");

		local effect = this.new("scripts/skills/effects/curseofdoom_effect");
		effect.resetTime(curse_duration);
		effect.setDamage(total_shadow);
		targetEntity.getSkills().add(effect);

		this.spawnIcon("effect_warlock_curseofdoom", _targetTile);
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " is cursed");

		return true;
	}
});