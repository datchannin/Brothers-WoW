/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
this.wow_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.wow";
		this.m.Name = "WoW debug Company";
		this.m.Description = "[p=c][img]gfx/ui/events/event_wow.png[/img][/p][p]This scenario was created for debug WoW characters, new perks, skills and abilities. Use them and play. If you find any bug - please, inform the github repo.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 100;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 5; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.improveMood(1.5, "Joined a mercenary company");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"raider_warrior_background"
		]);
		bros[0].setPlaceInFormation(3);
		bros[0].m.PerkPoints = 12;
		bros[0].m.LevelUps = 6;
		bros[0].m.Level = 5;
		
		bros[1].setStartValuesEx([
			"raider_rogue_background"
		]);
		bros[1].setPlaceInFormation(4);
		bros[1].m.PerkPoints = 12;
		bros[1].m.LevelUps = 6;
		bros[1].m.Level = 5;

		bros[2].setStartValuesEx([
			"raider_mage_background"
		]);
		bros[2].setPlaceInFormation(5);
		bros[2].m.PerkPoints = 12;
		bros[2].m.LevelUps = 6;
		bros[2].m.Level = 5;

		bros[3].setStartValuesEx([
			"raider_hunter_background"
		]);
		bros[3].setPlaceInFormation(13);
		bros[3].m.PerkPoints = 12;
		bros[3].m.LevelUps = 6;
		bros[3].m.Level = 5;

		bros[4].setStartValuesEx([
			"raider_paladin_background"
		]);
		bros[4].setPlaceInFormation(14);
		bros[4].m.PerkPoints = 12;
		bros[4].m.LevelUps = 6;
		bros[4].m.Level = 5;

		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/wardog_armor_upgrade_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/wardog_armor_upgrade_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/wardog_armor_upgrade_item"));
		for (local i = 0; i < 10; i=++i)
		{
			this.World.Assets.getStash().add(this.new("scripts/items/misc/potion_of_oblivion_item"));
		}
		
		local item = this.new("scripts/items/tools/player_banner");
		item.setVariant(this.World.Assets.getBannerID());
		this.World.Assets.getStash().add(item);
		this.World.Assets.m.Money = this.World.Assets.m.Money + 40000;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3)
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 4), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 4), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.IntroTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.early_access_scenario_intro");
		}, null);
	}

});