/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.wow_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.wow";
		this.m.Name = "WoW debug Company";
		this.m.Description = "[p=c][img]gfx/ui/events/event_wow.png[/img][/p][p]This scenario was created for debug WoW characters, new perks, skills and abilities. Use them and play. If you find any bug - please, inform the github repo.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 800;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 10; i = ++i )
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
		bros[2].getSkills().add(this.new("scripts/skills/traits/bright_trait"));

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

		bros[5].setStartValuesEx([
			"raider_warlock_background"
		]);
		bros[5].setPlaceInFormation(15);
		bros[5].m.PerkPoints = 12;
		bros[5].m.LevelUps = 6;
		bros[5].m.Level = 5;

		bros[5].getSkills().add(this.new("scripts/skills/injury/broken_arm_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/broken_leg_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/broken_nose_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/broken_ribs_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/bruised_leg_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/burnt_face_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/burnt_hands_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/burnt_legs_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/crushed_finger_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/crushed_windpipe_injury"));		
		bros[5].getSkills().add(this.new("scripts/skills/injury/cut_achilles_tendon_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/cut_arm_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/cut_arm_sinew_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/cut_artery_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/cut_leg_muscles_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/cut_throat_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/deep_abdominal_cut_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/deep_chest_cut_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/deep_face_cut_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/dislocated_shoulder_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/exposed_ribs_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/fractured_elbow_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/fractured_hand_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/fractured_ribs_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/fractured_skull_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/grazed_eye_socket_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/grazed_kidney_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/grazed_neck_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/infected_wound_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/inhaled_flames_injury"));		
		bros[5].getSkills().add(this.new("scripts/skills/injury/injured_knee_cap_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/injured_shoulder_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/pierced_arm_muscles_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/pierced_cheek_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/pierced_chest_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/pierced_hand_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/pierced_leg_muscles_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/pierced_lung_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/pierced_side_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/ripped_ear_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/severe_concussion_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/sickness_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/smashed_hand_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/split_hand_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/split_nose_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/split_shoulder_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/sprained_ankle_injury"));
		bros[5].getSkills().add(this.new("scripts/skills/injury/stabbed_guts_injury"));

		bros[6].setStartValuesEx([
			"raider_paladin_background"
		]);
		bros[6].setPlaceInFormation(12);
		bros[6].m.PerkPoints = 12;
		bros[6].m.LevelUps = 6;
		bros[6].m.Level = 5;

		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/brain_damage_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/broken_elbow_joint_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/broken_knee_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/collapsed_lung_part_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/maimed_foot_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/missing_ear_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/missing_eye_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/missing_finger_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/missing_nose_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/traumatized_injury"));
		bros[6].getSkills().add(this.new("scripts/skills/injury_permanent/weakened_heart_injury"));

		local body = bros[6].getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local head = bros[6].getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local shield = bros[6].getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		body.setArmor(1);
		head.setArmor(1);
		//shield.setCondition(1);
		bros[6].setHitpoints(5);

		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/wardog_armor_upgrade_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/wardog_armor_upgrade_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/wardog_armor_upgrade_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/dagger"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/dagger_off"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/rondel_dagger"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/rondel_dagger_off"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/oriental/qatal_dagger"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/qatal_dagger_off"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/hand_axe"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/flail"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/arming_sword"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/shortsword"));

		bros[7].setStartValuesEx([
			"raider_developer_background"
		]);
		bros[7].setPlaceInFormation(1);
		bros[7].m.PerkPoints = 50;
		bros[7].m.LevelUps = 0;
		bros[7].m.Level = 1;

		bros[8].setStartValuesEx([
			"raider_priest_background"
		]);
		bros[8].setPlaceInFormation(2);
		bros[8].m.PerkPoints = 12;
		bros[8].m.LevelUps = 6;
		bros[8].m.Level = 5;

		bros[9].setStartValuesEx([
			"raider_druid_background"
		]);
		bros[9].setPlaceInFormation(16);
		bros[9].m.PerkPoints = 12;
		bros[9].m.LevelUps = 6;
		bros[9].m.Level = 5;
		bros[9].getSkills().add(this.new("scripts/skills/traits/fear_undead_trait"));
		bros[9].getSkills().add(this.new("scripts/skills/traits/fainthearted_trait"));

		for (local i = 0; i < 10; i=++i)
		{
			//bros[i].getSkills().add(this.new("scripts/skills/actives/druid_catform_skill"));
			//bros[i].getSkills().add(this.new("scripts/skills/actives/druid_bearform_skill"));
		}

		for (local i = 0; i < 10; i=++i)
		{
			this.World.Assets.getStash().add(this.new("scripts/items/misc/potion_of_oblivion_item"));
		}

		for (local i = 0; i < 40; i=++i)
		{
			this.World.Assets.getStash().add(this.new("scripts/items/misc/potion_of_exp_item"));
		}

		local item = this.new("scripts/items/tools/player_banner");
		item.setVariant(this.World.Assets.getBannerID());
		this.World.Assets.getStash().add(item);
		
		item = this.new("scripts/items/weapons/noble_sword");
		this.World.Assets.getStash().add(item);

		item = this.new("scripts/items/armor/warlock_t0_armor");
		this.World.Assets.getStash().add(item);

		item = this.new("scripts/items/helmets/warlock_t0_helm");
		this.World.Assets.getStash().add(item);

		item = this.new("scripts/items/armor/mage_t0_armor");
		this.World.Assets.getStash().add(item);

		item = this.new("scripts/items/helmets/mage_t0_helmet");
		this.World.Assets.getStash().add(item);

		item = this.new("scripts/items/armor/priest_t0_armor");
		this.World.Assets.getStash().add(item);

		item = this.new("scripts/items/helmets/priest_t0_helmet");
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

/*		local c = this.new("scripts/contracts/contracts/debug_contract");
		c.start();
		this.World.Contracts.addContract(c);
		this.World.Contracts.setActiveContract(c, true);
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.CivilianTracks, this.Const.Music.CrossFadeTime);
			this.World.Contracts.update(true);
		}, null);*/
	}

});