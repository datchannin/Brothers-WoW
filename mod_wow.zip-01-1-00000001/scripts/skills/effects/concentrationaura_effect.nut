this.concentrationaura_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.concentrationaura";
		this.m.Name = "Concentration Aura";
		this.m.Description = "You is under paladin Concentration Aura now. Your Fatigue Recovery per turn is increased by Paladin\'s Aura. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_concentrationaura.png";
		this.m.IconMini = "effect_mini_concentrationaura";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Fatigue Recovery per turn for all party members within 4 tiles"
			}
		];
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
		{
			return 0;
		}

		local myTile = actor.getTile();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local isBonusShouldApply = 0;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			if (ally.getTile().getDistanceTo(myTile) > 4)
			{
				continue;
			}

			if (ally.hasPerk("perk.wow.paladin.concentrationaura"))
			{
				if (ally.getCurrentProperties().IsConcentrationAuraActive)
				{
					isBonusShouldApply = 1;
				}
			}
		}

		return isBonusShouldApply;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = true;
	}
	
	function onAfterUpdate( _properties )
	{
		local bonus = this.getBonus();
		if (bonus == 1)
		{
			this.m.IsHidden = false;
			_properties.FatigueRecoveryRate += 3;
		}
		else
		{
			this.m.IsHidden = true;
		}
	}
});