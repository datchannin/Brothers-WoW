/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.retributionaura_setup_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.retributionaura_setup";
		this.m.Name = "Retribution Aura Setup";
		this.m.Description = "You is under paladin Retribution Aura now. Your successful melee attack restores you [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] health. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_retributionaura.png";
		this.m.IconMini = "effect_mini_retributionaura";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
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
				id = 10,
				type = "text",
				icon = "ui/icons/health.png",
				text = "Successful melee attack restores [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] health."
			}
		];
	}

	function onAdded()
	{
		this.m.Container.removeByID("effects.devoutionaura_setup");
		this.m.Container.removeByID("effects.concentrationaura_setup");
		this.m.Container.removeByID("effects.sanctityaura_setup");
		
		local actor = this.getContainer().getActor();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}
			else
			{
				ally.getSkills().update();
			}
		}
	}

	function onMovementFinished()
	{
		local actor = this.getContainer().getActor();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());

		foreach( ally in allies )
		{
			if (ally.getID() != actor.getID())
			{
				ally.getSkills().update();
			}
		}
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());

		foreach( ally in allies )
		{
			if (ally.getID() != actor.getID())
			{
				ally.getSkills().update();
			}
		}
	}

	function onUpdate( _properties )
	{
		_properties.IsDevoutionAuraActive = false;
		_properties.IsRetributionAuraActive = true;
		_properties.IsConcentrationAuraActive = false;
		_properties.IsSanctityAuraActive = false;
		
		local actor = this.getContainer().getActor();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}
			else
			{
				ally.getSkills().update();
			}
		}
	}
});