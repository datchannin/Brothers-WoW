/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.rogue_fasttoxin_skill <- this.inherit("scripts/skills/skill", {
	m = {
		poison_damage = 0
	},
	function create()
	{
		this.m.ID = "actives.fasttoxin_skill";
		this.m.Name = "Fast Toxin";
		this.m.Description = "Consumes a Poison effect on an enemy target to instantly damage him an amount equal to summ of consumed coming Poison damage.";
		this.m.Icon = "ui/perks/skill_rogue_fasttoxin.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_fasttoxin_sw.png";
		this.m.Overlay = "skill_rogue_fasttoxin";
		this.m.SoundOnUse = [
			//"sounds/combat/",
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
		];
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();

		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (targetEntity != null)
		{
			local poison = targetEntity.getSkills().getSkillByID("effects.rogue_poison");
			if (poison != null)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUpdate( _properties )
	{
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local poison = targetEntity.getSkills().getSkillByID("effects.rogue_poison");
		local poison_turns = 0;
		local poison_tick = 0;

		if (poison != null)
		{
			poison_turns = poison.getTurns();
			poison_tick = poison.getDamage();
			this.m.poison_damage = poison_turns * poison_tick;
		}

		if (this.m.poison_damage > 0)
		{
			applyDamage(_user, targetEntity);
		}

		return true;
	}
	
	function applyDamage(_userEntity, _targetEntity)
	{
		this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
		}

		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = this.m.poison_damage;
		hitInfo.DamageDirect = 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.FatalityChanceMult = 0.0;
		_targetEntity.onDamageReceived(_userEntity, this, hitInfo);
	}
});