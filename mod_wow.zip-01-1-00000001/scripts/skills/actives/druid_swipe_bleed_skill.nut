/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.druid_swipe_bleed_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BleedingSounds = [
			"sounds/combat/rupture_blood_01.wav",
			"sounds/combat/rupture_blood_02.wav",
			"sounds/combat/rupture_blood_03.wav"
		]
	},
	function create()
	{
		this.m.ID = "actives.swipe_bleed_skill";
		this.m.Name = "Swipe";
		this.m.Description = "Swipe with your claws that hits three tiles in counter-clockwise order and apply bleed effect on targets. Be careful around your own men unless you want to relieve your payroll!";
		this.m.Icon = "ui/perks/skill_druid_swipe.png";
		this.m.IconDisabled = "ui/perks/skill_druid_swipe_sw.png";
		this.m.Overlay = "skill_druid_swipe";
		this.m.SoundOnUse = [
			"sounds/combat/druid_swipe.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsAOE = true;
		this.m.IsWeaponSkill = false;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function addResources()
	{
		this.skill.addResources();

		foreach( r in this.m.BleedingSounds )
		{
			this.Tactical.addResource(r);
		}
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "This skill does not inflict any damage, but can apply on target bleed effect."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can hit up to 3 targets"
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
			if (!this.m.Container.hasSkill("effects.catform"))
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
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSwing);
		local target = _targetTile.getEntity();
		local ret = true;
		local ownTile = _user.getTile();
		local dir = ownTile.getDirectionTo(_targetTile);

		if (target.isAlive() && !target.isDying())
		{
			if (!target.getCurrentProperties().IsImmuneToBleeding)
			{
				target.getSkills().add(this.new("scripts/skills/effects/bleeding_effect"));
				this.Sound.play(this.m.BleedingSounds[this.Math.rand(0, this.m.BleedingSounds.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
			}
		}

		if (!_user.isAlive() || _user.isDying())
		{
			return ret;
		}

		local nextDir = dir - 1 >= 0 ? dir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (nextTile.IsOccupiedByActor && nextTile.getEntity().isAttackable() && this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				target = nextTile.getEntity();
				if (target.isAlive() && !target.isDying())
				{
					if (!target.getCurrentProperties().IsImmuneToBleeding)
					{
						target.getSkills().add(this.new("scripts/skills/effects/bleeding_effect"));
						this.Sound.play(this.m.BleedingSounds[this.Math.rand(0, this.m.BleedingSounds.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
					}
				}
			}
		}

		if (!_user.isAlive() || _user.isDying())
		{
			return ret;
		}

		nextDir = nextDir - 1 >= 0 ? nextDir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (nextTile.IsOccupiedByActor && nextTile.getEntity().isAttackable() && this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				target = nextTile.getEntity();
				if (target.isAlive() && !target.isDying())
				{
					if (!target.getCurrentProperties().IsImmuneToBleeding)
					{
						target.getSkills().add(this.new("scripts/skills/effects/bleeding_effect"));
						this.Sound.play(this.m.BleedingSounds[this.Math.rand(0, this.m.BleedingSounds.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
					}
				}
			}
		}

		return ret;
	}

	function onTargetSelected( _targetTile )
	{
		local ownTile = this.m.Container.getActor().getTile();
		local dir = ownTile.getDirectionTo(_targetTile);
		this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, _targetTile, _targetTile.Pos.X, _targetTile.Pos.Y);
		local nextDir = dir - 1 >= 0 ? dir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, nextTile, nextTile.Pos.X, nextTile.Pos.Y);
			}
		}

		nextDir = nextDir - 1 >= 0 ? nextDir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, nextTile, nextTile.Pos.X, nextTile.Pos.Y);
			}
		}
	}
});

