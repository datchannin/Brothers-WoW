/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.warlock_demonarmor_skill <- this.inherit("scripts/skills/skill", {
	m = {
		soulshard = false
	},
	function create()
	{
		this.m.ID = "actives.demonarmor_skill";
		this.m.Name = "Demon Armor";
		this.m.Description = "Increases Melee and Ranged Defense. Can use \'Soul Shard\' if warlock has it.";
		this.m.Icon = "ui/perks/skill_warlock_demonarmor.png";
		this.m.IconDisabled = "ui/perks/skill_warlock_demonarmor_sw.png";
		this.m.Overlay = "skill_warlock_demonarmor";
		this.m.SoundOnUse = [
			"sounds/combat/warlock_demonarmor.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 24;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "Melee Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "Ranged Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points."
		});

		if (this.m.soulshard)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/health.png",
				text = "Health Regeneration will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points per turn."
			});

			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Using this skill consumes your \'Soul Shard\'."
			});
		}

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.soulshard = user.getSkills().hasSkill("effects.soulshard");
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}
	
	function onUse( _user, _targetTile )
	{
		local effect = _user.getSkills().getSkillByID("effects.demonarmor");

		if (effect != null)
		{
			effect.reset();
		}
		else
		{
			//this.m.Container.add(this.new("scripts/skills/effects/demonarmor_effect"));
		}

		return true;
	}
});

