/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
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
	GameDev = "Game Design",
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
	HuntersMark = "Hunter\'s Mark",
	EnduranceTraining = "Endurance Training",
	ThickHide = "Thick Hide",
	Survivalist = "Survivalist",
	LightingReflexes = "Lighting Reflexes",
	BestialSwiftness = "Bestial Swiftness",
	UnleashedFury = "Unleashed Fury",
	AspectoftheMonkey = "Aspect of the Monkey",
	AspectoftheHawk = "Aspect of the Hawk",
	MasterThrowing = "Master Throwing",
	MasterBow = "Master Bow",
	MasterCrossbow = "Master Crossbow",
	MendPet = "Mend Pet",
	LethalShots = "Lethal Shots",
	Fireball = "Fireball",
	Frostbolt = "Frostbolt",
	ArcaneIntellect = "Arcane Intellect",
	PresenceofMind = "Presence of Mind",
	Evocation = "Evocation",
	ManaShield = "Mana Shield",
	BlastWave = "Blast Wave",
	FireWard = "Fire Ward",
	ArcticReach = "Arctic Reach",
	FrostArmor = "Frost Armor",
	MasterPolearm = "Polearm Specialization",
	Ignite = "Ignite",
	WintersChill = "Winter\'s Chill",
	MagicFocus1 = "Magic Focus: Peace",
	MagicFocus2 = "Magic Focus: Angry",
	MagicFocus3 = "Magic Focus: Arcane",
	Meditation = "Meditation",
	MagicAbsorption = "Magic Absorption",
	MagicInstability = "Magic Instability",
	FireAttunement = "Fire Attunement",
	IceAttunement = "Ice Attunement",
	Heal = "Heal",
	Shield = "Power Word: Shield",
	BlessedRecovery = "Blessed Recovery",
	Fortitude = "Power Word: Fortitude",
	DivineSpirit = "Divine Spirit",
	InnerFire = "Inner Fire",
	InnerFocus = "Inner Focus",
	HolyReach = "Holy Reach",
	Inspiration = "Inspiration",
	HealingFocus = "Healing Focus",
	MentalStrength = "Mental Strength",
	SpiritalHealing = "Spirital Healing",
	MentalAgility = "Mental Agility",
	RecoveryBroke = "Recovery: Broke",
	RecoveryFracture = "Recovery: Fracture",
	RecoveryPierce = "Recovery: Pierce",
	RecoverySplit = "Recovery: Split",
	Renew = "Renew",
	RepairMaster = "Repair Master",
	RecoveryMaximum = "Recovery: Maximum",
	Moonfury = "Moonfury",
	Ferocity = "Ferocity",
	FaerieFire = "Faerie Fire",
	AbolishPoison = "Abolish Poison",
	Barkskin = "Barkskin",
	GiftofNature = "Gift of Nature",
	FerociousBite = "Ferocious Bite",
	DemoralizingRoar = "Demoralizing Roar",
	Swipe = "Swipe",
	FeralCharge = "Feral Charge",
	Swiftmend = "Swiftmend",
	SharpenedClaws = "Sharpened Claws",
	PrimalFury = "Primal Fury",
	Clarity = "Clarity",
	HeartofWild = "Heart of Wild",
	Furor = "Furor",
	MarkofWild = "Mark of Wild",
	Tiger = "Tiger",
	DireBear = "Dire Bear",
	Shadowbolt = "Shadowbolt",
	DrainSoul = "Drain Soul",
	DrainLife = "Drain Life",
	DrainStamina = "Drain Stamina",
	LifeTap = "Life Tap",
	DemonArmor = "Demon Armor",
	DestructiveReach = "Destructive Reach",
	Devastation = "Devastation",
	CurseofAgony = "Curse of Agony",
	DrainFunnel = "Drain Funnel",
	Shadowburn = "Shadowburn",
	GrimReach = "Grim Reach",
	FelDomination = "Fel Domination",
	DemonSkin = "Demon Skin",
	DemonicEmbrace = "Demonic Embrace",
	FelIntellect = "Fel Intellect",
	ShadowMastery = "Shadow Mastery",
	MasterDemonologist = "Master Demonologist",
	Ruin = "Ruin",
	CurseofDoom = "Curse of Doom"
};

gt.Const.Wow_strings.PerkDescription <- {
	GameDev = "Perk for test, design and debug skills.",
	DefensiveStance = "A defensive combat stance. Decreases damage taken by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] and damage caused by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color].",
	BerserkerStance = "An aggressive stance. Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] and all direct damage taken is increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color].",
	Toughness = "You have skill in armor using. Armor damage taken is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]3%[/color].",
	Hardness = "Do you know how to use muscles? Sure. Stamina value is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color].",
	BattleShout = "The warrior shouts, increasing the melee attack power of all party members within 2 tile by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color].",
	Mobility = "Unlocks the \'Mobility\' skill which increases your Action Points by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color]. Do you have enough Fatigue? Characters can not have more than their maximum Action Points",
	LastStand = "Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]30%[/color]. More hitpoints - more survival. Now you are a defense machine.",
	Gravity = "Unlocks the \'Gravity\' skill which allows you to drag in enemy or friend. Drag and crush!",
	BerserkerRage = "Unlocks the \'Berserker Rage\' skill which gives you powerful buff. Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color].",
	Charge = "Unlocks the \'Charge\' skill which allows you to charge closer to enemy.",
	MasterSpear = "Spear Adept. Spear is your past, present and future. Damage done by spear is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	MasterSword = "Sword Adept. What can be greater, that sword? Fast attack, then attack again and again. Damage done by sword is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	MasterAxe = "Axe Adept. Now chopping opponents into pieces has become easier. After all, you have learned the details of destruction! Damage done by axe is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with one-handed weapon.",
	MasterHammer = "Hammer Adept. The severity of the hammers gives you confidence. And the more confident you hit, the more serious the damage becomes... Damage done by hammer is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with one-handed weapon.",
	MasterShield = "Shield Adept. You become steady. It’s easier for your opponents to break through the wall than through your shield. The shield defense bonus is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]. This also applies to the additional defense bonus of the Shieldwall skill.\n\nAlso it gives you immunity to being stunned even if you are not equipped by shield right now.",
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
	SealofCommand = "Fills you with \'Seal of Command\'. This gives your additional Action Point, [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] Fatigue and increase your Hitpoints by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color].",
	BeastMaster = "You have a personal pet now. Unlocks the \'Pet Summon\' skill which gives you possibility to summon Winter Wolf under your command. Even if your pet was killed, you can summon him again in new battle.",
	HuntersMark = "Unlocks the \'Hunters Mark\' skill which allows you to mark the target. This debuff increases damage taken by enemy. You can mark enemy from long distance.",
	EnduranceTraining = "Step to train your pet. Now Winter Wolf has more Hitpoints and Fatigue. This perk help you to increase your pet Hitpoints by [color=" + this.Const.UI.Color.PositiveValue + "]100%[/color]. Pet Fatigue also increases by [color=" + this.Const.UI.Color.PositiveValue + "]40[/color].",
	ThickHide = "Step to train your pet. Now Winter Wolf has more Defense. This perk help you to increase your pet Melee and Ranged Defense by [color=" + this.Const.UI.Color.PositiveValue + "]40[/color] points.",
	Survivalist = "Do you know how to stay alive? Increase your Hitpoints and win the combat. Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]33%[/color]",
	LightingReflexes = "Your movements are faster than lightning flashes. Your Initiative increases by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points.\n\nAlso Fatigue increases by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color].",
	BestialSwiftness = "Step to train your pet. Now Winter Wolf has more Fatigue Recovery and Action Points. This perk help you to increase your pet Fatigue Recovery by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points. Pet Action Points also increases by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color].",
	UnleashedFury = "Step to train your pet. Now Winter Wolf has more Melee Skill and Bravery. This perk help you to increase your pet Melee Skill by [color=" + this.Const.UI.Color.PositiveValue + "]30[/color] points. Pet Bravery also increases by [color=" + this.Const.UI.Color.PositiveValue + "]30[/color].",
	AspectoftheMonkey = "You know how Monkey dodges hits. Increase your Ranged Defense by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points",
	AspectoftheHawk = "You know hot Hawk tracks down prey. Increase your Ranged Skill by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points",
	MasterThrowing = "Throwing Adept. Your arms get stronger and your throwing power is rising. Damage done by Throw Weapon is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color].",
	MasterBow = "Bow Adept. Bow is weapon for the winner! Do your shot more powerful, kill your target faster. Damage done by Bow is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color].",
	MasterCrossbow = "Crossbow Adept. Сrossbow can pierce target that is inaccessible to anyone else! Damage done by Crossbow is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color].",
	MendPet = "Unlocks the \'Mend Pet\' skill which allows you to heal your pet.",
	LethalShots = "Gives you \'Lethal Shots\' possibility. Learn to take advantage of your high Initiative and stun the enemy with your attacks.\n\nWith every attack, hit or miss, against an opponent that acts after you in the current round, you can stun him for one turn with [color=" + this.Const.UI.Color.PositiveValue + "]33%[/color] probability.",
	Fireball = "This is main spell for mages who wants to be \'Fire Mage\'. Unlocks the \'Fireball\' skill. Use this to burn an enemy.",
	Frostbolt = "This is main spell for mages who wants to be \'Frost Mage\'. Unlocks the \'Frostbolt\' skill. Use this to freeze an enemy.",
	ArcaneIntellect = "You know how to cast spells more effectively. Fatigue value is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points.",
	PresenceofMind = "Your knowledge is beyond limits. Learning is your credo! Get additional [color=" + this.Const.UI.Color.PositiveValue + "]40%[/color] experience from battle.",
	Evocation = "Unlocks the \'Evocation\' skill. This skill can restore your Fatigue pool. But once per combat. Use it wisely.",
	ManaShield = "Use your mana as a shield. Decreases damage taken by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]",
	BlastWave = "You understood how to use \'Fireball\' more destructive. Increase range of \'Fireball\' by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] and damage done by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points.",
	FireWard = "Unlocks the \'Fire Ward\' skill which can be used to buff the user. Increase your Ranged and Melee Defense by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points for one turn.",
	ArcticReach = "You understood how to use \'Frostbolt\' more destructive. Increase range of \'Frostbolt\' by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] and damage done by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points.",
	FrostArmor = "Unlocks the \'Frost Armor\' skill which can be used to buff the user. Allows you to ignore hostile zone of control for one turn.",
	MasterPolearm = "Polearm Adept. Hit enemies from behind allies with great power. Damage done by polearms is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color].",
	Ignite = "Now your \'Fireball\' is able to ignite target. Target gets damage for every turn under this effect.",
	WintersChill = "Now your \'Frostbolt\' is able to freeze target. Target will be chained by this effect.",
	MagicFocus1 = "Peace of your mind is under control now. Increases \'Frostbolt\' and \'Fireball\' spell damage by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] points.",
	MagicFocus2 = "Angry of your mind is under control now. Increases \'Frostbolt\' and \'Fireball\' spell damage by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] points.",
	MagicFocus3 = "Arcane channel in your mind is under control now. Increases \'Frostbolt\' and \'Fireball\' spell damage by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] points.",
	Meditation = "Learn how to meditate even while combat is in progress. You are as a stone now. Increases your Fatigue recover for [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] per turn.",
	MagicAbsorption = "You know how to increase efficiency of your damage spells and this ability reduces \'Frostbolt\' and \'Fireball\' Fatigue cost by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color].",
	MagicInstability = "Small lightning flies away from you when you are casting spells. Increase range of \'Frostbolt\' and \'Fireball\' by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color].",
	FireAttunement = "Your fire spells are more destructive now. Increase \'Fireball\' damage done by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points.",
	IceAttunement = "Your frost spells are more destructive now. Increase \'Frostbolt\' damage done by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points.",
	Heal = "Unlocks the \'Heal\' skill. Use Light inside the priest to heal the target for [color=" + this.Const.UI.Color.PositiveValue + "]12[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]25[/color] Hitpoints.",
	Shield = "Unlocks the \'Power Word: Shield\' skill. Now you know how to repair Body Armor.",
	BlessedRecovery = "Unlocks the \'Blessed Recovery\' skill, which allows you to recover some kind of \'Cut\' and \'Deep Cut\' injuries.",
	Fortitude = "Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]33%[/color]. Do you want to stay alive?",
	DivineSpirit = "You know how to heal more effectively. Fatigue value is increased by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] points.",
	InnerFire = "Unlocks the \'Inner Fire\' skill which gives you defensive buff. Increases your Ranged and Melee Defense by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] points for [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] turns.",
	InnerFocus = "Now you can focus only on spell casting. You can increase your Ranged and Melee Defense by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points instead of decrease your Ranged and Melee Skill by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points.",
	HolyReach = "Increases range of \'Heal\' by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color]. Distance doesn\'t matter more.",
	Inspiration = "Upps your \'Power Word: Shield\' skill. Now this skill can be used for repair Head Armor.",
	HealingFocus = "Heal more Hitpoints for the same efforts. This enhances your [color=" + this.Const.UI.Color.PositiveValue + "]\'Heal\'[/color] skill. Increases the number of Hitpoints healing for [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points.",
	MentalStrength = "Increases power of your \'Power Word: Shield\' skill by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] points and Action Points cost of this spell will be increased by [color=" + this.Const.UI.Color.NegativeValue + "]1[/color].",
	SpiritalHealing = "Healing is your main specialization. This enhances your [color=" + this.Const.UI.Color.PositiveValue + "]\'Heal\'[/color] skill. Increases the number of Hitpoints healing for [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points.",
	MentalAgility = "Increases power of your \'Power Word: Shield\' skill by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points and Action Points cost of this spell will be increased by [color=" + this.Const.UI.Color.NegativeValue + "]2[/color].",
	RecoveryBroke = "Increases efficiency of your \'Blessed Recovery\' skill. Now you know how to recover some kind of \'Broke\' injuries.",
	RecoveryFracture = "Increases efficiency of your \'Blessed Recovery\' skill. Now you know how to recover some kind of \'Fracture\' injuries.",
	RecoveryPierce = "Increases efficiency of your \'Blessed Recovery\' skill. Now you know how to recover some kind of \'Pierce\' injuries.",
	RecoverySplit = "Increases efficiency of your \'Blessed Recovery\' skill. Now you know how to recover some kind of \'Split\' injuries.",
	Renew = "Now your \'Heal\' spell is able to apply a healing buff to your target. Target will be healed for every turn under this effect.",
	RepairMaster = "Become Master of armor repair. Increases power of your \'Power Word: Shield\' skill by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points, reduces Fatigue cost of this spell will by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color]. Also increases range of this spell by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color].",
	RecoveryMaximum = "Gives maximum power to your \'Blessed Recovery\' skill. Some \'Permanent\' injuries now also can be healed.",
	Moonfury = "Imbues the Druid with Nature energy. Now you can apply Moonfury state which allows you use set of \'Nature\' spells.\n\nThis state empowers your spells with different \'Nature\' abilities. And under this effect your spells have different special effects.\n\nUnlocks the \'Innervate\' skill which allows you to piece out part of target\'s Fatigue.",
	Ferocity = "Imbues the Druid with Ferocity energy. Now you have known the depths of your inner rage. This effect gives you possibility to shapeshift into different animal forms.\n\nUnlocks the \'Cat Form\' skill which allows you to shapeshift into big cat. You will able to use set of damage abilities to break your target in the pieces.\n\nUnlocks the \'Bear Form\' skill which allows you to shapeshift into mighty bear. You will be able to use set of protective abilities and stay alive even in hopeless situations.",
	FaerieFire = "Unlocks the \'Faerie Fire\' skill which can be used depending on your current state.\n\n\'Moonfury\': Under this state \'Faerie Fire\' skill can be used to reduce target bravery.\n\n\'Cat Form\': in this form \'Faerie Fire\' skill can be used to reduce target Melee Defense.\n\n\'Bear Form\': in this form \'Faerie Fire\' skill can be used to reduce target Melee Skill.",
	AbolishPoison = "Unlocks the \'Abolish Poison\' skill which can be used depending on your current state.\n\n\'Moonfury\': Under this state \'Abolish Poison\' skill can be used to remove Poison effect from your target.\n\n\'Cat Form\': in this form \'Abolish Poison\' skill passively gives you immunity from Poison Effects.\n\n\'Bear Form\': in this form \'Abolish Poison\' skill passively gives you immunity from Poison Effects.",
	Barkskin = "Unlocks the \'Barkskin\' skill which can be used depending on your current state.\n\n\'Moonfury\': Under this state \'Barkskin\' skill gives you powerful buff that can be used to increase your Ranged Defense.\n\n\'Cat Form\': in this form \'Barkskin\' skill gives you powerful buff that can be used to increase your Melee Defense.\n\n\'Bear Form\': in this form \'Barkskin\' skill gives you powerful buff that can be used to increase your Melee Defense and reduce incoming damage.",
	GiftofNature = "Learn this perk and \'Nature\' grants you protective spell.\n\n\'Moonfury\': Under this state \'Nature\' grants you \'Rejuvenation\' skill that can be used to heal over time your target.\n\n\'Cat Form\': In this form \'Nature\' grants you \'Prowl\' skill that can be used to ignore hostile zone of control.\n\n\'Bear Form\': in this form \'Nature\' grants you \'Frenzied Regeneration\' skill that can be used to regenerate part of your Hitpoints.",
	FerociousBite = "Unlocks the \'Ferocious Bite\' skill which can be used to attack your enemies. This skill can be used only while you are in \'Cat Form\'.",
	DemoralizingRoar = "Unlocks the \'Demoralizing Roar\' skill which can be used to reduce Attack Power of your enemies. This skill can be used only while you are in \'Bear Form\'.",
	Swipe = "Unlocks the \'Swipe\' skill which can be used to massively attack pack of your enemies. This skill can be used only while you are in \'Cat Form\'.",
	FeralCharge = "Unlocks the \'Feral Charge\' skill which allows you to charge closer to enemy. This skill can be used only while you are in \'Bear Form\'.",
	Swiftmend = "Learn this perk and power of your \'Rejuvenation\' spell will be increased. This perk is active only while you are under \'Moonfury\' effect.",
	SharpenedClaws = "Learn this perk and power of your \'Claw\' spell will be increased. Power for your \'Claw\' spell will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. This perk is active only while you are in \'Cat Form\'.",
	PrimalFury = "Learn this perk and power of your \'Maul\' spell will be increased: damage bonus against armor will be doubled. This perk is active only while you are in \'Bear Form\'.",
	Clarity = "Learn this perk and power of your \'Innervate\' spell will be increased. This perk is active only while you are under \'Moonfury\' effect.",
	HeartofWild = "Learn this perk and \'Nature\' grants you positive effect:\n\'Moonfury\': Under this state you will be given additional [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] Fatigue points and your Fatigue regeneration rate will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] points.\n\'Cat Form\': Power for your \'Claw\' spell will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color].\n\'Bear Form\': Your Hitpoints will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]30%[/color] and duration of your \'Bash\' skill will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] turn.",
	Furor = "This effect decreases cost of your shapeshift spells. Compatible with \'Moonfury\', \'Cat Form\' and \'Bear Form\'. Using these spells will be [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] cheaper.",
	MarkofWild = "Unlocks the \'Mark of Wild\' skill. This skill can be used to increase Resolve of your target. This skill can be used only while you are under \'Moonfury\' effect.",
	Tiger = "Now you know how to increase of your rage while you are in \'Cat Form\'. Your Melee Skill increases by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points. Also you can use [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] additional Action Points.",
	DireBear = "Now you know how to stay alive more effectively while you are in \'Bear Form\'. Your Hitpoints increases by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]. Also your Resolve increases by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color].",
	Shadowbolt = "Unlocks the \'Shadowbolt\' skill. Summons a shadow bolt, which deals heavy damage, but cost lot of Fatigue. Now every Warlock can use this spell.",
	DrainSoul = "Unlocks the \'Drain Soul\' skill. Warlock is able to deal damage to target\'s soul. If target dies from this spell, Warlock consume the soul and create soulshard.\n\nSoul from the \'Soul Shard\' breaks free at the end of the turn.",
	DrainLife = "Unlocks the \'Drain Life\' skill. This skill can be used for drain target\'s hitpoins. Hitpoints can not be drunk, if spell damages only Armor.",
	DrainStamina = "Unlocks the \'Drain Stamina\' skill. Using this skill you can drain target\'s stamina. This effect increases enemy'\s Fatigue and decreases your Fatigue.",
	LifeTap = "Unlocks the \'Life Tap\' skill. This skill allows you to reduce Fatigue using your Hitpoints.",
	DemonArmor = "Unlocks the \'Demon Armor\' skill which buffs you with additional Ranged and Melee Defense for [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] turns.\n\n\'Soul Shard\': Skill uses \'Soul Shard\' if you have it. If soul shard was used, \'Demon Armor\' gives you additional Hitpoints regeniration until buff is active.",
	DestructiveReach = "Increases range of \'Shadowbolt\' by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color]. Kill your enemies before they close in you.",
	Devastation = "Enhances the \'Shadowbolt\': allows it to deal critical damage.\n\nGives [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] chance to critical damage.\n\nCritical damage deals [color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] damage.",
	CurseofAgony = "Unlocks the \'Curse of Agony\' skill which is used to curse your enemy. This curse deals damage over [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] turns. \n\n\'Soul Shard\': Skill uses \'Soul Shard\' if you have it. If soul shard was used, \'Curse of Agony\' deals double damage.",
	DrainFunnel = "Increases power of your \'Drain\' spells. Affects \'Drain Life\' and \'Drain Stamina\' skills.",
	Shadowburn = "Enhances the \'Shadowbolt\': increase base damage of this spell.",
	GrimReach = "Increases range of \'Curse of Agony\' by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color]. Curse your enemies before they close in you.",
	FelDomination = "Enhances the \'Curse of Agony\': increase base damage of this powerful curse.",
	DemonSkin = "Enhances the \'Demon Armor\': increases the duration of the effect by additional [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] turns.",
	DemonicEmbrace = "Your Hitpoints increases by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]. Warlocks know how to use it!",
	FelIntellect = "You know how to use your Fatigue more effectively. Fatigue value is increased by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] points.",
	ShadowMastery = "Enhances the \'Devastation\' effect: increases \'Shadowbolt\' critical damage chance by additional [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not have any effect if you don\'t have [color=" + this.Const.UI.Color.PositiveValue + "]\'Devastation\'[/color] perk.",
	MasterDemonologist = "If you learn this perk, soul from the \'Soul Shard\' will not be able to break free at the turn end. Consume the shard for spells casting only!",
	Ruin = "Enhances the \'Devastation\' effect: increases \'Shadowbolt\' critical damage value by additional [color=" + this.Const.UI.Color.PositiveValue + "]100%[/color]. Does not have any effect if you don\'t have [color=" + this.Const.UI.Color.PositiveValue + "]\'Devastation\'[/color] perk.",
	CurseofDoom = "Unlocks the \'Curse of Doom\' skill which is used to deal massive damage to your enemy.\n\n\'Soul Shard\': This skill can be used only if Warlock has \'Soul Shard\'. Using \'Curse of Doom\' cousumes soul."
};