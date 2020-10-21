/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.wow_scenario2 <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.wow2";
		this.m.Name = "WoW debug Company 2";
		this.m.Description = "[p=c][img]gfx/ui/events/event_wow.png[/img][/p][p]This scenario was created for debug WoW characters, new perks, skills and abilities. Use them and play. If you find any bug - please, inform the github repo.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 801;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 16; i = ++i )
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

		bros[1].setStartValuesEx([
			"raider_rogue_background"
		]);
		bros[1].setPlaceInFormation(4);

		bros[2].setStartValuesEx([
			"raider_mage_background"
		]);
		bros[2].setPlaceInFormation(5);

		bros[3].setStartValuesEx([
			"raider_hunter_background"
		]);
		bros[3].setPlaceInFormation(6);

		bros[4].setStartValuesEx([
			"raider_paladin_background"
		]);
		bros[4].setPlaceInFormation(7);

		bros[5].setStartValuesEx([
			"raider_warlock_background"
		]);
		bros[5].setPlaceInFormation(8);

		bros[6].setStartValuesEx([
			"raider_druid_background"
		]);
		bros[6].setPlaceInFormation(9);

		bros[7].setStartValuesEx([
			"raider_priest_background"
		]);
		bros[7].setPlaceInFormation(10);

		bros[8].setStartValuesEx([
			"raider_priest_background"
		]);
		bros[8].setPlaceInFormation(11);

		bros[9].setStartValuesEx([
			"raider_druid_background"
		]);
		bros[9].setPlaceInFormation(12);

		bros[10].setStartValuesEx([
			"raider_warlock_background"
		]);
		bros[10].setPlaceInFormation(13);
		
		bros[11].setStartValuesEx([
			"raider_paladin_background"
		]);
		bros[11].setPlaceInFormation(14);
		
		bros[12].setStartValuesEx([
			"raider_hunter_background"
		]);
		bros[12].setPlaceInFormation(15);

		bros[13].setStartValuesEx([
			"raider_mage_background"
		]);
		bros[13].setPlaceInFormation(16);

		bros[14].setStartValuesEx([
			"raider_rogue_background"
		]);
		bros[14].setPlaceInFormation(17);

		bros[15].setStartValuesEx([
			"raider_warrior_background"
		]);
		bros[15].setPlaceInFormation(18);

		for (local i = 0; i < 16; i = ++i)
		{
			bros[i].m.Level = 1;
			bros[i].m.PerkPoints = 0;
			bros[i].m.LevelUps = 0;
		}

		this.World.Assets.m.Money = this.World.Assets.m.Money + 10000;
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
	}

	function onInit()
	{
		this.World.Assets.m.BrothersMax = 27;
		this.World.Assets.m.BrothersMaxInCombat = 16;
		this.World.Assets.m.BrothersScaleMax = 27;
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