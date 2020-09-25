/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.raider_warlock_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_warlock";
		this.m.Name = "Warlock";
		this.m.Icon = "ui/backgrounds/background_warlock.png";
		this.m.BackgroundDescription = "Warlocks were mages that delved too deeply into the roots of demonic power. Consumed by a lust for dark knowledge, they've tapped into chaotic magics from beyond the world. The Burning Legion now feeds them their powers, allowing them to channel destructive energies and call upon the powerful emissaries of their demon masters.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 200;
		this.m.DailyCost = 19;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard"
		];
		this.m.Titles = [
			"Reaper",
			"Damned",
			"Soul Drinker",
			"the Warlock",
			"the Shadow",
			"Bloody",
			"the Darkest",
			"Caster"
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
		return "{%name% immersed himself in the dark arts deeper than mages allowed. He was expelled from the ranks of the magicians many years ago, and now uses only demonic powers. Take him to your squad and enemies will not withstand the onslaught of dark spells. | This warlock has learned the ability to drain the vitality of enemies. During a tough battle, he can destroy the enemy and gain control of his soul even after death. Nobody wants such an afterlife. | %name% has become a Curse Master. He has a special skill in the Curse of Agony. After falling under this curse, the victim slowly dies, while %name% absorbs life force. Now, for a modest fee, the warlock is ready to join the squad in order to continue to bear death and torment. | In the hands of this dark magician are the skulls of the enemies he has killed. Each skull is a prison for one soul. In case of emergency, %name% can drain the powers of such a soul and impose a Curse of Doom on the enemy. No one has yet been able to survive the damage from such a curse.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				17
			],
			Bravery = [
				-5,
				-7
			],
			Stamina = [
				8,
				12
			],
			MeleeSkill = [
				-5,
				-8
			],
			RangedSkill = [
				-5,
				-8
			],
			MeleeDefense = [
				-2,
				-2
			],
			RangedDefense = [
				1,
				2
			],
			Initiative = [
				3,
				5
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