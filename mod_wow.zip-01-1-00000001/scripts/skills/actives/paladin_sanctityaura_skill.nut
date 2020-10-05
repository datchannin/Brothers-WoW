/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.paladin_sanctityaura_skill <- this.inherit("scripts/skills/skill", {
	m = {
		CurrentLevel = 1,
		BaseEffect = 2,
	},
	function create()
	{
		this.m.ID = "actives.sanctityaura_skill";
		this.m.Name = "Sanctity Aura";
		this.m.Description = "Apply Sanctity Aura on the Paladin. This aura increases Hitpoints Regeneration of all party members within 4 tiles.";
		this.m.Icon = "ui/perks/skill_paladin_sanctityaura.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_sanctityaura_sw.png";
		this.m.Overlay = "skill_paladin_sanctityaura";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_sanctityaura.wav"
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

		scale = this.Math.floor(level_for_effect * this.Const.PaladinScale.sanctityaura);
		total_value += scale;

		return total_value;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_value = getTotalEffectValue();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + total_value + "[/color] Hitpoints per turn for all party members within 4 tiles"
		});

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
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
		if (!this.getContainer().hasSkill("effects.sanctityaura_setup"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/sanctityaura_setup_effect"));
			
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