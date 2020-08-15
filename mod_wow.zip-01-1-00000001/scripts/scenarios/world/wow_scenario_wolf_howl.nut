/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
this.wow_scenario_wolf_howl <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.wolf_howl";
		this.m.Name = "Wolf Howl";
		this.m.Description = "[p=c][img]gfx/ui/events/event_wow_wolf_howl.png[/img][/p][p]Your band consists of two hunters who are able to call Winter Wolf during the battle. Use them to destroy enemies!\n\n[color=#bcad8c]Hunter:[/color] Start with a hunter who is gifted in range battle and pet summon.\n[color=#bcad8c]Pet system:[/color] Hunter can summon Winter Wolf. If pet was killed during the battle, hunter will able to summon new one when new battle starts.\n[color=#bcad8c]Pet progress:[/color] Your pet can be strengthened by Hunter Perks.\n[color=#bcad8c]Perk Tree:[/color] Hunter characters use separate perk tree.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 14;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 2; i = ++i )
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
			"raider_hunter_background"
		]);
		bros[0].setTitle("the Beast");
		bros[0].setPlaceInFormation(3);
		bros[0].m.PerkPoints = 0;
		bros[0].m.LevelUps = 0;
		bros[0].m.Level = 1;
		bros[0].m.Talents = [];
		bros[0].m.Attributes = [];
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedDefense] = 2;
		talents[this.Const.Attributes.Bravery] = 2;
		talents[this.Const.Attributes.Fatigue] = 3;

		bros[1].setStartValuesEx([
			"raider_hunter_background"
		]);
		bros[1].setTitle("Archer");
		bros[1].setPlaceInFormation(4);
		bros[1].m.PerkPoints = 0;
		bros[1].m.LevelUps = 0;
		bros[1].m.Level = 1;
		bros[1].m.Talents = [];
		bros[1].m.Attributes = [];
		local talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedDefense] = 2;
		talents[this.Const.Attributes.RangedSkill] = 3;
		talents[this.Const.Attributes.Initiative] = 2;

		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.m.Money = this.World.Assets.m.Money + 400;
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
			this.World.Events.fire("event.wolf_howl_intro_event");
		}, null);
	}

});