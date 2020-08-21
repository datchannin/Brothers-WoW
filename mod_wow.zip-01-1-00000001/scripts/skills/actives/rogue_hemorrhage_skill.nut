/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.rogue_hemorrhage_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.hemorrhage_skill";
		this.m.Name = "Hemorrhage";
		this.m.Description = " Debuff target for this turn and increase his damage taken by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color].";
		this.m.Icon = "ui/perks/skill_rogue_hemorrhage.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_hemorrhage_sw.png";
		this.m.Overlay = "skill_rogue_hemorrhage";
		this.m.SoundOnUse = [
			"sounds/combat/rogue_hemorrhage1.wav",
			"sounds/combat/rogue_hemorrhage2.wav",
			"sounds/combat/rogue_hemorrhage3.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
		];
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
	
		targetEntity.getSkills().add(this.new("scripts/skills/effects/hemorrhage_effect"));
		return true;
	}
});