/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.rejuvenation_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		HealValue = 7
	},
	function create()
	{
		this.m.ID = "effects.rejuvenation";
		this.m.Name = "Rejuvenation";
		this.m.Description = "You will be healed during two turns.";
		this.m.Icon = "ui/perks/effect_druid_rejuvenation.png";
		this.m.IconMini = "effect_mini_rejuvenation";
		this.m.SoundOnUse = [
			"sounds/combat/druid_rejuvenation.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This effect heals character for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.HealValue + "[/color] Hitpoints for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
			
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/heal.png",
			text = "Received for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.HealValue + "[/color] Hitpoints until effect is applied."
		});

		return ret;
	}

	function reset()
	{
		this.m.TurnsLeft = 2;
	}

	function setpower(healpower)
	{
		this.m.HealValue = healpower;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 2;
	}

	function onTurnEnd()
	{
		if (this.m.TurnsLeft)
		{
			local actor = this.getContainer().getActor();

			this.spawnIcon("effect_druid_rejuvenation", actor.getTile());

			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
			}

			if (actor.getHitpoints() == actor.getHitpointsMax())
			{
				this.m.TurnsLeft = this.m.TurnsLeft - 1;
				if (this.m.TurnsLeft <= 0)
				{
					this.removeSelf();
					return;
				}
				return;
			}

			if (!actor.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " was healed by Rejuvenation for " + this.Math.min(actor.getHitpointsMax() - actor.getHitpoints(), this.m.HealValue) + " points");
			}

			this.m.TurnsLeft = this.m.TurnsLeft - 1;
			actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + this.m.HealValue));
			actor.onUpdateInjuryLayer();
		}

		if (this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
			return;
		}
	}
});