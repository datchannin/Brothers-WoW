/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.druid_demoralizingroar_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.demoralizingroar_skill";
		this.m.Name = "Demoralizing Roar";
		this.m.Description = "The druid roars at all the targets around him, foe and friend alike. This reduces target\'s Melee Skill. Be careful around your own men!";
		this.m.Icon = "ui/perks/skill_druid_demoralizingroar.png";
		this.m.IconDisabled = "ui/perks/skill_druid_demoralizingroar_sw.png";
		this.m.Overlay = "skill_druid_demoralizationroar";
		this.m.SoundOnUse = [
			"sounds/combat/druid_demorazilingroar.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OtherTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsUsingHitchance = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsAOE = true;
		this.m.IsWeaponSkill = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 35;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/damage_received.png",
			text = "Target\'s Melee Skill will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points for [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] turns."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can hit up to 6 targets with 100% probability."
		});

		return ret;
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.bearform"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUse( _user, _targetTile )
	{
		local ownTile = this.m.Container.getActor().getTile();

		for( local i = 5; i >= 0; i = --i )
		{
			if (!ownTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = ownTile.getNextTile(i);

				if (!tile.IsEmpty && tile.getEntity().isAttackable() && this.Math.abs(tile.Level - ownTile.Level) <= 1)
				{
					local targetEntity = tile.getEntity();
					local effect = targetEntity.getSkills().getSkillByID("effects.demoralizingroar");
					
					if (effect != null)
					{
						effect.reset();
					}
					else
					{
						targetEntity.getSkills().add(this.new("scripts/skills/effects/demoralizingroar_effect"));
					}
					this.spawnIcon("effect_druid_demoralizingroar", tile);

					if (!_user.isAlive() || _user.isDying())
					{
						break;
					}
				}
			}
		}

		return true;
	}

	function onTargetSelected( _targetTile )
	{
		local ownTile = this.m.Container.getActor().getTile();

		for( local i = 0; i != 6; i = ++i )
		{
			if (!ownTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = ownTile.getNextTile(i);

				if (this.Math.abs(tile.Level - ownTile.Level) <= 1)
				{
					this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, tile, tile.Pos.X, tile.Pos.Y);
				}
			}
		}
	}
});