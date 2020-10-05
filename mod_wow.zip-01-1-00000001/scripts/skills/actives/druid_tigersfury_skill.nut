/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.druid_tigersfury_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.tigersfury_skill";
		this.m.Name = "Tiger\'s Fury";
		this.m.Description = "Damage done is increased by 20% for this turn.";
		this.m.Icon = "ui/perks/skill_druid_tigersfury.png";
		this.m.IconDisabled = "ui/perks/skill_druid_tigersfury_sw.png";
		this.m.Overlay = "skill_druid_tigersfury";
		this.m.SoundOnUse = [
			"sounds/combat/druid_tigersfury.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 10;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Damage dealt will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]"
		});

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.tigersfury");
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
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

	function onUse( _user, _targetTile )
	{
		if (!this.getContainer().hasSkill("effects.tigersfury"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/tigersfury_effect"));
			return true;
		}

		return false;
	}

});

