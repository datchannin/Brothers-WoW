/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.druid_faeriefire_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.faeriefire_skill";
		this.m.Name = "Faerie Fire";
		this.m.Description = "This ability changes its effect depending on current druid form or state. Apply any of feral forms or moonfury to check the effect.";
		this.m.Icon = "ui/perks/skill_druid_faeriefire.png";
		this.m.IconDisabled = "ui/perks/skill_druid_faeriefire_sw.png";
		this.m.Overlay = "skill_druid_faeriefire";
		this.m.SoundOnUse = [
			//"sounds/combat/.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OtherTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 12;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		if (this.m.Container.hasSkill("effects.bearform"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Target Melee Skill will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points."
			});
		}

		if (this.m.Container.hasSkill("effects.catform"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Target Melee Defense will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points."
			});
		}

		if (this.m.Container.hasSkill("effects.moonfury"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Target Bravery will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points."
			});
		}

		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		return true;
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			if (this.m.Container.hasSkill("effects.bearform") || this.m.Container.hasSkill("effects.catform") || this.m.Container.hasSkill("effects.moonfury"))
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
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local skills = targetEntity.getSkills();
		local effect_cat = targetEntity.getSkills().getSkillByID("effects.faeriefire_cat");
		local effect_bear = targetEntity.getSkills().getSkillByID("effects.faeriefire_bear");
		local effect_moonfury = targetEntity.getSkills().getSkillByID("effects.faeriefire_moonfury");

		if (this.m.Container.hasSkill("effects.catform"))
		{
			skills.removeByID("effects.faeriefire_bear");
			skills.removeByID("effects.faeriefire_moonfury");
			if (effect_cat != null)
			{
				effect_cat.reset();
			}
			else
			{
				targetEntity.getSkills().add(this.new("scripts/skills/effects/faeriefire_cat_effect"));
			}
		}

		if (this.m.Container.hasSkill("effects.bearform"))
		{
			skills.removeByID("effects.faeriefire_cat");
			skills.removeByID("effects.faeriefire_moonfury");
			if (effect_bear != null)
			{
				effect_bear.reset();
			}
			else
			{
				targetEntity.getSkills().add(this.new("scripts/skills/effects/faeriefire_bear_effect"));
			}
		}

		if (this.m.Container.hasSkill("effects.moonfury"))
		{
			skills.removeByID("effects.faeriefire_cat");
			skills.removeByID("effects.faeriefire_bear");
			if (effect_moonfury != null)
			{
				effect_moonfury.reset();
			}
			else
			{
				targetEntity.getSkills().add(this.new("scripts/skills/effects/faeriefire_moonfury_effect"));
			}
		}

		this.spawnIcon("effect_druid_faeriefire", _targetTile);

		return true;
	}

});

