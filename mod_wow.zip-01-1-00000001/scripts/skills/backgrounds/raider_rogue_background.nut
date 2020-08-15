/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
this.raider_rogue_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_rogue";
		this.m.Name = "Rogue";
		this.m.Icon = "ui/backgrounds/background_rogue.png";		
		this.m.BackgroundDescription = "For rogues, the only code is the contract, and their honor is purchased in gold. Free from the constraints of a conscience, these mercenaries rely on brutal and efficient tactics. Lethal assassins and masters of stealth, they will approach their marks from behind, piercing a vital organ and vanishing into the shadows before the victim hits the ground.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 150;
		this.m.DailyCost = 25;
		this.m.Excluded = [
			"trait.huge",
			"trait.teamplayer",
			"trait.hate_undead",
			"trait.hate_greenskins",
			"trait.hate_beasts",
			"trait.paranoid",
			"trait.night_blind",
			"trait.clubfooted",
			"trait.dumb",
			"trait.loyal",
			"trait.clumsy",
			"trait.fat",
			"trait.hesitant",
			"trait.insecure",
			"trait.short_sighted",
			"trait.brute",
			"trait.strong",
			"trait.bloodthirsty"
		];
		this.m.Titles = [
			"the Shadow",
			"the Cheetah",
			"the Snake",
			"the Raven",
			"Swift",
			"the Rogue",
			"the Slyboots"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Skinny;
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
		return "{From childhood, %name% learned the skill of poison and dagger. Edwin van Cleef was his teacher. However, during the riot on the streets of Stormwind, %name% did not join the masons guild. When the The Defias Brotherhood escaped from Stormwind, he helped the guard track and catch associates. Now he had to flee the Stormwind, because he is wanted by old friends who want to revenge. | %name% trained for many years and became one of the most ruthless rogues of The Defias Brotherhood. He was in a detachment that robbed merchants on the roads of the Westfall. Once, after a robbery, he was ordered to kill the children of merchants. %name% could not do this task. Cutting the throat of his commander, %name% is now on the run. | %name% was an SI:7 agent. One day he recognized in a conspiracy that threatened death with the King of Stormwind and was able to prevent it. Now he is known to the whole kingdom of people. %name% is old, but he still has deadly skills. He is ready to join the squad of strong guys and help in the fight against the monsters of this world. | Poisons have become the passion of %name%. He created new recipes for poisons in his own home, until the one-time vaporization of new compounds poisoned his family. Having buried his wife and children, %name% vowed that his poisons would only serve the fight against evil. He offers his services to every unit of brave warriors.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				-5,
				-5
			],
			Stamina = [
				5,
				7
			],
			MeleeSkill = [
				4,
				6
			],
			RangedSkill = [
				-7,
				-5
			],
			MeleeDefense = [
				2,
				4
			],
			RangedDefense = [
				2,
				4
			],
			Initiative = [
				12,
				10
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		items.equip(this.new("scripts/items/weapons/dagger"));

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/sackcloth"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}
	}

});

