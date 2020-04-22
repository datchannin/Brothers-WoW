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
	DefensiveStance = "Defensive Stance"
};
gt.Const.Wow_strings.PerkDescription <- {
	DefensiveStance = "A defensive combat stance. Decreases damage taken by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] and damage caused by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]."

};