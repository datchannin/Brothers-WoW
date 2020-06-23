local gt = this.getroottable();

if (!("Wow_strings" in gt.Const))
{
	gt.Const.Wow_strings <- {
		function getArticle( _object )
		{
			return this.isFirstCharacter(_object, [
				"A",
				"E",
				"I",
				"O",
				"U"
			]) ? "an " : "a ";
		}

		function getArticleCapitalized( _object )
		{
			return this.isFirstCharacter(_object, [
				"A",
				"E",
				"I",
				"O",
				"U"
			]) ? "An " : "A ";
		}

	};
}

gt.Const.Wow_strings.WinterwolfNames <- [
	"Max",
	"Bear",
	"Charlie",
	"Toby",
	"Lucky",
	"Cooper",
	"Teddy",
	"Loki",
	"Rocky",
	"Finn",
	"Wagner",
	"Bruno",
	"Chester",
	"Buddy",
	"Duke",
	"Zeus",
	"Dexter",
	"Jasper",
	"Ziggy",
	"Milo",
	"Ollie",
	"Bailey",
	"Jack",
	"Oscar",
	"Gizmo",
	"Thor",
	"Ozzy",
	"Harley",
	"Winston",
	"Ace",
	"Murphy",
	"Blu",
	"Blue",
	"Arlo",
	"Brody",
	"Leo",
	"Henry",
	"Tank",
	"Griffin",
	"Buster",
	"Comet",
	"Bruiser",
	"Bruce",
	"Cash",
	"Baxter",
	"Cosmo",
	"Diesel",
	"Banjo",
	"Gunner",
	"Jax",
	"Zyron",
	"Hurricane",
	"Odin",
	"Corvus",
	"Inchyra",
	"Stirling",
	"Lulworth",
	"Hobbs",
	"Auster",
	"Fisher",
	"Moss",
	"Ash"
];

gt.Const.Wow_strings.PerkName <- {
	DefensiveStance = "Defensive Stance",
	BerserkerStance = "Berserker Stance",
	Toughness = "Toughness",
	Hardness = "Hardness",
	BattleShout = "Battle Shout",
	Mobility = "Mobility",
	LastStand = "Last Stand",
	Gravity = "Gravity",
	BerserkerRage = "Berserker Rage",
	Charge = "Charge",
	MasterSpear = "Spear Specialization",
	MasterSword = "Sword Specialization",
	MasterAxe = "Axe Specialization",
	MasterHammer = "Hammer Specialization",
	MasterShield = "Shield Specialization",
	BloodThirst = "Blood Thirst",	
	Poison = "Poison",
	Camouflage = "Camouflage",
	Endurance = "Endurance",
	VilePoison = "Vile Poison",
	ExposeArmor = "Expose Armor",
	Hemorrhage = "Hemorrhage",
	KidneyShot = "Kidney Shot",
	Initiative = "Initiative",
	Kick = "Kick",
	Disarm = "Disarm",
	MasterDagger = "Dagger Specialization",
	MasterMace = "Mace Specialization",
	MasterFlail = "Flail Specialization",
	Vigor = "Vigor",
	AdrenalineRush = "Adrenaline Rush",
	HolyLight = "Holy Light",
	BlessingofMight = "Blessing of Might",
	HolyPower = "Holy Power",
	Anticipation = "Anticipation",
	HammerofJustice = "Hammer of Justice",
	DivineStrength = "Divine Strength",
	DevoutionAura = "Devoution Aura",
	RetributionAura = "Retribution Aura",
	ConcentrationAura = "Concentration Aura",
	SanctityAura = "Sanctity Aura",
	DivineShield = "Divine Shield",
	SealofCommand = "Seal of Command",
	BeastMaster = "Beast Master",
	HuntersMark = "Hunters Mark",
	EnduranceTraining = "Endurance Training",
	ThickHide = "Thick Hide",
	Survivalist = "Survivalist",
	LightingReflexes = "Lighting Reflexes",
	BestialSwifting = "Bestial Swifting",
	UnleashedFury = "Unleashed Fury",
	AspectoftheMonkey = "Aspect of the Monkey",
	AspectoftheHawk = "Aspect of the Hawk",
	MasterThrowing = "Master Throwing",
	MasterBow = "Master Bow",
	MasterCrossbow = "Master Crossbow",
	MendPet = "Mend Pet",
	LethalShot = "Lethal Shot"
};

gt.Const.Wow_strings.PerkDescription <- {
	DefensiveStance = "A defensive combat stance. Decreases damage taken by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] and damage caused by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color].",
	BerserkerStance = "An aggressive stance. Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] and all direct damage taken is increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color].",
	Toughness = "You have skill in armor using. Armor damage taken is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]3%[/color].",
	Hardness = "Do you know how to use muscles? Sure. Stamina value is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color].",
	BattleShout = "The warrior shouts, increasing the melee attack power of all party members within 2 tile by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color].",
	Mobility = "Unlocks the \'Mobility\' skill which increases your Action Points by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color]. Do you have enough Fatigue? Characters can not have more than their maximum Action Points",
	LastStand = "Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]30%[/color]. More hitpoints - more survival. Now you are a defense machine.",
	Gravity = "Unlocks the \'Gravity\' skill which allows you to drag in enemy or friend. Drag and crush!",
	BerserkerRage = "Unlocks the \'Berserker Rage\' skill which give you powerful buff. Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]",
	Charge = "Unlocks the \'Charge\' skill which allows you to charge closer to enemy.",
	MasterSpear = "Spear adept. Spear is your past, present and future. Damage done by spear is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	MasterSword = "Sword adept. What can be greater, that sword? Fast attack, then attack again and again. Damage done by sword is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	MasterAxe = "Axe adept. Now chopping opponents into pieces has become easier. After all, you have learned the details of destruction! Damage done by axe is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with one-handed weapon.",
	MasterHammer = "Hammer adept. The severity of the hammers gives you confidence. And the more confident you hit, the more serious the damage becomes... Damage done by hammer is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with one-handed weapon.",
	MasterShield = "Shield adept. You become steady. It’s easier for your opponents to break through the wall than through your shield. The shield defense bonus is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]. This also applies to the additional defense bonus of the Shieldwall skill.\n\nAlso it gives you immunity to being stunned even if you are not equipped by shield right now.",
	BloodThirst = "Your successful melee attack restores you [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] health.",	
	Poison = "Unlocks the \'Poison\' skill which allows rogue to impose poisons on the target. Make your enemies die slowly.",
	Camouflage = "Unlocks the \'Camouflage\' skill which allows you to sneak around. It increases your Melee Defense skill by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points and allows you to ignore hostile zone of control.",
	Endurance = "Drop the shield and don\'t think about the defense. This perk help you to increase Defense by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color]. Your Initiative will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color].",
	VilePoison = "Your skill and poison knowledge enhances [color=" + this.Const.UI.Color.PositiveValue + "]\'Poison\'[/color] skill. Increases the damage dealt by your poisons by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] and duration of you poisons by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] turn. Does not have any effect if you don\'t have [color=" + this.Const.UI.Color.PositiveValue + "]\'Poison\'[/color] skill.",
	ExposeArmor = "You are almost \'Duelist\' now. An additional [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of any damage ignores armor. Works only if your offhand is free.",
	Hemorrhage = "Unlocks the \'Hemorrhage\' skill which allows you to debaff the target. Such debuff increases damage taken by enemy. No one will escape the fate!",
	KidneyShot = "Unlocks the \'Kidney Shot\' skill which stuns the target. If target was stun by this skill, it damage taken is increased.",
	Initiative = "No one can stop you. Your Initiative increases by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points.\n\nAlso it gives you immunity to being rooted.",
	Kick = "Unlocks the \'Kick\' skill which allows you to push the enemy. Enemy will not be able to understand where is his target now.",
	Disarm = "Unlocks the \'Disarm\' skill which allows you to disarm the enemy with high probability. Who lost the weapon, will lose the life.",
	MasterDagger = "Dagger Adept. Dagger punctures becomes stronger and more accurate. Damage done by dagger is increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]. An additional [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of any dagger damage ignores armor.",
	MasterMace = "Mace Adept. The mace in your hands becomes more destructive. Damage done by mace is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	MasterFlail = "Flail Adept. Сhain movements becomes faster. Take care of your head and ribs. Damage done by flail is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	Vigor = "Increase your efficiency! Lightning reflexes help you do more in the same time. Gives you [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] additional Action Points",
	AdrenalineRush = "Adrenaline pulsates in your veins. And every move restores your Fatigue now. [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Fatigue Recovery per turn.",
	HolyLight = "Unlocks the \'Holy Light\' skill. Light fills the paladin with power and help him heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]7[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]14[/color] Hitpoints.",
	BlessingofMight = "Unlocks the \'Blessing of Might\' skill which gives you powerful buff. Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]",
	HolyPower = "You ask Light for help with double perseverance. This enhances your [color=" + this.Const.UI.Color.PositiveValue + "]\'Holy Light\'[/color] skill. Increases the number of Hitpoints healing for [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points. Does not have any effect if you don\'t have [color=" + this.Const.UI.Color.PositiveValue + "]\'Holy Light\'[/color] skill.",
	Anticipation = "You have skill in armor using. This perk help you to increase Defense by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color].",
	HammerofJustice = "Unlocks the \'Hammer of Justice\' skill which allows paladin to summon a hammer into your enemy and stun the target.",
	DivineStrength = "You have skill in weapon using. This perk help you to increase Melee Skill by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color].",
	DevoutionAura = "Unlocks the \'Devoution Aura\' skill. This aura increases Melee Defense of all party members within 4 tiles by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color].",
	RetributionAura = "Unlocks the \'Retribution Aura\' skill. This aura allows all party members within 4 tiles to restore [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] health by every successful melee attack.",
	ConcentrationAura = "Unlocks the \'Concentration Aura\' skill. This aura increases Fatigue Recovery of all party members within 4 tiles by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color].",
	SanctityAura = "Unlocks the \'Sanctity Aura\' skill. This aura add Hitpoints regeneration of all party members within 4 tiles by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] points.",
	DivineShield = "Unlocks the \'Divine Shield\' skill which gives your target Immunity for one turn.",
	SealofCommand = "Fills you with \'Seal of Command\'. This give your additional Action Point, [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] Fatigue and increase your Hitpoints by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color].",
	BeastMaster = "You have a personal pet now. Unlocks the \'Pet Summon\' skill which give you possibility to summon Winter Wolf under your command.",
};