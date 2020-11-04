/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.rogue_camouflage_skill <- this.inherit("scripts/skills/skill", {
	m = {
		T0_rogue_head = false,
		BaseDuration = 2
	},
	function create()
	{
		this.m.ID = "actives.camouflage_skill";
		this.m.Name = "Camouflage";
		this.m.Description = "Increase character\'s Melee Defense for several turns and allow to ignore hostile zone of control.";
		this.m.Icon = "ui/perks/skill_rogue_camouflage.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_camouflage_sw.png";
		this.m.Overlay = "skill_rogue_camouflage";
		this.m.SoundOnUse = [
			"sounds/combat/rogue_camouflage.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTotalDuration()
	{
		local duration = this.m.BaseDuration;

		if (this.m.T0_rogue_head)
		{
			duration += 1;
		}

		return duration;
	}

	function getTooltip()
	{
		local duration = getTotalDuration();
		return [
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
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] for [color=" + this.Const.UI.Color.PositiveValue + "]" + duration + "[/color] turns"
			}
		];
	}

	function onUpdate( _properties )
	{
		this.m.T0_rogue_head = _properties.T0_rogue_head;
	}

	function onUse( _user, _targetTile )
	{
		local camouflage = _user.getSkills().getSkillByID("effects.camouflage");
		local duration = getTotalDuration();

		if (camouflage != null)
		{
			camouflage.reset();
		}
		else
		{
			local effect = this.new("scripts/skills/effects/camouflage_effect");
			effect.setDuration(duration);
			_user.getSkills().add(effect);
		}

		return true;
	}
});