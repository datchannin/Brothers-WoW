this.retributionaura_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.retributionaura";
		this.m.Name = "Retribution Aura";
		this.m.Description = "You is under paladin Retribution Aura now. Your successful melee attack restores you [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] health. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_retributionaura.png";
		this.m.IconMini = "effect_mini_retributionaura";
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
				icon = "ui/icons/health.png",
				text = "Successful melee attack restores [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] health."
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

			if (ally.hasPerk("perk.wow.paladin.retributionaura"))
			{
				if (ally.getCurrentProperties().IsRetributionAuraActive)
				{
					isBonusShouldApply = 1;
				}
			}
		}

		return isBonusShouldApply;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local bonus = this.getBonus();
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
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + this.Math.min(actor.getHitpointsMax() - actor.getHitpoints(), 4) + " points");
			}

			actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 4));
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
		if (bonus == 1)
		{
			this.m.IsHidden = false;

		}
		else
		{
			this.m.IsHidden = true;
		}
	}
});