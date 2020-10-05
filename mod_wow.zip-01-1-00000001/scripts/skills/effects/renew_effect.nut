/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.renew_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.renew";
		this.m.Name = "Renew";
		this.m.Icon = "ui/perks/perk_priest_renew.png";
		this.m.IconMini = "effect_mini_renew";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This effect heals character for [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] Hitpoints for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
				id = 6,
				type = "text",
				icon = "ui/icons/heal.png",
				text = "Received for [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] Hitpoints until effect is applied."
			},
		];
	}

	function resetTime()
	{
		this.m.TurnsLeft = 2;
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

			this.spawnIcon("effect_priest_renew_apply", actor.getTile());

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
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " was healed by Renew for " + this.Math.min(actor.getHitpointsMax() - actor.getHitpoints(), 10) + " Hitpoints");
			}

			this.m.TurnsLeft = this.m.TurnsLeft - 1;
			actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 10));
			actor.onUpdateInjuryLayer();
		}

		if (this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
			return;
		}
	}
});