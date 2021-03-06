/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.demonarmor_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		BaseDuration = 2,
		power = false,
	},
	function create()
	{
		this.m.ID = "effects.demonarmor";
		this.m.Name = "Demon Armor";
		this.m.Icon = "ui/perks/perk_warlock_demonarmor.png";
		this.m.IconMini = "effect_mini_demonarmor";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Dark Armor surrounds you for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function setDuration( _d )
	{
		this.m.BaseDuration = _d;
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
			id = 10,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "Melee Defense was increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points."
		});

		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "Ranged Defense was increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points."
		});
		
		if (this.m.power)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/health.png",
				text = "Health Regeneration was increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points per turn."
			});
		}
		
		return ret;
	}

	function onAdded()
	{
		local user = this.getContainer().getActor();
		this.m.power = user.getSkills().hasSkill("effects.soulshard");
		this.m.TurnsLeft = this.m.BaseDuration;

		if (this.m.power)
		{
			this.m.Container.removeByID("effects.soulshard");
		}
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 5;
		_properties.RangedDefense += 5;
	}

	function onTurnEnd()
	{
		local actor = this.m.Container.getActor();

		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
		
		if (this.m.power)
		{
			if (actor.getHitpoints() < actor.getHitpointsMax())
			{
				this.spawnIcon("effect_warlock_demonarmor", actor.getTile());
				actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 5));

				actor.onUpdateInjuryLayer();
				actor.getSkills().update();
				actor.setDirty(true);
			}
		}
	}
});