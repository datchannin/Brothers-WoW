/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.druid_prowl_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.prowl_skill";
		this.m.Name = "Prowl";
		this.m.Description = "Cat can use this skill to prowl near enemy.";
		this.m.Icon = "ui/perks/skill_druid_prowl.png";
		this.m.IconDisabled = "ui/perks/skill_druid_prowl_sw.png";
		this.m.Overlay = "skill_druid_prowl";
		this.m.SoundOnUse = [
			"sounds/combat/druid_prowl.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Use this skill to have possibility to ignore hostile zone of control for this turn."
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
		local effect = _user.getSkills().getSkillByID("effects.prowl");

		if (effect == null)
		{
			_user.getSkills().add(this.new("scripts/skills/effects/prowl_effect"));
		}

		return true;
	}
});

