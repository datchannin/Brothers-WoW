/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.raider_priest_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_priest";
		this.m.Name = "Priest";
		this.m.Icon = "ui/backgrounds/background_priest.png";
		this.m.BackgroundDescription = "Priests lead the many faiths spread throughout the disparate lands of the world of Azeroth. In Kalimdor, Night Elf Priestesses revere the moon goddess Elune, while Dwarven priests in Khaz Modan deliver the message of the Light to their people. In the ruins of Lordaeron, the undead priests of the Forsaken, their faith twisted and tainted by their tortured existences, spread a dark interpretation of the Holy Light. Regardless of their faith, however, all Priests share in their ability to manipulate the minds of those who turn to them for spiritual guidance.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 280;
		this.m.DailyCost = 15;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.brute",
			"trait.dastard",
			"trait.drunkard",
			"trait.dumb",
			"trait.gluttonous",
			"trait.hesitant",
			"trait.huge",
			"trait.insecure",
			"trait.paranoid",
			"trait.superstitious",
			"trait.athletic",
			"trait.strong"
		];
		this.m.Titles = [
			"Study",
			"Wiseman",
			"Noble",
			"the Priest",
			"The Flair",
			"Divine",
			"Recovery Master",
			"Healer"
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
		return "{Ardent admirer of the Light %name% possesses great power of faith. Once %name% met a whole horde of undead. Immersed in the prayer and meditation, he managed to drive the undead away from himself. Since then, %name% has relied solely on the power of the Light for everything. And not in vain! | %name% has been trained in the path of the Light since childhood. After a few years of continuous training, he became a master at casting healing spells. Such a healer will not let any companion to die. He will be able to replenish health and even heal you from the most severe injuries. | Fire sparkles in his eyes. But this is the flame of faith. Ardent fanatic of the path of the Light %name% has no doubts about his decisions. Once he was an inquisitor, with his instinct %name% found witches, and sent many to the stake. Now he has retired, but he will gladly help you in getting rid of numerous enemies. | %name% survived the orc attacks on Stormwind. And after the defeat in the war, he went across the sea with the refugees. On the way, he supported and consoled the unfortunate. Upon arrival, he was offered to join the order of Paladins, but %name% refused. He no longer wants to participate in wars, but offer him a handful of coins, and the old healer will go even to the ends of the world. | This old man outlived his children and grandchildren. He is already ready to die, but Death only bypasses him. For a small fee, the priest will join your squad and will help you in battle to the best of his ability. However, do not expect too much from him, he knows nothing but the path of Light.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-10,
				-17
			],
			Bravery = [
				5,
				7
			],
			Stamina = [
				10,
				14
			],
			MeleeSkill = [
				-8,
				-14
			],
			RangedSkill = [
				-8,
				-14
			],
			MeleeDefense = [
				-4,
				-4
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				10,
				12
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

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
		items.equip(this.new("scripts/items/helmets/hunters_hat"));
	}

});