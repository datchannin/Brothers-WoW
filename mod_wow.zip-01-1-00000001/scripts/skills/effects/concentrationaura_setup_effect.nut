/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.concentrationaura_setup_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.concentrationaura_setup";
		this.m.Name = "Concentration Aura Setup";
		this.m.Description = "You is under paladin Concentration Aura now. Your Fatigue Recovery per turn is increased by Paladin\'s Aura. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_concentrationaura.png";
		this.m.IconMini = "effect_mini_concentrationaura";
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
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Fatigue Recovery per turn for all party members within 4 tiles"
			}
		];
	}

	function onAdded()
	{
		this.m.Container.removeByID("effects.devoutionaura_setup");
		this.m.Container.removeByID("effects.retributionaura_setup");
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
		_properties.IsRetributionAuraActive = false;
		_properties.IsConcentrationAuraActive = true;
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