/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.druid_rejuvenation_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseHealValue = 7,
		swiftmend = false
	},
	function create()
	{
		this.m.ID = "actives.rejuvenation_skill";
		this.m.Name = "Rejuvenation";
		this.m.Description = "Heals the target during two turns.";
		this.m.Icon = "ui/perks/skill_druid_rejuvenation.png";
		this.m.IconDisabled = "ui/perks/skill_druid_rejuvenation_sw.png";
		this.m.Overlay = "skill_druid_rejuvenation";
		this.m.SoundOnUse = [
			"sounds/combat/druid_rejuvenation.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OtherTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 12;
		this.m.MinRange = 0;
		this.m.MaxRange = 2;
	}

	function getHealPower()
	{
		local healpower = this.m.BaseHealValue;
		if (this.m.swiftmend)
		{
			healpower += 5;
		}

		return healpower;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local healpower = getHealPower();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/heal.png",
			text = "Heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]" + healpower + "[/color] hitpoints over two turns."
		});

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.moonfury"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();

		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (targetEntity == null)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(targetEntity))
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.swiftmend = user.getSkills().hasSkill("perk.wow.druid.swiftmend");
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local effect = targetEntity.getSkills().getSkillByID("effects.rejuvenation");
		local healpower = getHealPower();

		if (effect != null)
		{
			effect.reset();
			effect.setpower(healpower);
		}
		else
		{
			targetEntity.getSkills().add(this.new("scripts/skills/effects/rejuvenation_effect"));
			local effect2 = targetEntity.getSkills().getSkillByID("effects.rejuvenation");
			effect2.setpower(healpower);
		}

		this.spawnIcon("effect_druid_rejuvenation", _targetTile);
		targetEntity.onUpdateInjuryLayer();

		return true;
	}
});

