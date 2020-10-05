/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.paladin_retributionaura_skill <- this.inherit("scripts/skills/skill", {
	m = {
		CurrentLevel = 1,
		BaseEffect = 4,
	},
	function create()
	{
		this.m.ID = "actives.retributionaura_skill";
		this.m.Name = "Retribution Aura";
		this.m.Description = "Apply Retribution Aura on the Paladin. This aura gives possibility of all party members within 4 tiles to restore hitpoints with every successful melee attack.";
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

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_value = getTotalEffectValue();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Successful melee attack restores [color=" + this.Const.UI.Color.PositiveValue + "]" + total_value + "[/color] Hitpoints for all party members within 4 tiles"
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