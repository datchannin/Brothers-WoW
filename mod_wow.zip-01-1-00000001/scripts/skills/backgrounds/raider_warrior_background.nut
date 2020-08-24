/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.01, game_version = 1.4.0.40*/
this.raider_warrior_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_warrior";
		this.m.Name = "Warrior";
		this.m.Icon = "ui/backgrounds/background_warrior.png";
		this.m.BackgroundDescription = "Warriors combine strength, leadership, and a vast knowledge of arms and armor to wreak havoc in glorious combat. Some protect from the front lines with shields, locking down enemies while allies support the warrior from behind with spell and bow. Others forgo the shield and unleash their rage at the closest threat with a variety of deadly weapons.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 180;
		this.m.DailyCost = 32;
		this.m.Excluded = [
		];
		this.m.Titles = [
			"the Brutal",
			"the Defender",
			"the Ardent",
			"Protector",
			"the Sword",
			"Grindstone",
			"Sharp",
			"the Bloody"
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
		return "{The hero of the First War - %name% was in the soldiers party, who assaulted the Dark Portal. After the Medivh betrayal, he guarded the entrance to Karazhan when Kodgar and Lothar fought against Sargeras. Now he is ready to new battles. | Arrived to Lordaeron after the fall of Stormwind, %name% is ready to fight in the forefront. His credo is Allianse Protecting. | Rage burns in the %name%\'s eyes. Only the death of his enemies can satisfy his bloodthirst. More than killing enemies, he loves to just get drunk with his brothers in the tavern. | The king of Stormwind was killed before his eyes. When the dagger of Garona pierced Llein\'s heart, %name% vowed to take revenge on all the Horde allies. In the meantime, he will gladly to help you in the battle with your enemies. | The hero was taught to be shield and sword master by many mentors. And this skill saved him from death in the battle against the orcs. Now he wants to face the enemy in terrible dungeons.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				11,
				16
			],
			Bravery = [
				9,
				4
			],
			Stamina = [
				14,
				13
			],
			MeleeSkill = [
				9,
				12
			],
			RangedSkill = [
				-5,
				-5
			],
			MeleeDefense = [
				6,
				6
			],
			RangedDefense = [
				-5,
				-5
			],
			Initiative = [
				-12,
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
			r = this.Math.rand(0, 2);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/greataxe"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/greatsword"));
			}
			else if (r == 2)
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

