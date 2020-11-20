/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.devoutionaura_setup_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.devoutionaura_setup";
		this.m.Name = "Devoution Aura Setup";
		this.m.Description = "You is under paladin Devoution Aura now. Your Melee Defence is increased by Paladin\'s Aura. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_devoutionaura.png";
		this.m.IconMini = "effect_mini_devoutionaura";
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
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 + "[/color] Melee Defense"
			}
		];
	}

	function updateAlly()
	{
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

	function onAdded()
	{
		this.m.Container.removeByID("effects.retributionaura_setup");
		this.m.Container.removeByID("effects.concentrationaura_setup");
		this.m.Container.removeByID("effects.sanctityaura_setup");
		updateAlly();
	}

	function onMovementFinished()
	{
		updateAlly();
	}

	function onRemoved()
	{
		updateAlly();
	}

	function onUpdate( _properties )
	{
		_properties.IsDevoutionAuraActive = true;
		_properties.IsRetributionAuraActive = false;
		_properties.IsConcentrationAuraActive = false;
		_properties.IsSanctityAuraActive = false;
		updateAlly();
	}
});