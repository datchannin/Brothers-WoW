/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.rogue_poison_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 1,
		Damage = 10,
		Actor = null
	},	

	function create()
	{
		this.m.ID = "effects.rogue_poison";
		this.m.Name = "Poisoned";
		this.m.KilledString = "Died from poison";
		this.m.Icon = "skills/status_effect_54.png";
		this.m.IconMini = "status_effect_54_mini";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/giant_spider_poison_01.wav",
			"sounds/enemies/dlc2/giant_spider_poison_02.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DamageOverTime;
		this.m.IsActive = false;
		this.m.IsStacking = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDamage()
	{
		return this.m.Damage;
	}

	function getTurns()
	{
		return this.m.TurnsLeft;
	}

	function getDescription()
	{
		return "This character has a vicious poison running through his veins and will lose [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Damage + "[/color] hitpoints each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function getAttacker()
	{
		if (this.m.Actor == null)
		{
			return this.getContainer().getActor();
		}

		if (this.m.Actor != this.getContainer().getActor())
		{
			if (!this.m.Actor.isAlive())
			{
				return this.getContainer().getActor();
			}

			if (!this.m.Actor.isPlacedOnMap())
			{
				return this.getContainer().getActor();
			}

			if (this.m.Actor.getFlags().get("Devoured") == true)
			{
				return this.getContainer().getActor();
			}
		}

		return this.m.Actor;
	}

	function applyDamage()
	{
		this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
		}

		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = this.m.Damage;
		hitInfo.DamageDirect = 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.FatalityChanceMult = 0.0;
		this.getContainer().getActor().onDamageReceived(this.getAttacker(), this, hitInfo);
	}

	function resetTime( _t )
	{
		this.m.TurnsLeft = _t;
	}

	function setDamage( _d )
	{
		this.m.Damage = _d;
	}

	function setActor( _d )
	{
		this.m.Actor = _d;
	}

	function onAdded()
	{
		if (this.getContainer().hasSkill("trait.ailing"))
		{
			++this.m.TurnsLeft;
		}
	}

	function onTurnEnd()
	{
		this.applyDamage();

		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function onWaitTurn()
	{
		this.applyDamage();
	}

});