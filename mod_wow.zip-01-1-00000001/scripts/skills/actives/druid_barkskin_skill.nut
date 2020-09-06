/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.druid_barkskin_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.barkskin_skill";
		this.m.Name = "Barkskin";
		this.m.Description = "This ability changes its effect depending on current druid form or state. Apply any of feral forms or moonfury to check the effect.";
		this.m.Icon = "ui/perks/skill_druid_barkskin.png";
		this.m.IconDisabled = "ui/perks/skill_druid_barkskin_sw.png";
		this.m.Overlay = "skill_druid_barkskin";
		this.m.SoundOnUse = [
			"sounds/combat/druid_barkskin.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 12;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		if (this.m.Container.hasSkill("effects.bearform"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Damage taken will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			});
			
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points."
			});
		}

		if (this.m.Container.hasSkill("effects.catform"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			});
		}

		if (this.m.Container.hasSkill("effects.moonfury"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Ranged Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points."
			});
		}

		return ret;
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			if (this.m.Container.hasSkill("effects.bearform") || this.m.Container.hasSkill("effects.catform") || this.m.Container.hasSkill("effects.moonfury"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local effect = _user.getSkills().getSkillByID("effects.barkskin");
	
		if (effect != null)
		{
			effect.reset();
		}
		else
		{
			this.m.Container.add(this.new("scripts/skills/effects/barkskin_effect"));
		}

		return true;
	}

});

