/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.04, game_version = 1.4.0.36*/
this.wow_scenario_holy_power <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.holy_power";
		this.m.Name = "Holy Power";
		this.m.Description = "[p=c][img]gfx/ui/events/event_wow_holy_power.png[/img][/p][p] Soldier who previous was warrior became a strong paladin. Now he is able to turn to the 'Light' and help his brothers on the battlefield, as well as defeat all the allies of 'Darkness'.\n\n[color=#bcad8c]Paladin:[/color] Start with a paladin who is gifted in holy power and auras.\n[color=#bcad8c]Aura system:[/color] Use one of four strong auras.\n[color=#bcad8c]Healer:[/color] Use paladin's Holy power to heal your friend.\n[color=#bcad8c]Perk Tree:[/color] Paladin characters use separate perk tree.[/p]";
		this.m.Difficulty = 1;
		this.m.Order = 13;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 4; i = ++i )
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
			"raider_paladin_background"
		]);
		bros[0].setTitle("Holy");
		bros[0].setPlaceInFormation(13);
		bros[0].m.PerkPoints = 0;
		bros[0].m.LevelUps = 0;
		bros[0].m.Level = 1;
		bros[0].m.Talents = [];
		bros[0].m.Attributes = [];
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedDefense] = 2;
		talents[this.Const.Attributes.Bravery] = 3;
		talents[this.Const.Attributes.Fatigue] = 2;

		bros[1].setStartValuesEx([
			"companion_1h_background"
		]);
		bros[1].getBackground().m.RawDescription = "{You saved %name%\'s life in a battle against brigands, and he returned the favor in an alley ambush by thieves. Given that common criminals are a few levels beneath brigands, you often joke with him that he is still a little behind on the \'saving each other\'s asses\' debt.}";
		bros[1].setPlaceInFormation(3);
		
		bros[2].setStartValuesEx([
			"companion_2h_background"
		]);
		bros[2].getBackground().m.RawDescription = "{Whatever is wrong with %name% you hope he never fixes it. A character with a particular taste for battling, whoring, gambling, singing, dogfighting, skirt chasing, weirdly dish washing, vomiting and, of course, drinking, he has always been a gift to have around. He also just happens to be an excellent fighter in his own right.}";
		bros[2].setPlaceInFormation(4);
		
		bros[3].setStartValuesEx([
			"companion_ranged_background"
		]);
		bros[3].getBackground().m.RawDescription = "You crossed paths with %name% a number of times prior to his joining the company. First time you were both simple laborers. The second time you were sellswords. And now is the third go of it with him joining your company. If all goes well, he\'ll finally stick around this time and you\'ll both find the riches you seek.";
		bros[3].setPlaceInFormation(5);

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
			this.World.Events.fire("event.holy_power_intro_event");
		}, null);
	}

});