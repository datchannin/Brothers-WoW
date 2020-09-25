/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.druid_swipe_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_min = 30,
		damage_max = 35,
		damage_armor_mult = 0.4,
		BleedingSounds = [
			"sounds/combat/rupture_blood_01.wav",
			"sounds/combat/rupture_blood_02.wav",
			"sounds/combat/rupture_blood_03.wav"
		]
	},
	function create()
	{
		this.m.ID = "actives.swipe_skill";
		this.m.Name = "Swipe";
		this.m.Description = "Swipe with your claws that hips three tiles in counter-clockwise order. Be careful around your own men unless you want to relieve your payroll!";
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
		this.m.DirectDamageMult = 0.25;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 30;
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
		local p = this.getContainer().getActor().getCurrentProperties();
		local damage_armor_min = this.Math.floor(this.m.damage_min * this.m.damage_armor_mult * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_armor_max = this.Math.floor(this.m.damage_max * this.m.damage_armor_mult * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_min = this.Math.floor(this.m.damage_min * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_max = this.Math.floor(this.m.damage_max * p.DamageTotalMult * p.MeleeDamageMult);
		local direct_damage_max = this.Math.floor(this.m.DirectDamageMult * damage_max);

		local ret = this.getDefaultUtilityTooltip();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_max + "[/color] damage to hitpoints, of which [color=" + this.Const.UI.Color.DamageValue + "]" + 0 + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + direct_damage_max + "[/color] can ignore armor"
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_max + "[/color] damage to armor"
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


	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageRegularMin = this.m.damage_min;
			_properties.DamageRegularMax = this.m.damage_max;
			_properties.DamageArmorMult *= this.m.damage_armor_mult;
		}
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSwing);
		local ret = false;
		local ownTile = _user.getTile();
		local dir = ownTile.getDirectionTo(_targetTile);
		ret = this.attackEntity(_user, _targetTile.getEntity());

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
				ret = this.attackEntity(_user, nextTile.getEntity()) || ret;
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
				ret = this.attackEntity(_user, nextTile.getEntity()) || ret;
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

