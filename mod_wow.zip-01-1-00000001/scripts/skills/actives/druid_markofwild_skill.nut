/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.druid_markofwild_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ResolveValue = 20,
		TurnBase = 3,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.markofwild_skill";
		this.m.Name = "Mark of Wild";
		this.m.Description = "Buff the target and increase his resolve during three turns.";
		this.m.Icon = "ui/perks/skill_druid_markofwild.png";
		this.m.IconDisabled = "ui/perks/skill_druid_markofwild_sw.png";
		this.m.Overlay = "skill_druid_markofwild";
		this.m.SoundOnUse = [
			"sounds/combat/druid_markofwild.wav"
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

	function getTotalValue()
	{
		local resolve = this.m.ResolveValue;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentLevel * this.Const.DruidScale.markofwild);
		resolve += scale;

		return resolve;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local resolve = getTotalValue();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Increases the target\'s Resolve for [color=" + this.Const.UI.Color.PositiveValue + "]" + resolve + "[/color] points during three turns."
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
		this.m.CurrentLevel = user.getLevel();
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local effect = targetEntity.getSkills().getSkillByID("effects.markofwild");
		local resolve = getTotalValue();

		if (effect != null)
		{
			effect.resetTime(this.m.TurnBase);
		}
		else
		{
			local mark = this.new("scripts/skills/effects/markofwild_effect");
			mark.setValue(resolve);
			mark.resetTime(this.m.TurnBase);
			targetEntity.getSkills().add(mark);
		}

		this.spawnIcon("effect_druid_markofwild", _targetTile);

		return true;
	}
});

