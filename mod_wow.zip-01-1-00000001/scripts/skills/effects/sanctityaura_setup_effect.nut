/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.05, game_version = 1.4.0.37*/
this.sanctityaura_setup_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.sanctityaura_setup";
		this.m.Name = "Sanctity Aura Setup";
		this.m.Description = "You is under paladin Sanctity Aura now. Hitpoints Regeneration of all party members within 4 tiles increases by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] points. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_sanctityaura.png";
		this.m.IconMini = "effect_mini_sanctityaura";
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Hitpoints per turn for all party members within 4 tiles."
			}
		];
	}

	function onAdded()
	{
		this.m.Container.removeByID("effects.devoutionaura_setup");
		this.m.Container.removeByID("effects.concentrationaura_setup");
		this.m.Container.removeByID("effects.retributionaura_setup");
		
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
		_properties.IsConcentrationAuraActive = false;
		_properties.IsSanctityAuraActive = true;
		
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