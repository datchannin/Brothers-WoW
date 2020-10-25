/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.gnoll_camp_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "A bunch of pathetic hovels that could belong to various gnolls tribe.";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.gnoll_camp";
		this.m.LocationType = this.Const.World.LocationType.Lair;
		this.m.CombatLocation.Template[0] = "tactical.barbarian_camp";
		this.m.CombatLocation.Fortification = this.Const.Tactical.FortificationType.None;
		this.m.CombatLocation.CutDownTrees = true;
		this.m.IsDespawningDefenders = false;
		//this.setDefenderSpawnList(this.Const.World.Spawn.Gnolls);
		this.m.Resources = 180;
	}

	function onSpawned()
	{
		this.m.Name = this.World.EntityManager.getUniqueLocationName(this.Const.World.WarcraftLocationNames.GnollCamp);
		this.location.onSpawned();

		local gnoll_melee = 4;
		local gnoll_range = 3;
		local r = 0;

		//SPAWN BRUTES
		r = this.Math.rand(0, gnoll_melee);
		for( local i = 0; i < r; i = ++i )
		{
			this.Const.World.Common.addTroop(this, {
				Type = this.Const.World.Spawn.Troops.GnollBrute
			}, false);
		}
		gnoll_melee = gnoll_melee - r;

		//SPAWN ASSASSINS
		for( local i = 0; i < gnoll_melee; i = ++i )
		{
			this.Const.World.Common.addTroop(this, {
				Type = this.Const.World.Spawn.Troops.GnollAssassin
			}, false);
		}

		//SPAWN MYSTICS
		r = this.Math.rand(0, gnoll_range);
		for( local i = 0; i < r; i = ++i )
		{
			this.Const.World.Common.addTroop(this, {
				Type = this.Const.World.Spawn.Troops.GnollMystic
			}, false);
		}
		gnoll_range = gnoll_range - r;

		//SPAWN POACHERS
		for( local i = 0; i < gnoll_range; i = ++i )
		{
			this.Const.World.Common.addTroop(this, {
				Type = this.Const.World.Spawn.Troops.GnollPoacher
			}, false);
		}
	}

	function onDropLootForPlayer( _lootTable )
	{
		this.location.onDropLootForPlayer(_lootTable);
		this.dropMoney(this.Math.rand(1200, 1500), _lootTable);
		this.dropArmorParts(this.Math.rand(15, 30), _lootTable);
		this.dropAmmo(this.Math.rand(0, 30), _lootTable);
		this.dropMedicine(this.Math.rand(0, 5), _lootTable);
		_lootTable.push(this.new("scripts/items/misc/token_chest_item"));
		_lootTable.push(this.new("scripts/items/misc/token_helmet_item"));
	}

	function onInit()
	{
		this.location.onInit();
		local body = this.addSprite("body");
		body.setBrush("world_gnoll_01");
	}

});

