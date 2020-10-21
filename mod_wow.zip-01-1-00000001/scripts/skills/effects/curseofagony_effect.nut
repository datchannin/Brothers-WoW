/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.curseofagony_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		Damage_min = 14,
		Damage_max = 18
	},	

	function create()
	{
		this.m.ID = "effects.curseofagony";
		this.m.Name = "Curse of Agony";
		this.m.KilledString = "Died from curse.";
		this.m.Icon = "ui/perks/perk_warlock_curseofagony.png";
		this.m.IconMini = "effect_mini_curseofagony";
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
		local Damage = this.Math.rand(this.m.Damage_min, this.m.Damage_max);
		return Damage;
	}

	function getDescription()
	{
		return "This character was cursed and will take [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Damage_min + "[/color] - [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Damage_max + "[/color] damage each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function applyDamage()
	{
		this.spawnIcon("effect_warlock_curseofagony", this.getContainer().getActor().getTile());

		local Damage = this.Math.rand(this.m.Damage_min, this.m.Damage_max);

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

	function resetTime( _t )
	{
		this.m.TurnsLeft = _t;
	}

	function setDamage( _d1, _d2 )
	{
		this.m.Damage_min = _d1;
		this.m.Damage_max = _d2;
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