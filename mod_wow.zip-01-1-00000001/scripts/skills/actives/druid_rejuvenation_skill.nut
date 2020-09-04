/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.druid_rejuvenation_skill <- this.inherit("scripts/skills/skill", {
	m = {
		HealValue = 7,
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

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/heal.png",
			text = "Heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.HealValue + "[/color] hitpoints over two turns."
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

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local effect = targetEntity.getSkills().getSkillByID("effects.rejuvenation");

		if (effect != null)
		{
			effect.reset();
		}
		else
		{
			//targetEntity.getSkills().add(this.new("scripts/skills/effects/rejuvenation_effect"));
		}

		this.spawnIcon("effect_druid_rejuvenation", _targetTile);
		targetEntity.onUpdateInjuryLayer();

		return true;
	}
});

