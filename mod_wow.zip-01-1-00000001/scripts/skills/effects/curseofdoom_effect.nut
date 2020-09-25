/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.curseofdoom_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 4,
		Damage = 50
	},	

	function create()
	{
		this.m.ID = "effects.curseofdoom";
		this.m.Name = "Curse of Doom";
		this.m.KilledString = "Died from curse.";
		this.m.Icon = "ui/perks/perk_warlock_curseofdoom.png";
		this.m.IconMini = "effect_mini_curseofdoom";
		this.m.SoundOnUse = [
			"sounds/combat/warlock_curseofagony.wav",
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

	function getDescription()
	{
		return "This character was cursed and will take [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Damage + "[/color] damage after [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s) end. Also he is retard while under this curse.";
	}

	function applyDamage()
	{
		this.spawnIcon("effect_warlock_curseofdoom", this.getContainer().getActor().getTile());

		local Damage = this.m.Damage;

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
		}

		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = Damage;
		hitInfo.DamageDirect = 0.0;
		hitInfo.DamageArmor = hitInfo.DamageRegular * 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.FatalityChanceMult = 0.0;
		this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
	}

	function onUpdate( _properties )
	{
		_properties.InitiativeMult *= 0.33;
		_properties.ActionPoints -= 4;
	}

	function resetTime( _t )
	{
		this.m.TurnsLeft = _t;
	}

	function setDamage( _d )
	{
		this.m.Damage = _d;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.applyDamage();
			this.removeSelf();
		}
	}
});