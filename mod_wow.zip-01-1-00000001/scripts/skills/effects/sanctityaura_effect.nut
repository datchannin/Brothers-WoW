/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.sanctityaura_effect <- this.inherit("scripts/skills/skill", {
	m = {
		PaladinCurrentLevel = 1,
		BaseEffect = 2,
		BaseRadius = 4
	},
	function create()
	{
		this.m.ID = "effects.sanctityaura";
		this.m.Name = "Sanctity Aura";
		this.m.Description = "You is under Paladin\'s Sanctity Aura now. You regenerate Hitpoints on every turn. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_sanctityaura.png";
		this.m.IconMini = "effect_mini_sanctityaura";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTotalEffectValue()
	{
		local total_value = this.m.BaseEffect;
		local scale = 0;
		local level_for_effect = this.Math.floor(this.m.PaladinCurrentLevel/5);

		scale = this.Math.floor(level_for_effect * this.Const.PaladinScale.sanctityaura);
		total_value += scale;

		return total_value;
	}

	function getTotalRadiusValue()
	{
		local total_value = this.m.BaseRadius;

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
			icon = "ui/icons/health.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + total_value + "[/color] Hitpoints per turn"
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

			if (ally.getSkills().hasSkill("perk.wow.paladin.sanctityaura"))
			{
				if (ally.getCurrentProperties().IsSanctityAuraActive)
				{
					isBonusShouldApply = 1;
					this.m.PaladinCurrentLevel = ally.getLevel();
				}
			}
		}

		return isBonusShouldApply;
	}

	function onTurnStart()
	{
		local bonus = this.getBonus();
		local total_value = getTotalEffectValue();

		if (bonus == 1)
		{
			local actor = this.m.Container.getActor();

			if (actor.getHitpoints() == actor.getHitpointsMax())
			{
				return;
			}
			
			this.spawnIcon("effect_paladin_sanctityaura", actor.getTile());
			
			if (!actor.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + this.Math.min(actor.getHitpointsMax() - actor.getHitpoints(), total_value) + " points");
			}

			actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + total_value));
			actor.onUpdateInjuryLayer();
		}
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = true;
	}
	
	function onAfterUpdate( _properties )
	{
		local bonus = this.getBonus();
		local actor = this.getContainer().getActor();
		if (bonus == 1)
		{
			this.m.IsHidden = false;
			if (actor.hasSprite("aura4"))
			{
				actor.getSprite("aura4").setBrush("anim_paladin_sanctityaura");
				actor.getSprite("aura4").Visible = true;
			}
		}
		else
		{
			this.m.IsHidden = true;
			if (actor.hasSprite("aura4"))
			{
				actor.getSprite("aura4").Visible = false;
			}
		}
	}
});