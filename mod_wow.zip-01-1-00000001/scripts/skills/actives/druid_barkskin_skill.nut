/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
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
			//"sounds/combat/"
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
/*
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Damage dealt will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]"
		});
*/
		return ret;
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			return true;
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		if (!this.getContainer().hasSkill("effects.barkskin"))
		{
			//this.m.Container.add(this.new("scripts/skills/effects/barkskin_effect"));
			return true;
		}

		return false;
	}

});

