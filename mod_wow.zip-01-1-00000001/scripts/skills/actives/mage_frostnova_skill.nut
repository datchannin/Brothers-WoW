this.mage_frostnova_skill <- this.inherit("scripts/skills/skill", {
	m = {
		winterschill = false
	},
	function create()
	{
		this.m.ID = "actives.frostnova_skill";
		this.m.Name = "Frost Nova";
		this.m.Description = "Quickly freeze a big group of enemy.";
		this.m.Icon = "ui/perks/skill_mage_frostnova.png";
		this.m.IconDisabled = "ui/perks/skill_mage_frostnova_sw.png";
		this.m.Overlay = "skill_mage_frostnova";
		this.m.SoundOnUse = [
			//"sounds/combat/frostnova_01.wav"
		];
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = true;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 3;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Freeze group of [color=" + this.Const.UI.Color.DamageValue + "]7[/color] characters  for 2 rounds."
		});

		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/action_points.png",
			text = "Freeze effect: [color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Action Points."
		});

		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Freeze effect: [color=" + this.Const.UI.Color.NegativeValue + "]-35%[/color] Max Fatigue."
		});

		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "Freeze effect: [color=" + this.Const.UI.Color.NegativeValue + "]-35%[/color] Initiative."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color] tiles."
		});

		if (!this.m.winterschill)
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]You should learn how to use \'Winter\'s Chill\' if you want to use this skill.[/color]"
			});
		}

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.winterschill = user.getSkills().hasSkill("perk.wow.mage.winterschill");
	}

	function isUsable()
	{
		if (!this.Tactical.isActive())
		{
			return true;
		}

		if (this.skill.isUsable())
		{
			if (this.m.winterschill)
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
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (_originTile.Level + 1 < _targetTile.Level)
		{
			return false;
		}

		return true;
	}

	function onTargetSelected( _targetTile )
	{
		local affectedTiles = [];
		affectedTiles.push(_targetTile);

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = _targetTile.getNextTile(i);
				affectedTiles.push(tile);
			}
		}

		foreach( t in affectedTiles )
		{
			this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, t, t.Pos.X, t.Pos.Y);
		}
	}

	function onUse( _user, _targetTile )
	{

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = _targetTile.getNextTile(i);

				if (!tile.IsEmpty && tile.getEntity().isAttackable())
				{
					local targetEntity = tile.getEntity();
					local effect = targetEntity.getSkills().getSkillByID("effects.freeze");
					
					if (effect != null)
					{
						effect.resetTime();
					}
					else
					{
						targetEntity.getSkills().add(this.new("scripts/skills/effects/freeze_effect"));
					}
					this.spawnIcon("effect_mage_freeze_apply", tile);

					if (!_user.isAlive() || _user.isDying())
					{
						break;
					}
				}
			}
		}

		if (!_targetTile.IsEmpty && _targetTile.getEntity().isAttackable())
		{
			local targetEntity = _targetTile.getEntity();
			local effect = targetEntity.getSkills().getSkillByID("effects.freeze");
			
			if (effect != null)
			{
				effect.resetTime();
			}
			else
			{
				targetEntity.getSkills().add(this.new("scripts/skills/effects/freeze_effect"));
			}
			this.spawnIcon("effect_mage_freeze_apply", _targetTile);
		}

		return true;
	}

});

