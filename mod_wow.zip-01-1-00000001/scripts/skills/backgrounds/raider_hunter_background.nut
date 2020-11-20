/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.raider_hunter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_hunter";
		this.m.Name = "Hunter";
		this.m.Icon = "ui/backgrounds/background_hunter.png";
		this.m.BackgroundDescription = "Azeroth is home to a wide variety of beasts. From the new world of Lordaeron to the old world of Kalimdor, all manner of creatures can be found. Some are friendly, some are ferocious and aggressive - yet they all have one thing in common. Each creature shares a special connection with Hunters. Hunters track, tame and slay all manner of animals and beasts found in the wilds. Whether they rely on bows or crossbows, Hunters consider their weapons and pets to be their only true friends.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 200;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.hate_beasts",
			"trait.night_blind",
			"trait.clubfooted",
			"trait.brute",
			"trait.short_sighted",
			"trait.fat",
			"trait.clumsy",
			"trait.gluttonous",
			"trait.asthmatic",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard"
		];
		this.m.Titles = [
			"Amok",
			"the Beast",
			"Breaker",
			"the Hunter",
			"True-Shot",
			"One Shot",
			"Eagle Eye"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(3, 5);
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function onBuildDescription()
	{
		return "{Since childhood %name% loves to communicate with animals. He spent more and more of his time at their company, until one day he went into the woods forever. Now he had the ability to feel the thoughts and mood of his companion. Entering the battle, he knows how to restrain his own rage and control the battle duration. | %name% was trained in bow and crossbow skills. Every shot from his weapon brings death to the enemy. Joining the squad, he will destroy enemies from behind the backs of his companions, trying not to engage in close combat. | %name% received no education. However, as a boy, he learned to communicate with animals. After spending several years, he managed to tame the Snow Wolf, and now this terrible beast can come to the call of his friend in any battle. No adversary can withstand the blows of the fangs of such a creature. | %name% does not like fights, but knows how to send arrows from a bow exactly to the target. Such skills made him a welcome ally in any squad. Covering his comrades in battle, he earned the approval of everyone with whom he had ever dealt. However, he did not tell what happened to his previous friends and why he is alone now. | %name% became a master in training animals. He will be able to train the beast to obey orders and attack the necessary enemies. %name% knows how to teach a pet to dodge strikes and kill with one attack. Now he is looking for allies with whom he could train his beast even more in real battles.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-5,
				-7
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				4,
				5
			],
			MeleeSkill = [
				-5,
				-8
			],
			RangedSkill = [
				22,
				20
			],
			MeleeDefense = [
				-2,
				-2
			],
			RangedDefense = [
				3,
				5
			],
			Initiative = [
				5,
				7
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/weapons/hunting_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/weapons/knife"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else
		{
			items.equip(this.new("scripts/items/helmets/hunters_hat"));
		}
	}

});