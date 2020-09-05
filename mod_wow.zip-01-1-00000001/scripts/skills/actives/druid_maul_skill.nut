this.druid_maul_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_min = 25,
		damage_max = 30,
		damage_armor_mult = 0.8,
		primalfury = false
	},
	function create()
	{
		this.m.ID = "actives.maul_skill";
		this.m.Name = "Maul";
		this.m.Description = "Рit the enemy with a heavy paw, causing physical damage.";
		this.m.KilledString = "Torned down";
		this.m.Icon = "ui/perks/skill_druid_maul.png";
		this.m.IconDisabled = "ui/perks/skill_druid_maul_sw.png";
		this.m.Overlay = "skill_druid_maul";
		this.m.SoundOnUse = [
			"sounds/combat/druid_maul01.wav",
			"sounds/combat/druid_maul02.wav",
			"sounds/combat/druid_maul03.wav"
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
		this.m.DirectDamageMult = 0.1;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 12;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTotalArmorMult()
	{
		local total_armor_mult = 0.8;

		if (this.m.primalfury)
		{
			total_armor_mult *= 2;
		}

		return total_armor_mult;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local damage_armor_mult = getTotalArmorMult();		

		local damage_armor_min = this.Math.floor(this.m.damage_min * damage_armor_mult * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_armor_max = this.Math.floor(this.m.damage_max * damage_armor_mult * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_min = this.Math.floor(this.m.damage_min * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_max = this.Math.floor(this.m.damage_max * p.DamageTotalMult * p.MeleeDamageMult);
		local direct_damage_min = this.Math.floor(this.m.DirectDamageMult * damage_min);
		local direct_damage_max = this.Math.floor(this.m.DirectDamageMult * damage_max);

		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_max + "[/color] damage to hitpoints, of which [color=" + this.Const.UI.Color.DamageValue + "]" + direct_damage_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + direct_damage_max + "[/color] can ignore armor"
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
			if (!this.m.Container.hasSkill("effects.bearform"))
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
		this.m.primalfury = user.getSkills().hasSkill("perk.wow.druid.primalfury");
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			this.m.damage_armor_mult = getTotalArmorMult();

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