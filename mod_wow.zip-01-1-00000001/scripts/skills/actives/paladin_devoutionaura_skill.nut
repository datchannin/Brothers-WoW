/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_devoutionaura_skill <- this.inherit("scripts/skills/skill", {
	m = {
		CurrentLevel = 1,
		BaseEffect = 10,
		BaseRadius = 4,
		BonusRadius = 0,
		T0_paladin_set = false
	},
	function create()
	{
		this.m.ID = "actives.devoutionaura_skill";
		this.m.Name = "Devotion Aura";
		this.m.Description = "Apply Devotion Aura on the Paladin. This aura increases Melee Defense of all party members near Paladin.";
		this.m.Icon = "ui/perks/skill_paladin_devoutionaura.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_devoutionaura_sw.png";
		this.m.Overlay = "skill_paladin_devoutionaura";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_devotionaura.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTotalEffectValue()
	{
		local total_value = this.m.BaseEffect;
		local scale = 0;
		local level_for_effect = this.Math.floor(this.m.CurrentLevel/5);

		scale = this.Math.floor(level_for_effect * this.Const.PaladinScale.devoutionaura);
		total_value += scale;

		return total_value;
	}

	function getTotalRadiusValue()
	{
		local total_value = this.m.BaseRadius;
		local total_bonus = this.m.BonusRadius;

		total_value += total_bonus;

		return total_value;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_value = getTotalEffectValue();
		local total_radius = getTotalRadiusValue();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + total_value + "[/color] Melee Defense for all party members within [color=" + this.Const.UI.Color.PositiveValue + "]" + total_radius + "[/color] tiles"
		});

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.T0_paladin_set = _properties.isFullSetPaladinT0();
		this.m.BonusRadius = _properties.AuraRadiusBonus;
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.T0_paladin_set)
		{
			this.m.ActionPointCost = 0;
		}
		else
		{
			this.m.ActionPointCost = 9;
		}
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		if (!this.getContainer().hasSkill("effects.devoutionaura_setup"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/devoutionaura_setup_effect"));
			
			local actor = this.getContainer().getActor();
			local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
			foreach( ally in allies )
			{
				ally.getSkills().update();
			}
			
			return true;
		}

		return false;
	}
});