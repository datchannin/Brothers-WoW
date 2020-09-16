/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 081, game_version = 1.4.0.41*/
this.druid_claws_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_min = 30,
		damage_max = 35,
		damage_armor_mult = 0.4,
		damage_direct_mult = 0.3,
		heartofwild = false,
		sharpenedclaws = false
	},
	function create()
	{
		this.m.ID = "actives.druid_claws_skill";
		this.m.Name = "Claws";
		this.m.Description = "Claw the enemy, causing physical damage.";
		this.m.KilledString = "Torned down";
		this.m.Icon = "ui/perks/skill_druid_claws.png";
		this.m.IconDisabled = "ui/perks/skill_druid_claws_sw.png";
		this.m.Overlay = "skill_druid_claws";
		this.m.SoundOnUse = [
			"sounds/combat/druid_claws01.wav",
			"sounds/combat/druid_claws02.wav",
			"sounds/combat/druid_claws03.wav",
			"sounds/combat/druid_claws04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsUsingActorPitch = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.3;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 12;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTotalMinDamage()
	{
		local total_damage_min = 30;

		if (this.m.heartofwild)
		{
			total_damage_min += 6;
		}

		if (this.m.sharpenedclaws)
		{
			total_damage_min += 6;
		}

		return total_damage_min;
	}

	function getTotalMaxDamage()
	{
		local total_damage_max = 35;

		if (this.m.heartofwild)
		{
			total_damage_max += 7;
		}

		if (this.m.sharpenedclaws)
		{
			total_damage_max += 7;
		}

		return total_damage_max;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		
		local damage_min_st = getTotalMinDamage();
		local damage_max_st = getTotalMaxDamage();
		
		local damage_armor_min = this.Math.floor(damage_min_st * this.m.damage_armor_mult * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_armor_max = this.Math.floor(damage_max_st * this.m.damage_armor_mult * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_min = this.Math.floor(damage_min_st * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_max = this.Math.floor(damage_max_st * p.DamageTotalMult * p.MeleeDamageMult);
		local direct_damage_max = this.Math.floor(this.m.damage_direct_mult * damage_max_st);

		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_max + "[/color] damage to hitpoints, of which [color=" + this.Const.UI.Color.DamageValue + "]" + 0 + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + direct_damage_max + "[/color] can ignore armor"
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_max + "[/color] damage to armor"
		});

		return ret;
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.catform"))
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
		this.m.heartofwild = user.getSkills().hasSkill("perk.wow.druid.heartofwild");
		this.m.sharpenedclaws = user.getSkills().hasSkill("perk.wow.druid.sharpenedclaws");
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			this.m.damage_min = getTotalMinDamage();
			this.m.damage_max = getTotalMaxDamage();

			_properties.DamageRegularMin = this.m.damage_min;
			_properties.DamageRegularMax = this.m.damage_max;
			_properties.DamageArmorMult *= this.m.damage_armor_mult;
		}
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectClaws);
		return this.attackEntity(_user, _targetTile.getEntity());
	}
});