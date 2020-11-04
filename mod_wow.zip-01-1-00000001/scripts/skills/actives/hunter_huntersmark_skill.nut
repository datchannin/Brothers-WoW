/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.hunter_huntersmark_skill <- this.inherit("scripts/skills/skill", {
	m = {
		DamageTakenValue = 5,
		T0_hunter_armor = false,
		T0_hunter_head = false
	},
	function create()
	{
		this.m.ID = "actives.huntersmark_skill";
		this.m.Name = "Hunter\'s Mark";
		this.m.Description = "Mark the target for several turns and increase his damage taken";
		this.m.Icon = "ui/perks/skill_hunter_huntersmark.png";
		this.m.IconDisabled = "ui/perks/skill_hunter_huntersmark_sw.png";
		this.m.Overlay = "skill_hunter_huntersmark";
		this.m.SoundOnUse = [
			"sounds/combat/hunter_huntersmark.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 8;
	}

	function getDamageTakenValue()
	{
		local total_damage_taken_value = this.m.DamageTakenValue;

		if (this.m.T0_hunter_armor)
		{
			total_damage_taken_value += 5;
		}

		return total_damage_taken_value;
	}

	function getTooltip()
	{
		local total_damage_taken_value = getDamageTakenValue();
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Increase target damage taken by [color=" + this.Const.UI.Color.NegativeValue + "]" + total_damage_taken_value + "%[/color]"
			}
		];
		
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

	function onUpdate( _properties )
	{
		this.m.T0_hunter_armor = _properties.T0_hunter_armor;
		this.m.T0_hunter_head = _properties.T0_hunter_head;
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.T0_hunter_head)
		{
			this.m.ActionPointCost = 0;
		}
		else
		{
			this.m.ActionPointCost = 5;
		}
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local mark = targetEntity.getSkills().getSkillByID("effects.huntersmark");
		local total_damage_taken_value = getDamageTakenValue();

		if (mark == null)
		{
			local effect = this.new("scripts/skills/effects/huntersmark_effect");
			effect.setValue(total_damage_taken_value);
			targetEntity.getSkills().add(effect);
		}
		else
		{
			mark.resetTime();
		}

		return true;
	}
});