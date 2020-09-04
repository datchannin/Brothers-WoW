this.druid_ferociousbite_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Recharge = 0
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

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local ret = this.getDefaultTooltip();

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
		_properties.DamageRegularMin += 40;
		_properties.DamageRegularMax += 50;
		_properties.DamageArmorMult *= 0.1;
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