/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.05, game_version = 1.4.0.37*/
this.hunter_mendpet_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.mendpet_skill";
		this.m.Name = "Mend Pet";
		this.m.Description = "Heal Winterwolf during the battle.";
		this.m.Icon = "ui/perks/skill_hunter_mendpet.png";
		this.m.IconDisabled = "ui/perks/skill_hunter_mendpet_sw.png";
		this.m.Overlay = "skill_hunter_mendpet";
		this.m.SoundOnUse = [
			"sounds/combat/hunter_mendpet.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 8;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = "Mend Pet"
			},
			{
				id = 2,
				type = "description",
				text = "Heal Winterwolf during the battle."
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Heal the Winterwolf for [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]25[/color] Hitpoints."
			},
		];
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
		local healnumber = this.Math.rand(15, 25);

		this.spawnIcon("effect_hunter_mendpet", targetEntity.getTile());
		if (targetEntity.getHitpoints() == targetEntity.getHitpointsMax())
		{
			return;
		}
		
		if (!targetEntity.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + "was healed for " + this.Math.min(targetEntity.getHitpointsMax() - targetEntity.getHitpoints(), healnumber) + " hitpoints");
		}
		targetEntity.setHitpoints(this.Math.min(targetEntity.getHitpointsMax(), targetEntity.getHitpoints() + healnumber));
		targetEntity.onUpdateInjuryLayer();

		return true;
	}
});