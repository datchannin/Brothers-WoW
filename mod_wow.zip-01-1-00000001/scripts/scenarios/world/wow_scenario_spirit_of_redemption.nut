/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.wow_scenario_spirit_of_redemption <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.spirit_of_redemption";
		this.m.Name = "Spirit of Redemption";
		this.m.Description = "[p=c][img]gfx/ui/events/event_wow_spirit_of_redemption.png[/img][/p][p]Your band consists is two survive characters, who are stayed alive after bloody battle. Try to redempt of your defeat and restore your band!\n\n[color=#bcad8c]Priest:[/color] Start with a priest who is gifted in Holy Art.\n[color=#bcad8c]Healing Mastery:[/color] Priests are able to heal allies with a great mastery. Some of them even able to remove different injuries.\n[color=#bcad8c]Repair Mastery:[/color] Your priest can be leveled as Repair Master and then he will be able to repair Body and Head armor.\n[color=#bcad8c]Perk Tree:[/color] Priest characters use separate perk tree.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 462;
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
			bro.worsenMood(1.0, "Lost all allies in battle.");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			if (this.Math.rand(1, 100) <= 50)
			{
				bro.addLightInjury();
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"raider_warrior_background"
		]);
		bros[0].setTitle("Survivor");
		bros[0].setPlaceInFormation(3);
		bros[0].m.PerkPoints = 0;
		bros[0].m.LevelUps = 0;
		bros[0].m.Level = 1;
		bros[0].m.Talents = [];
		bros[0].m.Attributes = [];
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeDefense] = 2;
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.Fatigue] = 2;

		bros[1].setStartValuesEx([
			"raider_priest_background"
		]);
		bros[1].setTitle("Survivor");
		bros[1].setPlaceInFormation(4);
		bros[1].m.PerkPoints = 0;
		bros[1].m.LevelUps = 0;
		bros[1].m.Level = 1;
		bros[1].m.Talents = [];
		bros[1].m.Attributes = [];
		local talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 3;
		talents[this.Const.Attributes.Hitpoints] = 3;
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
			this.World.Events.fire("event.spirit_of_redemption_intro_event");
		}, null);
	}

});