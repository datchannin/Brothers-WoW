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
};
gt.Const.Wow_strings.PerkDescription <- {
	DefensiveStance = "A defensive combat stance. Decreases damage taken by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] and damage caused by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color].",
	BerserkerStance = "An aggressive stance. Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] and all direct damage taken is increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color].",
	Toughness = "You have skill in armor using. Armor damage taken is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]3%[/color].",
	Hardness = "Do you know how to use muscles? Sure. Stamina value is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color].",
	BattleShout = "The warrior shouts, increasing the melee attack power of all party members within 2 tile by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color].",
	Mobility = "Unlocks the 'Mobility' skill which increases your Action Points by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color]. Do you have enough Fatigue?",
};