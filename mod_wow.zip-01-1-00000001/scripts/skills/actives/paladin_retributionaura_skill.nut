/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_retributionaura_skill <- this.inherit("scripts/skills/skill", {
	m = {
		CurrentLevel = 1,
		BaseEffect = 4,
		BaseRadius = 4,
		BonusRadius = 0,
		T0_paladin_set = false
	},
	function create()
	{
		this.m.ID = "actives.retributionaura_skill";
		this.m.Name = "Retribution Aura";
		this.m.Description = "Apply Retribution Aura on the Paladin. This aura causes direct damage to melee attacker of all party members near Paladin.";
		this.m.Icon = "ui/perks/skill_paladin_retributionaura.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_retributionaura_sw.png";
		this.m.Overlay = "skill_paladin_retributionaura";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_retributionaura.wav",
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

		scale = this.Math.floor(level_for_effect * this.Const.PaladinScale.retributionaura);
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
			icon = "ui/icons/direct_damage.png",
			text = "Causes [color=" + this.Const.UI.Color.PositiveValue + "]" + total_value + "[/color] points direct damage to melee attacker for all party members within [color=" + this.Const.UI.Color.PositiveValue + "]" + total_radius + "[/color] tiles"
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
		if (!this.getContainer().hasSkill("effects.retributionaura_setup"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/retributionaura_setup_effect"));
			
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