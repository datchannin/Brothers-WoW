/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.paladin_retributionaura_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.retributionaura_skill";
		this.m.Name = "Retribution Aura";
		this.m.Description = "Apply Retribution Aura on the Paladin. This aura gives possibility of all party members within 4 tiles to restore [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] health with every successful melee attack.";
		this.m.Icon = "ui/perks/skill_paladin_retributionaura.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_retributionaura_sw.png";
		this.m.Overlay = "skill_paladin_retributionaura";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_retributionaura.wav",
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
				icon = "ui/icons/health.png",
				text = "Successful melee attack restores [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] health."
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