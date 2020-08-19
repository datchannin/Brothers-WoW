/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.06, game_version = 1.4.0.38*/
this.perk_wow_blood_thirst <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.blood_thirst";
		this.m.Name = this.Const.Wow_strings.PerkName.BloodThirst;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BloodThirst;
		this.m.Icon = "ui/perks/perk_warrior_bloodthirst.png";
		this.m.SoundOnUse = [
			"sounds/combat/warrior_bloodthirst1.wav",
			"sounds/combat/warrior_bloodthirst2.wav",
			"sounds/combat/warrior_bloodthirst3.wav"
		];
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
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

		this.spawnIcon("effect_warrior_bloodthirst", actor.getTile());

		if (!actor.isHiddenToPlayer())
		{
			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect, actor.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + this.Math.min(actor.getHitpointsMax() - actor.getHitpoints(), 10) + " points");
		}

		actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 10));
		actor.onUpdateInjuryLayer();
	}
});