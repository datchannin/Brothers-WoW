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
	BerserkerRage = "Unlocks the \'Berserker Rage\' skill which give you powerfull buff. Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]",
	Charge = "Unlocks the \'Charge\' skill which allows you to charge closer to enemy.",
	MasterSpear = "Spear adept. Spear is your past, present and future. Damage done by spear is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	MasterSword = "Sword adept. What can be greater, that sword? Fast attack, then attack again and again. Damage done by sword is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with two-handed weapon.",
	MasterAxe = "Axe adept. Now chopping opponents into pieces has become easier. After all, you have learned the details of destruction! Damage done by axe is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with one-handed weapon.",
	MasterHammer = "Hammer adept. The severity of the hammers gives you confidence. And the more confident you hit, the more serious the damage becomes... Damage done by hammer is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]. Does not work with one-handed weapon.",
	MasterShield = "Shield adept. You become steady. It’s easier for your opponents to break through the wall than through your shield. The shield defense bonus is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]. This also applies to the additional defense bonus of the Shieldwall skill.\n\nAlso it gives you immunity to being stunned even if you are not equipped by shield right now.",
	BloodThirst = "Your successful melee attack restores you [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] health.",	
	Poison = "Unlocks the \'Poison\' skill which allows rogue to impose poisons on the target. Make your enemies die slowly.",
	Camouflage = "Unlocks the \'Camouflage\' skill which allows you to sneak around. It increases your defense skill by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points and allows you to ignore hostile zone of control.",
	Endurance = "Drop the shield and don\'t think about the defense. This perk help you to increase Defense by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color]. Your Initiative will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color].",
	VilePoison = "Your skill and poison knowledge enhances [color=" + this.Const.UI.Color.PositiveValue + "]\'Poison\'[/color] skill. Increases the damage dealt by your poisons by 10. Does not have any effect if you don\'t have [color=" + this.Const.UI.Color.PositiveValue + "]\'Poison\'[/color] skill.",
	ExposeArmor = "You are almost \'Duelist\' now. An additional [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of any damage ignores armor. Works only if your offhend is free.",
	Hemorrhage = "Unlocks the \'Hemorrhage\' skill which allows you to debaff the target. Such debuff increases damage taken by enemy. No one will escape the fate!",
	KidneyShot = "Unlocks the \'Kidney Shot\' skill which stuns the target. If target was stun by this skill, it damage taken is increased.",
	Initiative = "No one can stop you. Your Initiative increases by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points.\n\nAlso it gives you immunity to being rooted.",
};