this.druid_claws_skill <- this.inherit("scripts/skills/skill", {
	m = {},
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
			"sounds/combat/druid_claws1.wav",
			"sounds/combat/druid_claws2.wav",
			"sounds/combat/druid_claws3.wav",
			"sounds/combat/druid_claws4.wav",
			"sounds/combat/druid_claws5.wav"
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

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local ret = this.getDefaultTooltip();
		
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
		_properties.DamageRegularMin += 30;
		_properties.DamageRegularMax += 35;
		_properties.DamageArmorMult *= 0.4;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectClaws);
		return this.attackEntity(_user, _targetTile.getEntity());
	}
});