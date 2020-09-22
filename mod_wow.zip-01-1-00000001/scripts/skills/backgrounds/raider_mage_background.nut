/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.raider_mage_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_mage";
		this.m.Name = "Mage";
		this.m.Icon = "ui/backgrounds/background_mage.png";
		this.m.BackgroundDescription = "Students gifted with a keen intellect and unwavering discipline may walk the path of the Mage. The arcane magic available to magi is both great and dangerous, and thus is revealed only to the most devoted practitioners. To avoid interference with their spellcasting, magi wear only cloth armor, but arcane shields and enchantments give them additional protection. To keep enemies at bay, magi can summon bursts of fire to incinerate distant targets and cause entire areas to erupt, setting groups of foes ablaze.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 220;
		this.m.DailyCost = 21;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard"
		];
		this.m.Titles = [
			"Study",
			"Wiseman",
			"Fervent",
			"the Mage",
			"Freezing",
			"Spell caster",
			"Wise Mind",
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
		return "{A young student who just recently graduated from the Dalaran Mage Academy. To gain experience, he decided to go on a journey, but was robbed and stuck in this city. %name% will glad join the squad for a small payment of his time and labor. | This magician has already participated in battles. With his destructive fire spells, he burned down his opponents. %name% sent by the council of Dalaran to investigate the appearance of the undead on roads and cemeteries. With his power he will be able to calm them forever. | %name% was one of the few mages to survive the orc invasion and the war of Stormwind. He knows how to fight against green opponents and knows their habits in battle. Such a fighter will be a valuable acquisition for any squad of orc hunters. | The eyes of this man seem to be frozen pieces of ice. %name% is silent and thoughtful. By the movement of his hand, a huge ice ball can appear next to him, which will be broken on the heads of opponents. This skillful ice mage will join the squad for moderate pay.}";
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
				3,
				5
			],
			Initiative = [
				7,
				9
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