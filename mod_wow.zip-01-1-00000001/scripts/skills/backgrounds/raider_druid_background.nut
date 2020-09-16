/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 081, game_version = 1.4.0.41*/
this.raider_druid_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_druid";
		this.m.Name = "Druid";
		this.m.Icon = "ui/backgrounds/background_druid.png";
		this.m.BackgroundDescription = "Druids are the keepers of the world. Locked in slumber for generations, they awoke to meet the threat of the Burning Legion during its recent invasion. After Archimonde's defeat, the Druids chose to remain in the waking world and help to rebuild their shattered lands. The Legion's attack left a terrible scar on the natural order, and the Druids seek to heal it.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 200;
		this.m.DailyCost = 40;
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
			"Feral",
			"the Cat",
			"Tiger",
			"the Bear",
			"Furious",
			"Wild",
			"Agile"
		];
		this.m.Faces = this.Const.Faces.ElfMale;
		this.m.Hairs = this.Const.Hair.ElfMale;
		this.m.HairColors = this.Const.HairColors.Elf;
		this.m.Beards = null;
		this.m.Bodies = this.Const.Bodies.ElfMale;
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
		return "{This druid is a Night Elf, who is mysterious ancient race agent. Along with Malfurion Stormrage, %name% slept in the bear form for 10,000 years. He recently woke up and decided to join the battle against the terror that inhabits this land. %name% has not forgotten his druidic skills, he can make a great ally. The forces of Nature allow him not only to attack enemies, but also to heal allies.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				12
			],
			Bravery = [
				5,
				7
			],
			Stamina = [
				10,
				12
			],
			MeleeSkill = [
				5,
				7
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				5,
				7
			],
			RangedDefense = [
				5,
				7
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
	}

});