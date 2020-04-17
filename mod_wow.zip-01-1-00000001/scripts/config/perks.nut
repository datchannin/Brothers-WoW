local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.Perks <- [
	[
		gt.Const.Perks.PerkDefObjects.FastAdaption
		gt.Const.Perks.PerkDefObjects.CripplingStrikes
		gt.Const.Perks.PerkDefObjects.Colossus
		gt.Const.Perks.PerkDefObjects.NineLives
		gt.Const.Perks.PerkDefObjects.BagsAndBelts
		gt.Const.Perks.PerkDefObjects.Pathfinder
		gt.Const.Perks.PerkDefObjects.Adrenaline
		gt.Const.Perks.PerkDefObjects.Recover
		gt.Const.Perks.PerkDefObjects.Student
	],
	[
		gt.Const.Perks.PerkDefObjects.CoupDeGrace
		gt.Const.Perks.PerkDefObjects.Bullseye
		gt.Const.Perks.PerkDefObjects.Dodge
		gt.Const.Perks.PerkDefObjects.FortifiedMind
		gt.Const.Perks.PerkDefObjects.HoldOut
		gt.Const.Perks.PerkDefObjects.SteelBrow
		gt.Const.Perks.PerkDefObjects.QuickHands
		gt.Const.Perks.PerkDefObjects.Gifted
	],
	[
		gt.Const.Perks.PerkDefObjects.Backstabber
		gt.Const.Perks.PerkDefObjects.Anticipation
		gt.Const.Perks.PerkDefObjects.ShieldExpert
		gt.Const.Perks.PerkDefObjects.Brawny
		gt.Const.Perks.PerkDefObjects.Relentless
		gt.Const.Perks.PerkDefObjects.Rotation
		gt.Const.Perks.PerkDefObjects.RallyTheTroops
		gt.Const.Perks.PerkDefObjects.Taunt
	],
	[
		gt.Const.Perks.PerkDefObjects.SpecMace
		gt.Const.Perks.PerkDefObjects.SpecFlail
		gt.Const.Perks.PerkDefObjects.SpecHammer
		gt.Const.Perks.PerkDefObjects.SpecAxe
		gt.Const.Perks.PerkDefObjects.SpecCleaver
		gt.Const.Perks.PerkDefObjects.SpecSword
		gt.Const.Perks.PerkDefObjects.SpecDagger
		gt.Const.Perks.PerkDefObjects.SpecPolearm
		gt.Const.Perks.PerkDefObjects.SpecSpear
		gt.Const.Perks.PerkDefObjects.SpecCrossbow
		gt.Const.Perks.PerkDefObjects.SpecBow
		gt.Const.Perks.PerkDefObjects.SpecThrowing
	],
	[
		gt.Const.Perks.PerkDefObjects.ReachAdvantage
		gt.Const.Perks.PerkDefObjects.Overwhelm
		gt.Const.Perks.PerkDefObjects.LoneWolf
		gt.Const.Perks.PerkDefObjects.Underdog
		gt.Const.Perks.PerkDefObjects.Footwork
	],
	[
		gt.Const.Perks.PerkDefObjects.Berserk
		gt.Const.Perks.PerkDefObjects.HeadHunter
		gt.Const.Perks.PerkDefObjects.Nimble
		gt.Const.Perks.PerkDefObjects.BattleForged
	],
	[
		gt.Const.Perks.PerkDefObjects.Fearsome
		gt.Const.Perks.PerkDefObjects.Duelist
		gt.Const.Perks.PerkDefObjects.KillingFrenzy
		gt.Const.Perks.PerkDefObjects.Indomitable
	],
	[],
	[],
	[],
	[]
];
gt.Const.Perks.LookupMap <- {};

for( local row = 0; row < this.Const.Perks.Perks.len(); row = ++row )
{
	for( local i = 0; i < this.Const.Perks.Perks[row].len(); i = ++i )
	{
		local perk = this.Const.Perks.Perks[row][i];
		perk.Row <- row;
		perk.Unlocks <- row;
		gt.Const.Perks.LookupMap[perk.ID] <- perk;
	}
}

gt.Const.Perks.findById <- function ( _perkID )
{
	if (_perkID != null && _perkID in this.Const.Perks.LookupMap)
	{
		return this.Const.Perks.LookupMap[_perkID];
	}

	return null;
};