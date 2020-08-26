/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.paladin_holylight_skill <- this.inherit("scripts/skills/skill", {
	m = {
		IsMasterInLight = 0
	},
	function create()
	{
		this.m.ID = "actives.holylight_skill";
		this.m.Name = "Holy Light";
		this.m.Description = "Heal target with Holy Light.";
		this.m.Icon = "ui/perks/skill_paladin_holylight.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_holylight_sw.png";
		this.m.Overlay = "skill_paladin_holylight";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_holylight_precast.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/paladin_holylight_cast.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.MinRange = 0;
		this.m.MaxRange = 2;
	}

	function getTooltip()
	{
		if (this.m.IsMasterInLight == 0)
		{
			return [
				{
					id = 1,
					type = "title",
					text = "Holy Light"
				},
				{
					id = 2,
					type = "description",
					text = "Heal target with Holy Light."
				},
				{
					id = 3,
					type = "text",
					text = this.getCostString()
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/heal.png",
					text = "Heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]7[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]14[/color] Hitpoints."
				},
			];
		}
		else
		{
			return [
				{
					id = 1,
					type = "title",
					text = "Great Holy Light"
				},
				{
					id = 2,
					type = "description",
					text = "You know how to increase healing effency. Heal target with Great Holy Light."
				},
				{
					id = 3,
					type = "text",
					text = this.getCostString()
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/heal.png",
					text = "Heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]17[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]24[/color] Hitpoints."
				},
			];
		}
	}

	function onAfterUpdate( _properties )
	{
		if (_properties.IsMasterInLight)
		{
			this.m.IsMasterInLight = 1;
		}
		else
		{
			this.m.IsMasterInLight = 0;
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local targetEntity = _targetTile.getEntity();

		if (targetEntity.getHitpoints() <= 0)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(targetEntity))
		{
			return false;
		}

		if (!targetEntity.isAlive())
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local healnumber = this.Math.rand(7, 14);

		this.Time.scheduleEvent(this.TimeUnit.Real, 1200, this.onApplyEffect.bindenv(this), {
			Skill = this,
			Target = targetEntity,
			Healnumber = healnumber,
		});
		
		return true;
	}
	
	function onApplyEffect( _data )
	{
		local targetEntity = _data.Target;
		local healnumber = _data.Healnumber;

		this.spawnIcon("effect_paladin_holylight", targetEntity.getTile());

		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[0], this.Const.Sound.Volume.Skill, targetEntity.getPos());
		}

		if (targetEntity.getHitpoints() == targetEntity.getHitpointsMax())
		{
			return;
		}

		if (this.m.IsMasterInLight == 0)
		{
			if (!targetEntity.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " was healed for " + this.Math.min(targetEntity.getHitpointsMax() - targetEntity.getHitpoints(), healnumber) + " hitpoints");
			}
			targetEntity.setHitpoints(this.Math.min(targetEntity.getHitpointsMax(), targetEntity.getHitpoints() + healnumber));
		}
		else
		{
			healnumber = healnumber+10;
			if (!targetEntity.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " was healed for " + this.Math.min(targetEntity.getHitpointsMax() - targetEntity.getHitpoints(), healnumber) + " hitpoints");
			}
			targetEntity.setHitpoints(this.Math.min(targetEntity.getHitpointsMax(), targetEntity.getHitpoints() + healnumber));
		}

		targetEntity.onUpdateInjuryLayer();
	}
});