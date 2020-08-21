/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.paladin_devoutionaura_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.devoutionaura_skill";
		this.m.Name = "Devoution Aura";
		this.m.Description = "Apply Devoution Aura on the Paladin. This aura increases Melee Defense of all party members within 4 tiles by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color].";
		this.m.Icon = "ui/perks/skill_paladin_devoutionaura.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_devoutionaura_sw.png";
		this.m.Overlay = "skill_paladin_devoutionaura";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_devotionaura.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
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

	function getTooltip()
	{
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 + "[/color] Melee Defense for all party members within 4 tiles"
			},
		];
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