/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_blood_thirst <- this.inherit("scripts/skills/skill", {
	m = {
		DrainValue = 10,
		T0_warrior_head = false
	},
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

	function getDrainValue()
	{
		local total_drain_value = this.m.DrainValue;

		if (this.m.T0_warrior_head)
		{
			total_drain_value += 5;
		}

		return total_drain_value;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local total_drain_value = getDrainValue();

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

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + this.Math.min(actor.getHitpointsMax() - actor.getHitpoints(), total_drain_value) + " points");
		}

		actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + total_drain_value));
		actor.onUpdateInjuryLayer();
	}
	
	function onUpdate( _properties )
	{
		this.m.T0_warrior_head = _properties.T0_warrior_head;
	}
});