/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.06, game_version = 1.4.0.38*/
this.unleash_winterwolf <- this.inherit("scripts/skills/skill", {
	m = {
		Item = null,
		Sounds0 = [
			"sounds/enemies/winterwolf_hurt_00.wav",
			"sounds/enemies/winterwolf_hurt_01.wav",
			"sounds/enemies/winterwolf_hurt_02.wav",
			"sounds/enemies/winterwolf_hurt_03.wav"
		],
		Sounds1 = [
			"sounds/enemies/winterwolf_death_00.wav"
		],
		Sounds2 = [
			"sounds/enemies/wardog_flee_00.wav",
			"sounds/enemies/wardog_flee_01.wav",
			"sounds/enemies/wardog_flee_02.wav",
			"sounds/enemies/wardog_flee_03.wav",
			"sounds/enemies/wardog_flee_04.wav"
		],
		Sounds3 = [
			"sounds/enemies/winterwolf_idle_00.wav"
		],
		Sounds4 = [
			"sounds/enemies/winterwolf_move_00.wav"
		],
		Sounds5 = [
			"sounds/enemies/winterwolf_bite_00.wav",
			"sounds/enemies/winterwolf_bite_01.wav",
			"sounds/enemies/winterwolf_bite_02.wav",
			"sounds/enemies/winterwolf_bite_03.wav",
			"sounds/enemies/winterwolf_bite_04.wav",
			"sounds/enemies/winterwolf_bite_05.wav"
		],
		IsMasterHasEnduranceTraining = 0,
		IsMasterHasThickHide = 0,
		IsMasterHasBestialSwiftness = 0,
		IsMasterHasUnleashFury = 0
	},
	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.unleash_winterwolf";
		this.m.Name = "Unleash Winterwolf";
		this.m.Description = "Unleash your winterwolf and send him fighting against the enemy. Needs a free tile adjacent.";
		this.m.Icon = "ui/perks/skill_hunter_unleashwinterwolf.png";
		this.m.IconDisabled = "ui/perks/skill_hunter_unleashwinterwolf_sw.png";
		this.m.Overlay = "skill_hunter_unleashwinterwolf";
		this.m.SoundOnUse = [
			"sounds/combat/winterwolf_unleash1.wav",
			"sounds/combat/winterwolf_unleash2.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function addResources()
	{
		this.skill.addResources();

		foreach( r in this.m.Sounds0 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds1 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds2 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds3 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds4 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds5 )
		{
			this.Tactical.addResource(r);
		}
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
		return ret;
	}

	function isUsable()
	{
		if (this.m.Item.isUnleashed() || !this.skill.isUsable())
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local actor = this.getContainer().getActor();
		return this.skill.onVerifyTarget(_originTile, _targetTile) && _targetTile.IsEmpty;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = this.m.Item.isUnleashed();

		if (_properties.IsPetEnduranceTraining)
		{
			this.m.IsMasterHasEnduranceTraining = 1;
		}
		else
		{
			this.m.IsMasterHasEnduranceTraining = 0;
		}
		
		if (_properties.IsPetThickHide)
		{
			this.m.IsMasterHasThickHide = 1;
		}
		else
		{
			this.m.IsMasterHasThickHide = 0;
		}
		
		if (_properties.IsPetBestialSwiftness)
		{
			this.m.IsMasterHasBestialSwiftness = 1;
		}
		else
		{
			this.m.IsMasterHasBestialSwiftness = 0;
		}
		
		if (_properties.IsPetUnleashFury)
		{
			this.m.IsMasterHasUnleashFury = 1;
		}
		else
		{
			this.m.IsMasterHasUnleashFury = 0;
		}
	}

	function onUse( _user, _targetTile )
	{
		local entity = this.Tactical.spawnEntity(this.m.Item.getScript(), _targetTile.Coords.X, _targetTile.Coords.Y);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity.setItem(this.m.Item);
		entity.setName(this.m.Item.getName());
		entity.setVariant(this.m.Item.getVariant());
		this.m.Item.setEntity(entity);

		if (!this.World.getTime().IsDaytime)
		{
			entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
		}
		
		if (this.m.IsMasterHasEnduranceTraining)
		{
			entity.getSkills().add(this.new("scripts/skills/effects/endurancetraining_effect"));
		}
		if (this.m.IsMasterHasThickHide)
		{
			entity.getSkills().add(this.new("scripts/skills/effects/thickhide_effect"));
		}
		if (this.m.IsMasterHasBestialSwiftness)
		{
			entity.getSkills().add(this.new("scripts/skills/effects/bestialswiftness_effect"));
		}
		if (this.m.IsMasterHasUnleashFury)
		{
			entity.getSkills().add(this.new("scripts/skills/effects/unleashedfury_effect"));
		}
		entity.getSkills().add(this.new("scripts/skills/effects/winterwolfgetheal_effect"));

		this.m.IsHidden = true;
		return true;
	}

});