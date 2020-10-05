/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.retributionaura_effect <- this.inherit("scripts/skills/skill", {
	m = {
		PaladinCurrentLevel = 1,
		BaseEffect = 4		
	},
	function create()
	{
		this.m.ID = "effects.retributionaura";
		this.m.Name = "Retribution Aura";
		this.m.Description = "You is under paladin Retribution Aura now. Your successful melee attack restores you Hitpoints. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_retributionaura.png";
		this.m.IconMini = "effect_mini_retributionaura";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTotalEffectValue()
	{
		local total_value = this.m.BaseEffect;
		local scale = 0;
		local level_for_effect = this.Math.floor(this.m.PaladinCurrentLevel/5);

		scale = this.Math.floor(level_for_effect * this.Const.PaladinScale.retributionaura);
		total_value += scale;

		return total_value;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_value = getTotalEffectValue();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Successful melee attack restores [color=" + this.Const.UI.Color.PositiveValue + "]" + total_value + "[/color] Hitpoints"
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

			if (ally.getSkills().hasSkill("perk.wow.paladin.retributionaura"))
			{
				if (ally.getCurrentProperties().IsRetributionAuraActive)
				{
					this.m.PaladinCurrentLevel = ally.getLevel();
					isBonusShouldApply = 1;
				}
			}
		}

		return isBonusShouldApply;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local bonus = this.getBonus();
		local total_value = getTotalEffectValue();

		if (bonus == 1)
		{
			if (_damageInflictedHitpoints <= 0)
			{
				return;
			}

			local actor = this.m.Container.getActor();

			if (actor.getHitpoints() == actor.getHitpointsMax())
			{
				return;
			}

			this.spawnIcon("effect_paladin_retributionaura", actor.getTile());

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
			if (actor.hasSprite("aura3"))
			{
				actor.getSprite("aura3").setBrush("anim_paladin_retributionaura");
				actor.getSprite("aura3").Visible = true;
			}
		}
		else
		{
			this.m.IsHidden = true;
			if (actor.hasSprite("aura3"))
			{
				actor.getSprite("aura3").Visible = false;
			}
		}
	}
});