this.hunter_huntersmark_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.huntersmark_skill";
		this.m.Name = "Hunter\'s Mark";
		this.m.Description = "Mark the target for several turns and increase his damage taken by [color=" + this.Const.UI.Color.NegativeValue + "]5%[/color].";
		this.m.Icon = "ui/perks/skill_hunter_huntersmark.png";
		this.m.IconDisabled = "ui/perks/skill_hunter_huntersmark_sw.png";
		this.m.Overlay = "skill_hunter_huntersmark";
		this.m.SoundOnUse = [
			"sounds/combat/hunter_huntersmark.wav"
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
		local mark = targetEntity.getSkills().getSkillByID("effects.huntersmark");
	
		if (mark == null)
		{
			targetEntity.getSkills().add(this.new("scripts/skills/effects/huntersmark_effect"));
		}
		else
		{
			mark.resetTime();
		}

		return true;
	}
});