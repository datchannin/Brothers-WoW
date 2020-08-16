/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.04, game_version = 1.4.0.36*/
this.raider_paladin_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_paladin";
		this.m.Name = "Paladin";
		this.m.Icon = "ui/backgrounds/background_paladin.png";
		this.m.BackgroundDescription = "Upholders of the Holy Light and defenders of the Alliance, the Paladins can be found from the northern forests of the Tirisfal Glades, fighting back the advance of the Forsaken, to the southern reaches of the Blasted Lands, ceaselessly upholding their vigil against demonic forces from beyond the Dark Portal. Wielding their mighty hammers and the strength of the Light, these holy warriors command forces in battle, all the while throwing themselves to where the fighting is the thickest.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 160;
		this.m.DailyCost = 30;
		this.m.Excluded = [
		];
		this.m.Titles = [
			"Holy",
			"Merciful",
			"the Shield",
			"Protector",
			"Inspiring",
			"the Healer",
			"Radiant",
			"Champion"
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
		return "{%name% was trained by the Archbishop of the Church of the Holy Light Alonsus Faol. He learned the basics of life in modesty and the rejection of ambition. Now %name% has become a completely new person and he is ready to defeat every unded for the glory of the Light. Orcs, robbers and undead fall before the onslaught of the holy paladin. | %name% became a paladin with a strong desire to heal the wounded in battle. This brave fighter is ready to sacrifice his own life, but to take the wounded from the battlefield. A bright Light shines in his eyes, and fills with the strength of his movement. %name% is not afraid to get his hands dirty not only with healing, but also with the battle against evil. | %name% is one of the first people who became a paladin. After the destruction of Stormwind, he as an ordinary warrior defended refugees during loading onto ships. In Lordaeron he was trained and the power of Light was added to the power of his sword. Each  strike of paladin now burns with the fury of enemies. | When the undead began to appear in the village of %name%, the headman sent his best soldier to study the cause of Light. A few months later, %name% returned, and undead units began to part with him in battle. The burning fire of Light helped him to repel another raid, but his family did not survive this day. Now he sits in a tavern and prepares for a new campaign.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-5,
				-7
			],
			Bravery = [
				14,
				16
			],
			Stamina = [
				4,
				5
			],
			MeleeSkill = [
				3,
				5
			],
			RangedSkill = [
				-5,
				-5
			],
			MeleeDefense = [
				5,
				4
			],
			RangedDefense = [
				9,
				10
			],
			Initiative = [
				-7,
				-9
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		if (this.Const.DLC.Unhold)
		{
			r = this.Math.rand(0, 1);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/greatsword"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/two_handed_flanged_mace"));
			}
		}
		else
		{
			r = this.Math.rand(0, 1);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/greataxe"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/greatsword"));
			}
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/mail_hauberk"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/scale_armor"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/armor/worn_mail_shirt"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/mail_coif"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/bascinet_with_mail"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
		}
	}

});