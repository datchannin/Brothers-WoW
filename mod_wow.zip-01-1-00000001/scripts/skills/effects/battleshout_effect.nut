/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.battleshout_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Difference = 0,
	},
	function create()
	{
		this.m.ID = "effects.battleshout";
		this.m.Name = "Battle Shout";
		this.m.Description = "Your melee attack increased by Warrior\'s Battle Shout. Keep closer.";
		this.m.Icon = "ui/perks/perk_warrior_battleshout.png";
		this.m.IconMini = "effect_mini_battleshout";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		local bonus = this.m.Difference;
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
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] MeleeSkill"
			}
		];
	}

	function getBonus( _properties )
	{
		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
		{
			return 0;
		}

		local myTile = actor.getTile();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local bonus = 0;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			if (ally.getTile().getDistanceTo(myTile) > 2)
			{
				continue;
			}

			if (_properties.MeleeSkill * _properties.MeleeSkillMult >= ally.m.CurrentProperties.MeleeSkill * ally.m.CurrentProperties.MeleeSkillMult)
			{
				continue;
			}

			if (ally.getSkills().hasSkill("perk.wow.warrior.battle_shout"))
			{
				if ((ally.m.CurrentProperties.MeleeSkill * ally.m.CurrentProperties.MeleeSkillMult) > bonus)
				{
					bonus = (ally.m.CurrentProperties.MeleeSkill * ally.m.CurrentProperties.MeleeSkillMult);
				}
			}
		}

		if (bonus != 0)
		{
			bonus = this.Math.min(bonus * 0.1, bonus - _properties.MeleeSkill * _properties.MeleeSkillMult);
		}

		return bonus;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = true;
	}
	
	function onAfterUpdate( _properties )
	{
		local bonus = this.getBonus(_properties);

		if (bonus != 0)
		{
			this.m.IsHidden = false;
			_properties.MeleeSkill += bonus;
			this.m.Difference = bonus;
		}
		else
		{
			this.m.IsHidden = true;
			this.m.Difference = 0;
		}
	}
});

