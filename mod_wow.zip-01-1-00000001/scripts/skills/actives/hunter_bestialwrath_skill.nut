/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.hunter_bestialwrath_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.bestialwrath_skill";
		this.m.Name = "Bestial Wrath";
		this.m.Description = "Infuriate Winterwolf for this turn!";
		this.m.Icon = "ui/perks/skill_hunter_bestialwrath.png";
		this.m.IconDisabled = "ui/perks/skill_hunter_bestialwrath_sw.png";
		this.m.Overlay = "skill_hunter_bestialwrath";
		this.m.SoundOnUse = [
			"sounds/combat/hunter_bestialwrath.ogg"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 8;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/feral.png",
			text = "Infuriate pet for this turn. Winterwolf damage will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]40%[/color]"
		});

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a maximum range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color] tiles"
		});

		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local targetEntity = _targetTile.getEntity();

		if (targetEntity.getHitpoints() <= 0)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(targetEntity))
		{
			return false;
		}

		if (!targetEntity.isAlive())
		{
			return false;
		}

		if (!targetEntity.getSkills().hasSkill("effects.winterwolfgetheal"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();

		if (!targetEntity.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " gets furious!");
		}

		local bestialwrath = this.new("scripts/skills/effects/bestialwrath_effect");
		targetEntity.getSkills().add(bestialwrath);

		return true;
	}
});