this.rogue_poison_skill <- this.inherit("scripts/skills/skill", {
	m = {
		PoisonMaster = 0
	},
	function create()
	{
		this.m.ID = "actives.poison_skill";
		this.m.Name = "Poison";
		this.m.Description = "Poison the enemy with deadly toxin.";
		this.m.Icon = "ui/perks/skill_warrior_berserkerrage.png";
		this.m.IconDisabled = "ui/perks/skill_warrior_berserkerrage_sw.png";
		this.m.Overlay = "skill_warrior_berserkerrage";
		this.m.SoundOnUse = [
			//"sounds/combat/warrior_berserkerrage1.wav",
			//"sounds/combat/warrior_berserkerrage2.wav"
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
		if (this.m.PoisonMaster == 0)
		{
			return [
				{
					id = 1,
					type = "title",
					text = "Poison"
				},
				{
					id = 2,
					type = "description",
					text = "Poison the enemy with deadly toxin."
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Damage target for [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] hitpoints, duration is [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] turn."
				},
			];
		}
		else
		{
			return [
				{
					id = 1,
					type = "title",
					text = "Vile Poison"
				},
				{
					id = 2,
					type = "description",
					text = "You know how to increase poison effency. Poison the enemy with deadly vile toxin."
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Damage target for [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] hitpoints, duration is [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] turns."
				},
			];
		}
	}

	function onAfterUpdate( _properties )
	{
		if (_properties.IsMasterInPoison)
		{
			this.m.PoisonMaster = 1;
		}
		else
		{
			this.m.PoisonMaster = 0;
		}
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

		//targetEntity.getSkills().add(this.new("scripts/skills/effects/poison_effect"));
		return true;
	}
});

