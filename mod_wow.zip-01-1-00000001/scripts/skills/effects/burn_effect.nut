this.burn_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		Damage = 6
	},	
	function getDamage()
	{
		return this.m.Damage;
	}

	function setDamage( _d )
	{
		this.m.Damage = _d;
	}
	
	function create()
	{
		this.m.ID = "effects.burn";
		this.m.Name = "Burned";
		this.m.KilledString = "Fired!";
		this.m.Icon = "skills/status_effect_54.png";
		this.m.IconMini = "status_effect_54_mini";
		this.m.SoundOnUse = [
			//"sounds/enemies/dlc2/giant_spider_poison_01.wav",
			//"sounds/enemies/dlc2/giant_spider_poison_02.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DamageOverTime;
		this.m.IsActive = false;
		this.m.IsStacking = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is under burn effect and will be damaged by [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Damage + "[/color] values each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
		hitInfo.DamageArmor = this.m.Damage;
		hitInfo.DamageDirect = 0.0;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.FatalityChanceMult = 0.0;
		this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
		
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function resetTime()
	{
		this.m.TurnsLeft = 2;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 2;
		
		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.2, actor.getPos());
		}
	}

	function onTurnEnd()
	{
		this.applyDamage();
	}

	function onWaitTurn()
	{
		this.applyDamage();
	}

});