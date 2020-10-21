/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warlock_charge_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.warlock_charge_skill";
		this.m.Name = "Charge";
		this.m.Description = "Charge to the new point. Start and finish points should have the same height level. Stun warrior after use it for this turn.";
		this.m.Icon = "ui/perks/skill_warrior_charge.png";
		this.m.IconDisabled = "ui/perks/skill_warrior_charge_sw.png";
		this.m.Overlay = "skill_warrior_charge";
		this.m.SoundOnUse = [
			"sounds/combat/warrior_charge1.wav",
			"sounds/combat/warrior_charge2.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 0;
	}

	function getTooltip()
	{
		local ret = [
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
			}
		];

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a maximum range of [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] tiles"
		});

		if (!this.m.Container.hasSkill("effects.drainsoul"))
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You should drain at least one soul to use this skill!"
			});
		}
		else
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You have drank an enemy soul! Use this skill so fast as you can, until soul is under your control!"
			});
		}

		if (this.getContainer().getActor().getCurrentProperties().IsRooted)
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used while rooted[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.drainsoul"))
			{
				return false;
			}
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (!_targetTile.IsEmpty)
		{
			return false;
		}

		if (this.Math.abs(_targetTile.Level - _originTile.Level) > this.m.MaxLevelDifference)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local tag = {
			Skill = this,
			User = _user,
			OldTile = _user.getTile(),
			TargetTile = _targetTile
		};

		if (tag.OldTile.IsVisibleForPlayer || _targetTile.IsVisibleForPlayer)
		{
			local myPos = _user.getPos();
			local targetPos = _targetTile.Pos;
			local distance = tag.OldTile.getDistanceTo(_targetTile);
			local Dx = (targetPos.X - myPos.X) / distance;
			local Dy = (targetPos.Y - myPos.Y) / distance;

			for( local i = 0; i < distance; i = ++i )
			{
				local x = myPos.X + Dx * i;
				local y = myPos.Y + Dy * i;
				local tile = this.Tactical.worldToTile(this.createVec(x, y));

				if (this.Tactical.isValidTile(tile.X, tile.Y) && this.Const.Tactical.DustParticles.len() != 0)
				{
					for( local i = 0; i < this.Const.Tactical.DustParticles.len(); i = ++i )
					{
						this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[i].Brushes, this.Tactical.getTile(tile), this.Const.Tactical.DustParticles[i].Delay, this.Const.Tactical.DustParticles[i].Quantity * 0.5, this.Const.Tactical.DustParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.DustParticles[i].SpawnRate, this.Const.Tactical.DustParticles[i].Stages);
					}
				}
			}
		}

		this.Tactical.getNavigator().teleport(_user, _targetTile, this.onTeleportDone.bindenv(this), tag, false, 2.5);

		if (this.m.Container.hasSkill("effects.drainsoul"))
		{
			this.m.Container.removeByID("effects.drainsoul");
		}

		return true;
	}

	function onTeleportDone( _entity, _tag )
	{
		local myTile = _entity.getTile();
		if (_tag.OldTile.IsVisibleForPlayer || myTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges");
		}
	}
});

