/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.druid_abolishpoison_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.abolishpoison_skill";
		this.m.Name = "Abolish Poison";
		this.m.Description = "Removes the Poisoned status from targer.";
		this.m.Icon = "ui/perks/skill_druid_abolishpoison.png";
		this.m.IconDisabled = "ui/perks/skill_druid_abolishpoison_sw.png";
		this.m.Overlay = "skill_druid_abolishpoison";
		this.m.SoundOnUse = [
			//"sounds/combat/"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OtherTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 10;
		this.m.MinRange = 0;
		this.m.MaxRange = 2;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Removes the Poisoned status effect"
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
		local user = _targetTile.getEntity();
		//this.spawnIcon("", _targetTile);

		while (user.getSkills().hasSkill("effects.goblin_poison"))
		{
			user.getSkills().removeByID("effects.goblin_poison");
		}

		while (user.getSkills().hasSkill("effects.spider_poison"))
		{
			user.getSkills().removeByID("effects.spider_poison");
		}

		return true;
	}
});

