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
		this.m.Body = "bust_naked_body_00";
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
		return "{Raised by thieves on a diet of honeymilk and stolen gold, %name% started life off on the wrong foot. | Raised by a drunken father and an ill mother, %name% was parented straight into a life of thievery. | Born as the sixth-child of an already impoverished family, the budding thief %name% first learned the craft by stealing the last bits of dinner. | Growing up in a family servant to a rich noble, the eventual-thief %name% spent many years staring at royal opulence - and stealing from it. | Taken in by a local orphanage, it wasn\'t long for %name% to start taking abuse from the lowly orphans. He fell back on thieving to survive. | Orphaned, %name% grew up as a street urchin, his days governed by cutting purses and picking pockets. | While never particularly in need of money, %name%\'s jealousy over material things led him to thieving. | The profligacy of the rich amidst crowds of poor always rubbed %name% the wrong way. So he stole from them both and gave to himself. | %name%\'s father taught him all there was to know about stealing including, unfortunately, how to backstab. | The church steals with a silver plate. The lords do it with the taxman. So %name% figured why can\'t he do it with his own two hands? | Impoverished while growing up, %name% took to stealing bread. Well-fed, he soon took to stealing crowns.} {After years of successful stealing, one mistake landed %name% in a dungeon. Thankfully, years of stealing also meant years of lockpicking and he didn\'t spend long. | But when he was caught trying to steal a temple\'s chalice, a talk with a monk convinced %name% to perhaps take a different path. | Unfortunately, a smash-and-grab at a local store ended with %name% being caught red-handed. He was soon profiled on posters everywhere, making his work difficult. | Daring to cut the purse of a fat trader, %name% soon found himself nursing a hand absent of a few fingers. He really liked those fingers, too. | %name%\'s thievery eventually placed him at the head of an entire guild. But after a dozen failed assassination attempts, the thief realized there was nobody to trust in his line of work. | Partnering up with a beautiful woman, %name% managed to steal from everybody. Too bad the woman stole from him, in the end. | Trying to sell some goods, a trusted fence turned out to be a traitorous informant. One bad pillory experience later and the thief was exiled from %randomtown%. | It was the perfect heist. That\'s all that is said about it. Now, %name% just needs to lay low. | Tortured by a rival gang, he came to miss a number of teeth, fingernails, and any drive to return to thieving. | His time as a thief came to an end when, arrested, he spent five days pilloried during tomato season. | Naturally, it wasn\'t long until he went to prison. He doesn\'t speak of his time there, but it is obvious he wishes to never return. | But one day he learned there are much better ways to spin a blade for a coin than petty thievery. | But his half-brother was captured by a local gang, forcing the thief to find new ways to pay the hefty ransom. | But life as a brigand is not easy. Arrested for eating a chicken that was not his, the man forfeited two fingers and any will to keep thieving. | After a heist went south, the man fingered all his former partners to save his own hide. Now he can never go back to thieving.} {For all you know %name% is just using sellswords to hide behind. Regardless of his reasons, he\'s still going to have to earn his pay. | You recognize %name% from some posters.  Well, a man who has gotten this far without being caught must have some value. | With one hand, %name% twirls a blade between his fingers. With the other, he snags your purse. Impressive. Now give it back. | Years of thieving have made %name% adept at escaping trouble. | %name% has the skills to be a good mercenary, just be sure to watch your purse while around him. | You can\'t trust a man like %name%, but that attribute has plenty of company anyway. | Supposedly, somebody once shot an arrow at %name%. They missed, but the thief kept the feathers. | %name%\'s effort to join sellswords better not be a scheme to steal from your coffers. | Wanted posters say %name% is considered \'armed and dangerous\'. Perfect. | There are plenty of lawmen looking for %name%. Maybe you can get them to join, too.}";
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

