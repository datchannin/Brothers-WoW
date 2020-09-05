/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.druid_innervate_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseFatigueValue = 30,
		clarity = false
	},
	function create()
	{
		this.m.ID = "actives.innervate_skill";
		this.m.Name = "Innervate";
		this.m.Description = "Reduces target Fatigue.";
		this.m.Icon = "ui/perks/skill_druid_innervate.png";
		this.m.IconDisabled = "ui/perks/skill_druid_innervate_sw.png";
		this.m.Overlay = "skill_druid_innervate";
		this.m.SoundOnUse = [
			"sounds/combat/druid_innervate.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
	}

	function getInnervatePower()
	{
		local innervatepower = this.m.BaseFatigueValue;
		if (this.m.clarity)
		{
			innervatepower += 5;
		}

		return innervatepower;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local innervatepower = getInnervatePower();
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces part of target Fatigue. You add for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.FatigueCost + "[/color] points to your fatigue and your target reduces for [color=" + this.Const.UI.Color.PositiveValue + "]" + innervatepower + "[/color] points of his fatigue."
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
		this.m.clarity = user.getSkills().hasSkill("perk.wow.druid.clarity");
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local innervatepower = getInnervatePower();

		this.spawnIcon("effect_druid_innervate", _targetTile);
		targetEntity.setFatigue(targetEntity.getFatigue() - innervatepower);
		
		return true;
	}
});

