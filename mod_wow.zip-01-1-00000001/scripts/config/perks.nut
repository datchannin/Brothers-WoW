/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.TreesArray <- [];
gt.Const.Perks.PerkTreeVanilla <- [
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

gt.Const.Perks.PerkTreeWarrior <- [
	[
		gt.Const.Perks.PerkDefObjects.DefensiveStance
		gt.Const.Perks.PerkDefObjects.BerserkerStance
		gt.Const.Perks.PerkDefObjects.Colossus
		gt.Const.Perks.PerkDefObjects.NineLives
		gt.Const.Perks.PerkDefObjects.Pathfinder
		gt.Const.Perks.PerkDefObjects.Adrenaline
		gt.Const.Perks.PerkDefObjects.Recover
		gt.Const.Perks.PerkDefObjects.Student
	],
	[
		gt.Const.Perks.PerkDefObjects.Toughness
		gt.Const.Perks.PerkDefObjects.Hardness
		gt.Const.Perks.PerkDefObjects.BattleShout
		gt.Const.Perks.PerkDefObjects.Mobility
		gt.Const.Perks.PerkDefObjects.SteelBrow
		gt.Const.Perks.PerkDefObjects.HoldOut
		gt.Const.Perks.PerkDefObjects.FortifiedMind
		gt.Const.Perks.PerkDefObjects.CoupDeGrace
	],
	[
		gt.Const.Perks.PerkDefObjects.LastStand
		gt.Const.Perks.PerkDefObjects.Gravity
		gt.Const.Perks.PerkDefObjects.BerserkerRage
		gt.Const.Perks.PerkDefObjects.Charge
		gt.Const.Perks.PerkDefObjects.ShieldExpert
		gt.Const.Perks.PerkDefObjects.Brawny
		gt.Const.Perks.PerkDefObjects.Rotation
		gt.Const.Perks.PerkDefObjects.Taunt
	],
	[
		gt.Const.Perks.PerkDefObjects.MasterSpear
		gt.Const.Perks.PerkDefObjects.MasterSword
		gt.Const.Perks.PerkDefObjects.MasterAxe
		gt.Const.Perks.PerkDefObjects.MasterHammer
		gt.Const.Perks.PerkDefObjects.SpecHammer
		gt.Const.Perks.PerkDefObjects.SpecAxe
		gt.Const.Perks.PerkDefObjects.SpecSword
		gt.Const.Perks.PerkDefObjects.SpecSpear
	],
	[
		gt.Const.Perks.PerkDefObjects.ReachAdvantage
		gt.Const.Perks.PerkDefObjects.Overwhelm
		gt.Const.Perks.PerkDefObjects.Underdog
		gt.Const.Perks.PerkDefObjects.Footwork
	],
	[
		gt.Const.Perks.PerkDefObjects.Berserk
		gt.Const.Perks.PerkDefObjects.HeadHunter
		gt.Const.Perks.PerkDefObjects.BattleForged
	],
	[
		gt.Const.Perks.PerkDefObjects.MasterShield
		gt.Const.Perks.PerkDefObjects.BloodThirst
		gt.Const.Perks.PerkDefObjects.KillingFrenzy
		gt.Const.Perks.PerkDefObjects.Indomitable
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.PerkTreeRogue <- [
	[
		gt.Const.Perks.PerkDefObjects.Poison
		gt.Const.Perks.PerkDefObjects.Camouflage
		gt.Const.Perks.PerkDefObjects.FastAdaption
		gt.Const.Perks.PerkDefObjects.CripplingStrikes
		gt.Const.Perks.PerkDefObjects.NineLives
		gt.Const.Perks.PerkDefObjects.Pathfinder
		gt.Const.Perks.PerkDefObjects.Adrenaline
		gt.Const.Perks.PerkDefObjects.Recover
	],
	[
		gt.Const.Perks.PerkDefObjects.VilePoison
		gt.Const.Perks.PerkDefObjects.Endurance
		gt.Const.Perks.PerkDefObjects.ExposeArmor
		gt.Const.Perks.PerkDefObjects.Hemorrhage
		gt.Const.Perks.PerkDefObjects.SteelBrow
		gt.Const.Perks.PerkDefObjects.HoldOut
		gt.Const.Perks.PerkDefObjects.Dodge
		gt.Const.Perks.PerkDefObjects.CoupDeGrace
	],
	[
		gt.Const.Perks.PerkDefObjects.KidneyShot
		gt.Const.Perks.PerkDefObjects.Initiative
		gt.Const.Perks.PerkDefObjects.Kick
		gt.Const.Perks.PerkDefObjects.Disarm
		gt.Const.Perks.PerkDefObjects.Backstabber
		gt.Const.Perks.PerkDefObjects.Anticipation
		gt.Const.Perks.PerkDefObjects.Relentless
		gt.Const.Perks.PerkDefObjects.Rotation
	],
	[
		gt.Const.Perks.PerkDefObjects.MasterDagger
		gt.Const.Perks.PerkDefObjects.MasterSword
		gt.Const.Perks.PerkDefObjects.MasterFlail
		gt.Const.Perks.PerkDefObjects.MasterMace
		gt.Const.Perks.PerkDefObjects.SpecMace
		gt.Const.Perks.PerkDefObjects.SpecFlail
		gt.Const.Perks.PerkDefObjects.SpecSword
		gt.Const.Perks.PerkDefObjects.SpecDagger
	],
	[
		gt.Const.Perks.PerkDefObjects.Overwhelm
		gt.Const.Perks.PerkDefObjects.LoneWolf
		gt.Const.Perks.PerkDefObjects.Underdog
		gt.Const.Perks.PerkDefObjects.Footwork
	],
	[
		gt.Const.Perks.PerkDefObjects.Berserk
		gt.Const.Perks.PerkDefObjects.HeadHunter
		gt.Const.Perks.PerkDefObjects.Nimble
	],
	[
		gt.Const.Perks.PerkDefObjects.Vigor
		gt.Const.Perks.PerkDefObjects.AdrenalineRush
		gt.Const.Perks.PerkDefObjects.Duelist
		gt.Const.Perks.PerkDefObjects.Indomitable
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.PerkTreePaladin <- [
	[
		gt.Const.Perks.PerkDefObjects.HolyLight
		gt.Const.Perks.PerkDefObjects.BlessingofMight
		gt.Const.Perks.PerkDefObjects.CripplingStrikes
		gt.Const.Perks.PerkDefObjects.Colossus
		gt.Const.Perks.PerkDefObjects.Pathfinder
		gt.Const.Perks.PerkDefObjects.Adrenaline
		gt.Const.Perks.PerkDefObjects.Recover
		gt.Const.Perks.PerkDefObjects.Student
	],
	[
		gt.Const.Perks.PerkDefObjects.HolyPower
		gt.Const.Perks.PerkDefObjects.Anticipation_paladin
		gt.Const.Perks.PerkDefObjects.HammerofJustice
		gt.Const.Perks.PerkDefObjects.DivineStrength
		gt.Const.Perks.PerkDefObjects.CoupDeGrace
		gt.Const.Perks.PerkDefObjects.FortifiedMind
		gt.Const.Perks.PerkDefObjects.HoldOut
		gt.Const.Perks.PerkDefObjects.SteelBrow
	],
	[
		gt.Const.Perks.PerkDefObjects.DevoutionAura
		gt.Const.Perks.PerkDefObjects.RetributionAura
		gt.Const.Perks.PerkDefObjects.ConcentrationAura
		gt.Const.Perks.PerkDefObjects.SanctityAura
		gt.Const.Perks.PerkDefObjects.Anticipation
		gt.Const.Perks.PerkDefObjects.ShieldExpert
		gt.Const.Perks.PerkDefObjects.Brawny
		gt.Const.Perks.PerkDefObjects.RallyTheTroops
	],
	[
		gt.Const.Perks.PerkDefObjects.MasterAxe
		gt.Const.Perks.PerkDefObjects.MasterHammer
		gt.Const.Perks.PerkDefObjects.MasterFlail
		gt.Const.Perks.PerkDefObjects.MasterMace
		gt.Const.Perks.PerkDefObjects.SpecMace
		gt.Const.Perks.PerkDefObjects.SpecFlail
		gt.Const.Perks.PerkDefObjects.SpecHammer
		gt.Const.Perks.PerkDefObjects.SpecAxe
	],
	[
		gt.Const.Perks.PerkDefObjects.ReachAdvantage
		gt.Const.Perks.PerkDefObjects.LoneWolf
		gt.Const.Perks.PerkDefObjects.Underdog
		gt.Const.Perks.PerkDefObjects.Footwork
	],
	[
		gt.Const.Perks.PerkDefObjects.Berserk
		gt.Const.Perks.PerkDefObjects.HeadHunter
		gt.Const.Perks.PerkDefObjects.BattleForged
	],
	[
		gt.Const.Perks.PerkDefObjects.DivineShield
		gt.Const.Perks.PerkDefObjects.SealofCommand
		gt.Const.Perks.PerkDefObjects.KillingFrenzy
		gt.Const.Perks.PerkDefObjects.Indomitable
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.PerkTreeHunter <- [
	[
		gt.Const.Perks.PerkDefObjects.BeastMaster
		gt.Const.Perks.PerkDefObjects.HuntersMark
		gt.Const.Perks.PerkDefObjects.FastAdaption
		gt.Const.Perks.PerkDefObjects.CripplingStrikes
		gt.Const.Perks.PerkDefObjects.NineLives
		gt.Const.Perks.PerkDefObjects.BagsAndBelts
		gt.Const.Perks.PerkDefObjects.Pathfinder
		gt.Const.Perks.PerkDefObjects.Recover
	],
	[
		gt.Const.Perks.PerkDefObjects.EnduranceTraining
		gt.Const.Perks.PerkDefObjects.ThickHide
		gt.Const.Perks.PerkDefObjects.Survivalist
		gt.Const.Perks.PerkDefObjects.LightingReflexes
		gt.Const.Perks.PerkDefObjects.CoupDeGrace
		gt.Const.Perks.PerkDefObjects.Bullseye
		gt.Const.Perks.PerkDefObjects.Dodge
		gt.Const.Perks.PerkDefObjects.QuickHands
	],
	[
		gt.Const.Perks.PerkDefObjects.BestialSwiftness
		gt.Const.Perks.PerkDefObjects.UnleashedFury
		gt.Const.Perks.PerkDefObjects.AspectoftheMonkey
		gt.Const.Perks.PerkDefObjects.AspectoftheHawk
		gt.Const.Perks.PerkDefObjects.Anticipation
		gt.Const.Perks.PerkDefObjects.Brawny
		gt.Const.Perks.PerkDefObjects.Relentless
		gt.Const.Perks.PerkDefObjects.Rotation
	],
	[
		gt.Const.Perks.PerkDefObjects.MasterThrowing
		gt.Const.Perks.PerkDefObjects.MasterBow
		gt.Const.Perks.PerkDefObjects.MasterCrossbow
		gt.Const.Perks.PerkDefObjects.MasterDagger
		gt.Const.Perks.PerkDefObjects.SpecDagger
		gt.Const.Perks.PerkDefObjects.SpecCrossbow
		gt.Const.Perks.PerkDefObjects.SpecBow
		gt.Const.Perks.PerkDefObjects.SpecThrowing
	],
	[
		gt.Const.Perks.PerkDefObjects.Overwhelm
		gt.Const.Perks.PerkDefObjects.LoneWolf
		gt.Const.Perks.PerkDefObjects.Underdog
		gt.Const.Perks.PerkDefObjects.Footwork
	],
	[
		gt.Const.Perks.PerkDefObjects.Berserk
		gt.Const.Perks.PerkDefObjects.Nimble
		gt.Const.Perks.PerkDefObjects.BattleForged
	],
	[
		gt.Const.Perks.PerkDefObjects.MendPet
		gt.Const.Perks.PerkDefObjects.LethalShots
		gt.Const.Perks.PerkDefObjects.KillingFrenzy
		gt.Const.Perks.PerkDefObjects.Indomitable
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.PerkTreeMage <- [
	[
		gt.Const.Perks.PerkDefObjects.Fireball
		gt.Const.Perks.PerkDefObjects.Frostbolt
		gt.Const.Perks.PerkDefObjects.Colossus
		gt.Const.Perks.PerkDefObjects.NineLives
		gt.Const.Perks.PerkDefObjects.Pathfinder
		gt.Const.Perks.PerkDefObjects.Adrenaline
		gt.Const.Perks.PerkDefObjects.Recover
		gt.Const.Perks.PerkDefObjects.Student
	],
	[
		gt.Const.Perks.PerkDefObjects.ArcaneIntellect
		gt.Const.Perks.PerkDefObjects.PresenceofMind
		gt.Const.Perks.PerkDefObjects.Evocation
		gt.Const.Perks.PerkDefObjects.ManaShield
		gt.Const.Perks.PerkDefObjects.Dodge
		gt.Const.Perks.PerkDefObjects.FortifiedMind
		gt.Const.Perks.PerkDefObjects.HoldOut
		gt.Const.Perks.PerkDefObjects.SteelBrow
	],
	[
		gt.Const.Perks.PerkDefObjects.BlastWave
		gt.Const.Perks.PerkDefObjects.FireWard
		gt.Const.Perks.PerkDefObjects.ArcticReach
		gt.Const.Perks.PerkDefObjects.FrostArmor
		gt.Const.Perks.PerkDefObjects.ShieldExpert
		gt.Const.Perks.PerkDefObjects.Brawny
		gt.Const.Perks.PerkDefObjects.Rotation
		gt.Const.Perks.PerkDefObjects.RallyTheTroops
	],
	[
		gt.Const.Perks.PerkDefObjects.MasterThrowing
		gt.Const.Perks.PerkDefObjects.MasterPolearm
		gt.Const.Perks.PerkDefObjects.MasterMace
		gt.Const.Perks.PerkDefObjects.MasterDagger
		gt.Const.Perks.PerkDefObjects.SpecDagger
		gt.Const.Perks.PerkDefObjects.SpecMace
		gt.Const.Perks.PerkDefObjects.SpecPolearm
		gt.Const.Perks.PerkDefObjects.SpecThrowing
	],
	[
		gt.Const.Perks.PerkDefObjects.Overwhelm
		gt.Const.Perks.PerkDefObjects.LoneWolf
		gt.Const.Perks.PerkDefObjects.Underdog
		gt.Const.Perks.PerkDefObjects.Footwork
	],
	[
		gt.Const.Perks.PerkDefObjects.Berserk
		gt.Const.Perks.PerkDefObjects.HeadHunter
		gt.Const.Perks.PerkDefObjects.Nimble
	],
	[
		gt.Const.Perks.PerkDefObjects.Ignite
		gt.Const.Perks.PerkDefObjects.WintersChill
		gt.Const.Perks.PerkDefObjects.KillingFrenzy
		gt.Const.Perks.PerkDefObjects.Indomitable
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.TreesArray.push(gt.Const.Perks.PerkTreeVanilla);
gt.Const.Perks.TreesArray.push(gt.Const.Perks.PerkTreeWarrior);
gt.Const.Perks.TreesArray.push(gt.Const.Perks.PerkTreeRogue);
gt.Const.Perks.TreesArray.push(gt.Const.Perks.PerkTreePaladin);
gt.Const.Perks.TreesArray.push(gt.Const.Perks.PerkTreeHunter);
gt.Const.Perks.TreesArray.push(gt.Const.Perks.PerkTreeMage);

gt.Const.Perks.LookupMap <- {};
for (local tree_number = 0; tree_number < this.Const.Perks.TreesArray.len(); tree_number = ++tree_number)
{
	for( local row = 0; row < this.Const.Perks.TreesArray[tree_number].len(); row = ++row )
	{
		for( local colomn = 0; colomn < this.Const.Perks.TreesArray[tree_number][row].len(); colomn = ++colomn )
		{
			local perk = this.Const.Perks.TreesArray[tree_number][row][colomn];
			perk.Row <- row;
			perk.Unlocks <- row;
			if (!(perk.ID in this.Const.Perks.LookupMap))
			{
				gt.Const.Perks.LookupMap[perk.ID] <- perk;
			}
		}
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

gt.Const.Perks.findByBackground <- function ( _perkID, _background )
{
	if (_perkID == null || _background == null)
	{
		return null;
	}

	if (_perkID != null && _perkID in this.Const.Perks.LookupMap)
	{
		return this.Const.Perks.LookupMap[_perkID];
	}

	return null;
};

gt.Const.Perks.getPerksTree <- function ( _background )
{
	switch(_background)
	{
	case "background.raider_warrior":
		return gt.Const.Perks.PerkTreeWarrior;
		break;

	case "background.raider_rogue":
		return gt.Const.Perks.PerkTreeRogue;
		break;

	case "background.raider_paladin":
		return gt.Const.Perks.PerkTreePaladin;
		break;

	case "background.raider_hunter":
		return gt.Const.Perks.PerkTreeHunter;
		break;

	case "background.raider_mage":
		return gt.Const.Perks.PerkTreeMage;
		break;

	default:
		return gt.Const.Perks.PerkTreeVanilla;
	}

	return null;
};
