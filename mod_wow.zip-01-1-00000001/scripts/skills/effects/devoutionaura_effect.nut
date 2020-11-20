/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.devoutionaura_effect <- this.inherit("scripts/skills/skill", {
	m = {
		PaladinCurrentLevel = 1,
		BaseEffect = 10,
		BaseRadius = 4,
		BonusRadius = 0
	},
	function create()
	{
		this.m.ID = "effects.devoutionaura";
		this.m.Name = "Devotion Aura";
		this.m.Description = "You is under Paladin\'s Devotion Aura now. Your Melee Defense is increased by Paladin\'s Aura. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_devoutionaura.png";
		this.m.IconMini = "effect_mini_devoutionaura";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTotalEffectValue()
	{
		local total_value = this.m.BaseEffect;
		local scale = 0;
		local level_for_effect = this.Math.floor(this.m.PaladinCurrentLevel/5);

		scale = this.Math.floor(level_for_effect * this.Const.PaladinScale.devoutionaura);
		total_value += scale;

		return total_value;
	}

	function getTotalRadiusValue()
	{
		local total_value = this.m.BaseRadius;
		local total_bonus = this.m.BonusRadius;

		total_value += total_bonus;

		return total_value;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		local total_value = getTotalEffectValue();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + total_value + "[/color] Melee Defense"
		});

		return ret;
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
		this.m.PaladinCurrentLevel = 1;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			if (ally.getSkills().hasSkill("perk.wow.paladin.devoutionaura"))
			{
				if (ally.getCurrentProperties().IsDevoutionAuraActive)
				{
					this.m.BonusRadius = ally.getCurrentProperties().AuraRadiusBonus;
					local total_radius = getTotalRadiusValue();
					if (ally.getTile().getDistanceTo(myTile) <= total_radius)
					{
						if (ally.getLevel() > this.m.PaladinCurrentLevel)
						{
							this.m.PaladinCurrentLevel = ally.getLevel();
						}
						isBonusShouldApply = 1;
					}
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
		local actor = this.getContainer().getActor();
		local total_value = getTotalEffectValue();

		if (bonus == 1)
		{
			this.m.IsHidden = false;
			_properties.MeleeDefense += total_value;
			if (actor.hasSprite("aura"))
			{
				actor.getSprite("aura").setBrush("anim_paladin_devoutionaura");
				actor.getSprite("aura").Visible = true;
			}
		}
		else
		{
			this.m.IsHidden = true;
			if (actor.hasSprite("aura"))
			{
				actor.getSprite("aura").Visible = false;
			}
		}
	}
});