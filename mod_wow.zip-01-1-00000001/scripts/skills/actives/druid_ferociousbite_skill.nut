/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.druid_ferociousbite_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Recharge = 0,
		damage_min = 40,
		damage_max = 50,
		CurrentLevel = 1,
		damage_armor_mult = 0.1
	},
	function create()
	{
		this.m.ID = "actives.ferociousbite_skill";
		this.m.Name = "Ferocious Bite";
		this.m.Description = "Bite an enemy with great power, causing physical damage mostly ignored the armor.";
		this.m.KilledString = "Torned down";
		this.m.Icon = "ui/perks/skill_druid_ferociousbite.png";
		this.m.IconDisabled = "ui/perks/skill_druid_ferociousbite_sw.png";
		this.m.Overlay = "skill_druid_ferociousbite";
		this.m.SoundOnUse = [
			"sounds/combat/druid_ferociousbite.wav"
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
		this.m.DirectDamageMult = 1.2;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTotalMinDamage()
	{
		local total_damage_min = this.m.damage_min;
		local scale = 0;

		scale = this.Math.floor(total_damage_min * this.m.CurrentLevel * this.Const.DruidScale.bitemin);
		total_damage_min += scale;

		return total_damage_min;
	}

	function getTotalMaxDamage()
	{
		local total_damage_max = this.m.damage_max;
		local scale = 0;

		scale = this.Math.floor(total_damage_max * this.m.CurrentLevel * this.Const.DruidScale.bitemax);
		total_damage_max += scale;

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
		local direct_damage_max = this.Math.floor(this.m.DirectDamageMult * damage_max);

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

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/action_points.png",
			text = "This skill has recharge time for [color=" + this.Const.UI.Color.PositiveValue + "] 2 [/color] turns."
		});

		if (this.m.Recharge)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "You should wait for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Recharge + "[/color] turn(s) to use it again."
			});
		}

		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}

		if (this.m.Recharge)
		{
			return false;
		}

		return true;
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
		this.m.CurrentLevel = user.getLevel();
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local damage_min = getTotalMinDamage();
			local damage_max = getTotalMaxDamage();		
		
			_properties.DamageRegularMin = damage_min;
			_properties.DamageRegularMax = damage_max;
			_properties.DamageArmorMult *= this.m.damage_armor_mult;
		}
	}

	function onCombatStarted()
	{
		this.m.Recharge = 0;
	}

	function onTurnEnd()
	{
		if (this.m.Recharge)
		{
			this.m.Recharge--;
		}
	}

	function onUse( _user, _targetTile )
	{
		this.m.Recharge = 2;
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectClaws);
		return this.attackEntity(_user, _targetTile.getEntity());
	}
});