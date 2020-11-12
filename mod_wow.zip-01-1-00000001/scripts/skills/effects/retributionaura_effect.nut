/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.retributionaura_effect <- this.inherit("scripts/skills/skill", {
	m = {
		PaladinCurrentLevel = 1,
		BaseEffect = 4,
		BaseRadius = 4,
		BonusRadius = 0
	},
	function create()
	{
		this.m.ID = "effects.retributionaura";
		this.m.Name = "Retribution Aura";
		this.m.Description = "You is under Paladin\'s Retribution Aura now. Your successful melee attack restores you Hitpoints. Keep closer.";
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
		this.m.PaladinCurrentLevel = 1;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			if (ally.getSkills().hasSkill("perk.wow.paladin.retributionaura"))
			{
				if (ally.getCurrentProperties().IsRetributionAuraActive)
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

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		local bonus = this.getBonus();
		local total_value = getTotalEffectValue();

		if (!bonus)
		{
			return;
		}

		if (_attacker == null || !_attacker.isAlive())
		{
			return;
		}

		if (_attacker.isAlliedWith(this.getContainer().getActor()))
		{
			return;
		}

		if (_damageHitpoints == 0 && _damageArmor == 0)
		{
			return;
		}

		if (_attacker.getTile().getDistanceTo(this.getContainer().getActor().getTile()) > 1)
		{
			return;
		}

		this.getContainer().setBusy(true);

		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.applyDamage.bindenv(this), {
			Attacker = _attacker,
			Damage = total_value
		});
	}
	
	function applyDamage( _data )
	{
		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = _data.Damage;
		hitInfo.DamageDirect = 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.FatalityChanceMult = 0.0;

		this.spawnIcon("effect_paladin_retributionaura", _data.Attacker.getTile());
		_data.Attacker.onDamageReceived(this.getContainer().getActor(), this, hitInfo);
		this.getContainer().setBusy(false);
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