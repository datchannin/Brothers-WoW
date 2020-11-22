/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.PerkDefObjects <- {};

// ---------------------------------------------|
// ----------------  FIRST LINE  ---------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.FastAdaption <- {
	ID = "perk.fast_adaption",
	Script = "scripts/skills/perks/perk_fast_adaption",
	Name = this.Const.Strings.PerkName.FastAdaption,
	Tooltip = this.Const.Strings.PerkDescription.FastAdaption,
	Icon = "ui/perks/perk_33.png",
	IconDisabled = "ui/perks/perk_33_sw.png",
	Const = "FastAdaption"
}

gt.Const.Perks.PerkDefObjects.CripplingStrikes <- {
	ID = "perk.crippling_strikes",
	Script = "scripts/skills/perks/perk_crippling_strikes",
	Name = this.Const.Strings.PerkName.CripplingStrikes,
	Tooltip = this.Const.Strings.PerkDescription.CripplingStrikes,
	Icon = "ui/perks/perk_57.png",
	IconDisabled = "ui/perks/perk_57_sw.png",
	Const = "CripplingStrikes"
}

gt.Const.Perks.PerkDefObjects.Colossus <- {
	ID = "perk.colossus",
	Script = "scripts/skills/perks/perk_colossus",
	Name = this.Const.Strings.PerkName.Colossus,
	Tooltip = this.Const.Strings.PerkDescription.Colossus,
	Icon = "ui/perks/perk_06.png",
	IconDisabled = "ui/perks/perk_06_sw.png",
	Const = "Colossus"
}

gt.Const.Perks.PerkDefObjects.NineLives <- {
	ID = "perk.nine_lives",
	Script = "scripts/skills/perks/perk_nine_lives",
	Name = this.Const.Strings.PerkName.NineLives,
	Tooltip = this.Const.Strings.PerkDescription.NineLives,
	Icon = "ui/perks/perk_07.png",
	IconDisabled = "ui/perks/perk_07_sw.png",
	Const = "NineLives"
}

gt.Const.Perks.PerkDefObjects.BagsAndBelts <- {
	ID = "perk.bags_and_belts",
	Script = "scripts/skills/perks/perk_bags_and_belts",
	Name = this.Const.Strings.PerkName.BagsAndBelts,
	Tooltip = this.Const.Strings.PerkDescription.BagsAndBelts,
	Icon = "ui/perks/perk_20.png",
	IconDisabled = "ui/perks/perk_20_sw.png",
	Const = "BagsAndBelts"
}

gt.Const.Perks.PerkDefObjects.Pathfinder <- {
	ID = "perk.pathfinder",
	Script = "scripts/skills/perks/perk_pathfinder",
	Name = this.Const.Strings.PerkName.Pathfinder,
	Tooltip = this.Const.Strings.PerkDescription.Pathfinder,
	Icon = "ui/perks/perk_23.png",
	IconDisabled = "ui/perks/perk_23_sw.png",
	Const = "Pathfinder"
}

gt.Const.Perks.PerkDefObjects.Adrenaline <- {
	ID = "perk.adrenaline",
	Script = "scripts/skills/perks/perk_adrenalin",
	Name = this.Const.Strings.PerkName.Adrenaline,
	Tooltip = this.Const.Strings.PerkDescription.Adrenaline,
	Icon = "ui/perks/perk_37.png",
	IconDisabled = "ui/perks/perk_37_sw.png",
	Const = "Adrenaline"
}

gt.Const.Perks.PerkDefObjects.Recover <- {
	ID = "perk.recover",
	Script = "scripts/skills/perks/perk_recover",
	Name = this.Const.Strings.PerkName.Recover,
	Tooltip = this.Const.Strings.PerkDescription.Recover,
	Icon = "ui/perks/perk_54.png",
	IconDisabled = "ui/perks/perk_54_sw.png",
	Const = "Recover"
}

gt.Const.Perks.PerkDefObjects.Student <- {
	ID = "perk.student",
	Script = "scripts/skills/perks/perk_student",
	Name = this.Const.Strings.PerkName.Student,
	Tooltip = this.Const.Strings.PerkDescription.Student,
	Icon = "ui/perks/perk_21.png",
	IconDisabled = "ui/perks/perk_21_sw.png",
	Const = "Student"
}

// ---------------------------------------------|
// ----------------  SECOND LINE  --------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.CoupDeGrace <- {
	ID = "perk.coup_de_grace",
	Script = "scripts/skills/perks/perk_coup_de_grace",
	Name = this.Const.Strings.PerkName.CoupDeGrace,
	Tooltip = this.Const.Strings.PerkDescription.CoupDeGrace,
	Icon = "ui/perks/perk_16.png",
	IconDisabled = "ui/perks/perk_16_sw.png",
	Const = "CoupDeGrace"
}

gt.Const.Perks.PerkDefObjects.Bullseye <- {
	ID = "perk.bullseye",
	Script = "scripts/skills/perks/perk_bullseye",
	Name = this.Const.Strings.PerkName.Bullseye,
	Tooltip = this.Const.Strings.PerkDescription.Bullseye,
	Icon = "ui/perks/perk_17.png",
	IconDisabled = "ui/perks/perk_17_sw.png",
	Const = "Bullseye"
}

gt.Const.Perks.PerkDefObjects.Dodge <- {
	ID = "perk.dodge",
	Script = "scripts/skills/perks/perk_dodge",
	Name = this.Const.Strings.PerkName.Dodge,
	Tooltip = this.Const.Strings.PerkDescription.Dodge,
	Icon = "ui/perks/perk_01.png",
	IconDisabled = "ui/perks/perk_01_sw.png",
	Const = "Dodge"
}

gt.Const.Perks.PerkDefObjects.FortifiedMind <- {
	ID = "perk.fortified_mind",
	Script = "scripts/skills/perks/perk_fortified_mind",
	Name = this.Const.Strings.PerkName.FortifiedMind,
	Tooltip = this.Const.Strings.PerkDescription.FortifiedMind,
	Icon = "ui/perks/perk_08.png",
	IconDisabled = "ui/perks/perk_08_sw.png",
	Const = "FortifiedMind"
}

gt.Const.Perks.PerkDefObjects.HoldOut <- {
	ID = "perk.hold_out",
	Script = "scripts/skills/perks/perk_hold_out",
	Name = this.Const.Strings.PerkName.HoldOut,
	Tooltip = this.Const.Strings.PerkDescription.HoldOut,
	Icon = "ui/perks/perk_04.png",
	IconDisabled = "ui/perks/perk_04_sw.png",
	Const = "HoldOut"
}

gt.Const.Perks.PerkDefObjects.SteelBrow <- {
	ID = "perk.steel_brow",
	Script = "scripts/skills/perks/perk_steel_brow",
	Name = this.Const.Strings.PerkName.SteelBrow,
	Tooltip = this.Const.Strings.PerkDescription.SteelBrow,
	Icon = "ui/perks/perk_09.png",
	IconDisabled = "ui/perks/perk_09_sw.png",
	Const = "SteelBrow"
}

gt.Const.Perks.PerkDefObjects.QuickHands <- {
	ID = "perk.quick_hands",
	Script = "scripts/skills/perks/perk_quick_hands",
	Name = this.Const.Strings.PerkName.QuickHands,
	Tooltip = this.Const.Strings.PerkDescription.QuickHands,
	Icon = "ui/perks/perk_39.png",
	IconDisabled = "ui/perks/perk_39_sw.png",
	Const = "QuickHands"
}

gt.Const.Perks.PerkDefObjects.Gifted <- {
	ID = "perk.gifted",
	Script = "scripts/skills/perks/perk_gifted",
	Name = this.Const.Strings.PerkName.Gifted,
	Tooltip = this.Const.Strings.PerkDescription.Gifted,
	Icon = "ui/perks/perk_56.png",
	IconDisabled = "ui/perks/perk_56_sw.png",
	Const = "Gifted"
}

// ---------------------------------------------|
// ----------------  THIRD LINE  ---------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.Backstabber <- {
	ID = "perk.backstabber",
	Script = "scripts/skills/perks/perk_backstabber",
	Name = this.Const.Strings.PerkName.Backstabber,
	Tooltip = this.Const.Strings.PerkDescription.Backstabber,
	Icon = "ui/perks/perk_59.png",
	IconDisabled = "ui/perks/perk_59_sw.png",
	Const = "Backstabber"
}

gt.Const.Perks.PerkDefObjects.Anticipation <- {
	ID = "perk.anticipation",
	Script = "scripts/skills/perks/perk_anticipation",
	Name = this.Const.Strings.PerkName.Anticipation,
	Tooltip = this.Const.Strings.PerkDescription.Anticipation,
	Icon = "ui/perks/perk_10.png",
	IconDisabled = "ui/perks/perk_10_sw.png",
	Const = "Anticipation"
}

gt.Const.Perks.PerkDefObjects.ShieldExpert <- {
	ID = "perk.shield_expert",
	Script = "scripts/skills/perks/perk_shield_expert",
	Name = this.Const.Strings.PerkName.ShieldExpert,
	Tooltip = this.Const.Strings.PerkDescription.ShieldExpert,
	Icon = "ui/perks/perk_05.png",
	IconDisabled = "ui/perks/perk_05_sw.png",
	Const = "ShieldExpert"
}

gt.Const.Perks.PerkDefObjects.Brawny <- {
	ID = "perk.brawny",
	Script = "scripts/skills/perks/perk_brawny",
	Name = this.Const.Strings.PerkName.Brawny,
	Tooltip = this.Const.Strings.PerkDescription.Brawny,
	Icon = "ui/perks/perk_40.png",
	IconDisabled = "ui/perks/perk_40_sw.png",
	Const = "Brawny"
}

gt.Const.Perks.PerkDefObjects.Relentless <- {
	ID = "perk.relentless",
	Script = "scripts/skills/perks/perk_relentless",
	Name = this.Const.Strings.PerkName.Relentless,
	Tooltip = this.Const.Strings.PerkDescription.Relentless,
	Icon = "ui/perks/perk_26.png",
	IconDisabled = "ui/perks/perk_26_sw.png",
	Const = "Relentless"
}

gt.Const.Perks.PerkDefObjects.Rotation <- {
	ID = "perk.rotation",
	Script = "scripts/skills/perks/perk_rotation",
	Name = this.Const.Strings.PerkName.Rotation,
	Tooltip = this.Const.Strings.PerkDescription.Rotation,
	Icon = "ui/perks/perk_11.png",
	IconDisabled = "ui/perks/perk_11_sw.png",
	Const = "Rotation"
}

gt.Const.Perks.PerkDefObjects.RallyTheTroops <- {
	ID = "perk.rally_the_troops",
	Script = "scripts/skills/perks/perk_rally_the_troops",
	Name = this.Const.Strings.PerkName.RallyTheTroops,
	Tooltip = this.Const.Strings.PerkDescription.RallyTheTroops,
	Icon = "ui/perks/perk_42.png",
	IconDisabled = "ui/perks/perk_42_sw.png",
	Const = "RallyTheTroops"
}

gt.Const.Perks.PerkDefObjects.Taunt <- {
	ID = "perk.taunt",
	Script = "scripts/skills/perks/perk_taunt",
	Name = this.Const.Strings.PerkName.Taunt,
	Tooltip = this.Const.Strings.PerkDescription.Taunt,
	Icon = "ui/perks/perk_38.png",
	IconDisabled = "ui/perks/perk_38_sw.png",
	Const = "Taunt"
}

// ---------------------------------------------|
// ----------------  FOURTH LINE  --------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.SpecMace <- {
	ID = "perk.mastery.mace",
	Script = "scripts/skills/perks/perk_mastery_mace",
	Name = this.Const.Strings.PerkName.SpecMace,
	Tooltip = this.Const.Strings.PerkDescription.SpecMace,
	Icon = "ui/perks/perk_43.png",
	IconDisabled = "ui/perks/perk_43_sw.png"
	Const = "SpecMace"
}

gt.Const.Perks.PerkDefObjects.SpecFlail <- {
	ID = "perk.mastery.flail",
	Script = "scripts/skills/perks/perk_mastery_flail",
	Name = this.Const.Strings.PerkName.SpecFlail,
	Tooltip = this.Const.Strings.PerkDescription.SpecFlail,
	Icon = "ui/perks/perk_47.png",
	IconDisabled = "ui/perks/perk_47_sw.png"
	Const = "SpecFlail"
}

gt.Const.Perks.PerkDefObjects.SpecHammer <- {
	ID = "perk.mastery.hammer",
	Script = "scripts/skills/perks/perk_mastery_hammer",
	Name = this.Const.Strings.PerkName.SpecHammer,
	Tooltip = this.Const.Strings.PerkDescription.SpecHammer,
	Icon = "ui/perks/perk_53.png",
	IconDisabled = "ui/perks/perk_53_sw.png"
	Const = "SpecHammer"
}

gt.Const.Perks.PerkDefObjects.SpecAxe <- {
	ID = "perk.mastery.axe",
	Script = "scripts/skills/perks/perk_mastery_axe",
	Name = this.Const.Strings.PerkName.SpecAxe,
	Tooltip = this.Const.Strings.PerkDescription.SpecAxe,
	Icon = "ui/perks/perk_44.png",
	IconDisabled = "ui/perks/perk_44_sw.png"
	Const = "SpecAxe"
}

gt.Const.Perks.PerkDefObjects.SpecCleaver <- {
	ID = "perk.mastery.cleaver",
	Script = "scripts/skills/perks/perk_mastery_cleaver",
	Name = this.Const.Strings.PerkName.SpecCleaver,
	Tooltip = this.Const.Strings.PerkDescription.SpecCleaver,
	Icon = "ui/perks/perk_52.png",
	IconDisabled = "ui/perks/perk_52_sw.png"
	Const = "SpecCleaver"
}

gt.Const.Perks.PerkDefObjects.SpecSword <- {
	ID = "perk.mastery.sword",
	Script = "scripts/skills/perks/perk_mastery_sword",
	Name = this.Const.Strings.PerkName.SpecSword,
	Tooltip = this.Const.Strings.PerkDescription.SpecSword,
	Icon = "ui/perks/perk_46.png",
	IconDisabled = "ui/perks/perk_46_sw.png"
	Const = "SpecSword"
}

gt.Const.Perks.PerkDefObjects.SpecDagger <- {
	ID = "perk.mastery.dagger",
	Script = "scripts/skills/perks/perk_mastery_dagger",
	Name = this.Const.Strings.PerkName.SpecDagger,
	Tooltip = this.Const.Strings.PerkDescription.SpecDagger,
	Icon = "ui/perks/perk_51.png",
	IconDisabled = "ui/perks/perk_51_sw.png"
	Const = "SpecDagger"
}

gt.Const.Perks.PerkDefObjects.SpecPolearm <- {
	ID = "perk.mastery.polearm",
	Script = "scripts/skills/perks/perk_mastery_polearm",
	Name = this.Const.Strings.PerkName.SpecPolearm,
	Tooltip = this.Const.Strings.PerkDescription.SpecPolearm,
	Icon = "ui/perks/perk_58.png",
	IconDisabled = "ui/perks/perk_58_sw.png"
	Const = "SpecPolearm"
}

gt.Const.Perks.PerkDefObjects.SpecSpear <- {
	ID = "perk.mastery.spear",
	Script = "scripts/skills/perks/perk_mastery_spear",
	Name = this.Const.Strings.PerkName.SpecSpear,
	Tooltip = this.Const.Strings.PerkDescription.SpecSpear,
	Icon = "ui/perks/perk_45.png",
	IconDisabled = "ui/perks/perk_45_sw.png"
	Const = "SpecSpear"
}

gt.Const.Perks.PerkDefObjects.SpecCrossbow <- {
	ID = "perk.mastery.crossbow",
	Script = "scripts/skills/perks/perk_mastery_crossbow",
	Name = this.Const.Strings.PerkName.SpecCrossbow,
	Tooltip = this.Const.Strings.PerkDescription.SpecCrossbow,
	Icon = "ui/perks/perk_48.png",
	IconDisabled = "ui/perks/perk_48_sw.png"
	Const = "SpecCrossbow"
}

gt.Const.Perks.PerkDefObjects.SpecBow <- {
	ID = "perk.mastery.bow",
	Script = "scripts/skills/perks/perk_mastery_bow",
	Name = this.Const.Strings.PerkName.SpecBow,
	Tooltip = this.Const.Strings.PerkDescription.SpecBow,
	Icon = "ui/perks/perk_49.png",
	IconDisabled = "ui/perks/perk_49_sw.png"
	Const = "SpecBow"
}

gt.Const.Perks.PerkDefObjects.SpecThrowing <- {
	ID = "perk.mastery.throwing",
	Script = "scripts/skills/perks/perk_mastery_throwing",
	Name = this.Const.Strings.PerkName.SpecThrowing,
	Tooltip = this.Const.Strings.PerkDescription.SpecThrowing,
	Icon = "ui/perks/perk_50.png",
	IconDisabled = "ui/perks/perk_50_sw.png"
	Const = "SpecThrowing"
}

// ---------------------------------------------|
// ----------------  FIFTH LINE  ---------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.ReachAdvantage <- {
	ID = "perk.reach_advantage",
	Script = "scripts/skills/perks/perk_reach_advantage",
	Name = this.Const.Strings.PerkName.ReachAdvantage,
	Tooltip = this.Const.Strings.PerkDescription.ReachAdvantage,
	Icon = "ui/perks/perk_19.png",
	IconDisabled = "ui/perks/perk_19_sw.png",
	Const = "ReachAdvantage"
}

gt.Const.Perks.PerkDefObjects.Overwhelm <- {
	ID = "perk.overwhelm",
	Script = "scripts/skills/perks/perk_overwhelm",
	Name = this.Const.Strings.PerkName.Overwhelm,
	Tooltip = this.Const.Strings.PerkDescription.Overwhelm,
	Icon = "ui/perks/perk_62.png",
	IconDisabled = "ui/perks/perk_62_sw.png",
	Const = "Overwhelm"
}

gt.Const.Perks.PerkDefObjects.LoneWolf <- {
	ID = "perk.lone_wolf",
	Script = "scripts/skills/perks/perk_lone_wolf",
	Name = this.Const.Strings.PerkName.LoneWolf,
	Tooltip = this.Const.Strings.PerkDescription.LoneWolf,
	Icon = "ui/perks/perk_61.png",
	IconDisabled = "ui/perks/perk_61_sw.png",
	Const = "LoneWolf"
}

gt.Const.Perks.PerkDefObjects.Underdog <- {
	ID = "perk.underdog",
	Script = "scripts/skills/perks/perk_underdog",
	Name = this.Const.Strings.PerkName.Underdog,
	Tooltip = this.Const.Strings.PerkDescription.Underdog,
	Icon = "ui/perks/perk_60.png",
	IconDisabled = "ui/perks/perk_60_sw.png",
	Const = "Underdog"
}

gt.Const.Perks.PerkDefObjects.Footwork <- {
	ID = "perk.footwork",
	Script = "scripts/skills/perks/perk_footwork",
	Name = this.Const.Strings.PerkName.Footwork,
	Tooltip = this.Const.Strings.PerkDescription.Footwork,
	Icon = "ui/perks/perk_25.png",
	IconDisabled = "ui/perks/perk_25_sw.png",
	Const = "Footwork"
}

// ---------------------------------------------|
// ----------------  SIXTH LINE -- -------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.Berserk <- {
	ID = "perk.berserk",
	Script = "scripts/skills/perks/perk_berserk",
	Name = this.Const.Strings.PerkName.Berserk,
	Tooltip = this.Const.Strings.PerkDescription.Berserk,
	Icon = "ui/perks/perk_35.png",
	IconDisabled = "ui/perks/perk_35_sw.png",
	Const = "Berserk"
}

gt.Const.Perks.PerkDefObjects.HeadHunter <- {
	ID = "perk.head_hunter",
	Script = "scripts/skills/perks/perk_head_hunter",
	Name = this.Const.Strings.PerkName.HeadHunter,
	Tooltip = this.Const.Strings.PerkDescription.HeadHunter,
	Icon = "ui/perks/perk_15.png",
	IconDisabled = "ui/perks/perk_15_sw.png",
	Const = "HeadHunter"
}

gt.Const.Perks.PerkDefObjects.Nimble <- {
	ID = "perk.nimble",
	Script = "scripts/skills/perks/perk_nimble",
	Name = this.Const.Strings.PerkName.Nimble,
	Tooltip = this.Const.Strings.PerkDescription.Nimble,
	Icon = "ui/perks/perk_29.png",
	IconDisabled = "ui/perks/perk_29_sw.png",
	Const = "Nimble"
}

gt.Const.Perks.PerkDefObjects.BattleForged <- {
	ID = "perk.battle_forged",
	Script = "scripts/skills/perks/perk_battle_forged",
	Name = this.Const.Strings.PerkName.BattleForged,
	Tooltip = this.Const.Strings.PerkDescription.BattleForged,
	Icon = "ui/perks/perk_03.png",
	IconDisabled = "ui/perks/perk_03_sw.png",
	Const = "BattleForged"
}

// ---------------------------------------------|
// ----------------  SEVENTH LINE  -------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.Fearsome <- {
	ID = "perk.fearsome",
	Script = "scripts/skills/perks/perk_fearsome",
	Name = this.Const.Strings.PerkName.Fearsome,
	Tooltip = this.Const.Strings.PerkDescription.Fearsome,
	Icon = "ui/perks/perk_27.png",
	IconDisabled = "ui/perks/perk_27_sw.png",
	Const = "Fearsome"
}

gt.Const.Perks.PerkDefObjects.Duelist <- {
	ID = "perk.duelist",
	Script = "scripts/skills/perks/perk_duelist",
	Name = this.Const.Strings.PerkName.Duelist,
	Tooltip = this.Const.Strings.PerkDescription.Duelist,
	Icon = "ui/perks/perk_41.png",
	IconDisabled = "ui/perks/perk_41_sw.png",
	Const = "Duelist"
}

gt.Const.Perks.PerkDefObjects.KillingFrenzy <- {
	ID = "perk.killing_frenzy",
	Script = "scripts/skills/perks/perk_killing_frenzy",
	Name = this.Const.Strings.PerkName.KillingFrenzy,
	Tooltip = this.Const.Strings.PerkDescription.KillingFrenzy,
	Icon = "ui/perks/perk_36.png",
	IconDisabled = "ui/perks/perk_36_sw.png",
	Const = "KillingFrenzy"
}

gt.Const.Perks.PerkDefObjects.Indomitable <- {
	ID = "perk.indomitable",
	Script = "scripts/skills/perks/perk_indomitable",
	Name = this.Const.Strings.PerkName.Indomitable,
	Tooltip = this.Const.Strings.PerkDescription.Indomitable,
	Icon = "ui/perks/perk_30.png",
	IconDisabled = "ui/perks/perk_30_sw.png",
	Const = "Indomitable"
}

// ---------------------------------------------|
// -----------  WOW START PERKS DEFINITION -----|
// ---------------------------------------------|

// ---------------------------------------------|
// ----------------  WOW GAMEDEV ---------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.GameDev <- {
	ID = "perk.wow.gamedev.gamedev",
	Script = "scripts/skills/perks/perk_wow_gamedev",
	Name = this.Const.Wow_strings.PerkName.GameDev,
	Tooltip = this.Const.Wow_strings.PerkDescription.GameDev,
	Icon = "ui/perks/perk_gamedev1.png",
	IconDisabled = "ui/perks/perk_gamedev1_sw.png",
	Const = "GameDev"
}

// ---------------------------------------------|
// ----------------  WOW WARRIOR ---------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.DefensiveStance <- {
	ID = "perk.wow.warrior.defensive_stance",
	Script = "scripts/skills/perks/perk_wow_defensive_stance",
	Name = this.Const.Wow_strings.PerkName.DefensiveStance,
	Tooltip = this.Const.Wow_strings.PerkDescription.DefensiveStance,
	Icon = "ui/perks/perk_warrior_defensivestance.png",
	IconDisabled = "ui/perks/perk_warrior_defensivestance_sw.png",
	Const = "DefensiveStance"
}

gt.Const.Perks.PerkDefObjects.BerserkerStance <- {
	ID = "perk.wow.warrior.berserker_stance",
	Script = "scripts/skills/perks/perk_wow_berserker_stance",
	Name = this.Const.Wow_strings.PerkName.BerserkerStance,
	Tooltip = this.Const.Wow_strings.PerkDescription.BerserkerStance,
	Icon = "ui/perks/perk_warrior_berserkerstance.png",
	IconDisabled = "ui/perks/perk_warrior_berserkerstance_sw.png",
	Const = "BerserkerStance"
}

gt.Const.Perks.PerkDefObjects.Toughness <- {
	ID = "perk.wow.warrior.toughness",
	Script = "scripts/skills/perks/perk_wow_toughness",
	Name = this.Const.Wow_strings.PerkName.Toughness,
	Tooltip = this.Const.Wow_strings.PerkDescription.Toughness,
	Icon = "ui/perks/perk_warrior_toughness.png",
	IconDisabled = "ui/perks/perk_warrior_toughness_sw.png",
	Const = "Toughness"
}

gt.Const.Perks.PerkDefObjects.Hardness <- {
	ID = "perk.wow.warrior.hardness",
	Script = "scripts/skills/perks/perk_wow_hardness",
	Name = this.Const.Wow_strings.PerkName.Hardness,
	Tooltip = this.Const.Wow_strings.PerkDescription.Hardness,
	Icon = "ui/perks/perk_warrior_hardness.png",
	IconDisabled = "ui/perks/perk_warrior_hardness_sw.png",
	Const = "Hardness"
}

gt.Const.Perks.PerkDefObjects.BattleShout <- {
	ID = "perk.wow.warrior.battle_shout",
	Script = "scripts/skills/perks/perk_wow_battle_shout",
	Name = this.Const.Wow_strings.PerkName.BattleShout,
	Tooltip = this.Const.Wow_strings.PerkDescription.BattleShout,
	Icon = "ui/perks/perk_warrior_battleshout.png",
	IconDisabled = "ui/perks/perk_warrior_battleshout_sw.png",
	Const = "BattleShout"
}

gt.Const.Perks.PerkDefObjects.Mobility <- {
	ID = "perk.wow.warrior.mobility",
	Script = "scripts/skills/perks/perk_wow_mobility",
	Name = this.Const.Wow_strings.PerkName.Mobility,
	Tooltip = this.Const.Wow_strings.PerkDescription.Mobility,
	Icon = "ui/perks/perk_warrior_mobility.png",
	IconDisabled = "ui/perks/perk_warrior_mobility_sw.png",
	Const = "Mobility"
}

gt.Const.Perks.PerkDefObjects.LastStand <- {
	ID = "perk.wow.warrior.last_stand",
	Script = "scripts/skills/perks/perk_wow_last_stand",
	Name = this.Const.Wow_strings.PerkName.LastStand,
	Tooltip = this.Const.Wow_strings.PerkDescription.LastStand,
	Icon = "ui/perks/perk_warrior_laststand.png",
	IconDisabled = "ui/perks/perk_warrior_laststand_sw.png",
	Const = "LastStand"
}

gt.Const.Perks.PerkDefObjects.Gravity <- {
	ID = "perk.wow.warrior.gravity",
	Script = "scripts/skills/perks/perk_wow_gravity",
	Name = this.Const.Wow_strings.PerkName.Gravity,
	Tooltip = this.Const.Wow_strings.PerkDescription.Gravity,
	Icon = "ui/perks/perk_warrior_gravity.png",
	IconDisabled = "ui/perks/perk_warrior_gravity_sw.png",
	Const = "Gravity"
}

gt.Const.Perks.PerkDefObjects.BerserkerRage <- {
	ID = "perk.wow.warrior.berserker_rage",
	Script = "scripts/skills/perks/perk_wow_berserker_rage",
	Name = this.Const.Wow_strings.PerkName.BerserkerRage,
	Tooltip = this.Const.Wow_strings.PerkDescription.BerserkerRage,
	Icon = "ui/perks/perk_warrior_berserkerrage.png",
	IconDisabled = "ui/perks/perk_warrior_berserkerrage_sw.png",
	Const = "BerserkerRage"
}

gt.Const.Perks.PerkDefObjects.Charge <- {
	ID = "perk.wow.warrior.charge",
	Script = "scripts/skills/perks/perk_wow_charge",
	Name = this.Const.Wow_strings.PerkName.Charge,
	Tooltip = this.Const.Wow_strings.PerkDescription.Charge,
	Icon = "ui/perks/perk_warrior_charge.png",
	IconDisabled = "ui/perks/perk_warrior_charge_sw.png",
	Const = "Charge"
}

gt.Const.Perks.PerkDefObjects.MasterSpear <- {
	ID = "perk.wow.warrior.masterspear",
	Script = "scripts/skills/perks/perk_wow_masterspear",
	Name = this.Const.Wow_strings.PerkName.MasterSpear,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterSpear,
	Icon = "ui/perks/perk_warrior_masterspear.png",
	IconDisabled = "ui/perks/perk_warrior_masterspear_sw.png",
	Const = "MasterSpear"
}

gt.Const.Perks.PerkDefObjects.MasterSword <- {
	ID = "perk.wow.warrior.mastersword",
	Script = "scripts/skills/perks/perk_wow_mastersword",
	Name = this.Const.Wow_strings.PerkName.MasterSword,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterSword,
	Icon = "ui/perks/perk_warrior_mastersword.png",
	IconDisabled = "ui/perks/perk_warrior_mastersword_sw.png",
	Const = "MasterSword"
}

gt.Const.Perks.PerkDefObjects.MasterAxe <- {
	ID = "perk.wow.warrior.masteraxe",
	Script = "scripts/skills/perks/perk_wow_masteraxe",
	Name = this.Const.Wow_strings.PerkName.MasterAxe,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterAxe,
	Icon = "ui/perks/perk_warrior_masteraxe.png",
	IconDisabled = "ui/perks/perk_warrior_masteraxe_sw.png",
	Const = "MasterAxe"
}

gt.Const.Perks.PerkDefObjects.MasterHammer <- {
	ID = "perk.wow.warrior.masterhammer",
	Script = "scripts/skills/perks/perk_wow_masterhammer",
	Name = this.Const.Wow_strings.PerkName.MasterHammer,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterHammer,
	Icon = "ui/perks/perk_warrior_masterhammer.png",
	IconDisabled = "ui/perks/perk_warrior_masterhammer_sw.png",
	Const = "MasterHammer"
}

gt.Const.Perks.PerkDefObjects.MasterShield <- {
	ID = "perk.wow.warrior.mastershield",
	Script = "scripts/skills/perks/perk_wow_mastershield",
	Name = this.Const.Wow_strings.PerkName.MasterShield,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterShield,
	Icon = "ui/perks/perk_warrior_mastershield.png",
	IconDisabled = "ui/perks/perk_warrior_mastershield_sw.png",
	Const = "MasterShield"
}

gt.Const.Perks.PerkDefObjects.BloodThirst <- {
	ID = "perk.wow.warrior.blood_thirst",
	Script = "scripts/skills/perks/perk_wow_blood_thirst",
	Name = this.Const.Wow_strings.PerkName.BloodThirst,
	Tooltip = this.Const.Wow_strings.PerkDescription.BloodThirst,
	Icon = "ui/perks/perk_warrior_bloodthirst.png",
	IconDisabled = "ui/perks/perk_warrior_bloodthirst_sw.png",
	Const = "BloodThirst"
}

// ---------------------------------------------|
// ----------------  WOW ROGUE -----------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.Poison <- {
	ID = "perk.wow.rogue.poison",
	Script = "scripts/skills/perks/perk_wow_poison",
	Name = this.Const.Wow_strings.PerkName.Poison,
	Tooltip = this.Const.Wow_strings.PerkDescription.Poison,
	Icon = "ui/perks/perk_rogue_poison.png",
	IconDisabled = "ui/perks/perk_rogue_poison_sw.png",
	Const = "Poison"
}

gt.Const.Perks.PerkDefObjects.Camouflage <- {
	ID = "perk.wow.rogue.camouflage",
	Script = "scripts/skills/perks/perk_wow_camouflage",
	Name = this.Const.Wow_strings.PerkName.Camouflage,
	Tooltip = this.Const.Wow_strings.PerkDescription.Camouflage,
	Icon = "ui/perks/perk_rogue_camouflage.png",
	IconDisabled = "ui/perks/perk_rogue_camouflage_sw.png",
	Const = "Camouflage"
}

gt.Const.Perks.PerkDefObjects.Endurance <- {
	ID = "perk.wow.rogue.endurance",
	Script = "scripts/skills/perks/perk_wow_endurance",
	Name = this.Const.Wow_strings.PerkName.Endurance,
	Tooltip = this.Const.Wow_strings.PerkDescription.Endurance,
	Icon = "ui/perks/perk_rogue_endurance.png",
	IconDisabled = "ui/perks/perk_rogue_endurance_sw.png",
	Const = "Endurance"
}

gt.Const.Perks.PerkDefObjects.VilePoison <- {
	ID = "perk.wow.rogue.vilepoison",
	Script = "scripts/skills/perks/perk_wow_vilepoison",
	Name = this.Const.Wow_strings.PerkName.VilePoison,
	Tooltip = this.Const.Wow_strings.PerkDescription.VilePoison,
	Icon = "ui/perks/perk_rogue_vilepoison.png",
	IconDisabled = "ui/perks/perk_rogue_vilepoison_sw.png",
	Const = "VilePoison"
}

gt.Const.Perks.PerkDefObjects.ExposeArmor <- {
	ID = "perk.wow.rogue.exposearmor",
	Script = "scripts/skills/perks/perk_wow_exposearmor",
	Name = this.Const.Wow_strings.PerkName.ExposeArmor,
	Tooltip = this.Const.Wow_strings.PerkDescription.ExposeArmor,
	Icon = "ui/perks/perk_rogue_exposearmor.png",
	IconDisabled = "ui/perks/perk_rogue_exposearmor_sw.png",
	Const = "ExposeArmor"
}

gt.Const.Perks.PerkDefObjects.Hemorrhage <- {
	ID = "perk.wow.rogue.hemorrhage",
	Script = "scripts/skills/perks/perk_wow_hemorrhage",
	Name = this.Const.Wow_strings.PerkName.Hemorrhage,
	Tooltip = this.Const.Wow_strings.PerkDescription.Hemorrhage,
	Icon = "ui/perks/perk_rogue_hemorrhage.png",
	IconDisabled = "ui/perks/perk_rogue_hemorrhage_sw.png",
	Const = "Hemorrhage"
}

gt.Const.Perks.PerkDefObjects.KidneyShot <- {
	ID = "perk.wow.rogue.kidneyshot",
	Script = "scripts/skills/perks/perk_wow_kidneyshot",
	Name = this.Const.Wow_strings.PerkName.KidneyShot,
	Tooltip = this.Const.Wow_strings.PerkDescription.KidneyShot,
	Icon = "ui/perks/perk_rogue_kidneyshot.png",
	IconDisabled = "ui/perks/perk_rogue_kidneyshot_sw.png",
	Const = "KidneyShot"
}

gt.Const.Perks.PerkDefObjects.Initiative <- {
	ID = "perk.wow.rogue.initiative",
	Script = "scripts/skills/perks/perk_wow_initiative",
	Name = this.Const.Wow_strings.PerkName.Initiative,
	Tooltip = this.Const.Wow_strings.PerkDescription.Initiative,
	Icon = "ui/perks/perk_rogue_initiative.png",
	IconDisabled = "ui/perks/perk_rogue_initiative_sw.png",
	Const = "Initiative"
}

gt.Const.Perks.PerkDefObjects.Kick <- {
	ID = "perk.wow.rogue.kick",
	Script = "scripts/skills/perks/perk_wow_kick",
	Name = this.Const.Wow_strings.PerkName.Kick,
	Tooltip = this.Const.Wow_strings.PerkDescription.Kick,
	Icon = "ui/perks/perk_rogue_kick.png",
	IconDisabled = "ui/perks/perk_rogue_kick_sw.png",
	Const = "Kick"
}

gt.Const.Perks.PerkDefObjects.Disarm <- {
	ID = "perk.wow.rogue.disarm",
	Script = "scripts/skills/perks/perk_wow_disarm",
	Name = this.Const.Wow_strings.PerkName.Disarm,
	Tooltip = this.Const.Wow_strings.PerkDescription.Disarm,
	Icon = "ui/perks/perk_rogue_disarm.png",
	IconDisabled = "ui/perks/perk_rogue_disarm_sw.png",
	Const = "Disarm"
}

gt.Const.Perks.PerkDefObjects.MasterDagger <- {
	ID = "perk.wow.rogue.masterdagger",
	Script = "scripts/skills/perks/perk_wow_masterdagger",
	Name = this.Const.Wow_strings.PerkName.MasterDagger,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterDagger,
	Icon = "ui/perks/perk_rogue_masterdagger.png",
	IconDisabled = "ui/perks/perk_rogue_masterdagger_sw.png",
	Const = "MasterDagger"
}

gt.Const.Perks.PerkDefObjects.MasterMace <- {
	ID = "perk.wow.rogue.mastermace",
	Script = "scripts/skills/perks/perk_wow_mastermace",
	Name = this.Const.Wow_strings.PerkName.MasterMace,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterMace,
	Icon = "ui/perks/perk_rogue_mastermace.png",
	IconDisabled = "ui/perks/perk_rogue_mastermace_sw.png",
	Const = "MasterMace"
}

gt.Const.Perks.PerkDefObjects.MasterFlail <- {
	ID = "perk.wow.rogue.masterflail",
	Script = "scripts/skills/perks/perk_wow_masterflail",
	Name = this.Const.Wow_strings.PerkName.MasterFlail,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterFlail,
	Icon = "ui/perks/perk_rogue_masterflail.png",
	IconDisabled = "ui/perks/perk_rogue_masterflail_sw.png",
	Const = "MasterFlail"
}

gt.Const.Perks.PerkDefObjects.Ambidextr <- {
	ID = "perk.wow.rogue.ambidextr",
	Script = "scripts/skills/perks/perk_wow_ambidextr",
	Name = this.Const.Wow_strings.PerkName.Ambidextr,
	Tooltip = this.Const.Wow_strings.PerkDescription.Ambidextr,
	Icon = "ui/perks/perk_rogue_ambidextr.png",
	IconDisabled = "ui/perks/perk_rogue_ambidextr_sw.png",
	Const = "Ambidextr"
}

gt.Const.Perks.PerkDefObjects.Sprint <- {
	ID = "perk.wow.rogue.sprint",
	Script = "scripts/skills/perks/perk_wow_sprint",
	Name = this.Const.Wow_strings.PerkName.Sprint,
	Tooltip = this.Const.Wow_strings.PerkDescription.Sprint,
	Icon = "ui/perks/perk_rogue_sprint.png",
	IconDisabled = "ui/perks/perk_rogue_sprint_sw.png",
	Const = "Sprint"
}

gt.Const.Perks.PerkDefObjects.Vigor <- {
	ID = "perk.wow.rogue.vigor",
	Script = "scripts/skills/perks/perk_wow_vigor",
	Name = this.Const.Wow_strings.PerkName.Vigor,
	Tooltip = this.Const.Wow_strings.PerkDescription.Vigor,
	Icon = "ui/perks/perk_rogue_vigor.png",
	IconDisabled = "ui/perks/perk_rogue_vigor_sw.png",
	Const = "Vigor"
}

gt.Const.Perks.PerkDefObjects.AdrenalineRush <- {
	ID = "perk.wow.rogue.adrenalinerush",
	Script = "scripts/skills/perks/perk_wow_adrenalinerush",
	Name = this.Const.Wow_strings.PerkName.AdrenalineRush,
	Tooltip = this.Const.Wow_strings.PerkDescription.AdrenalineRush,
	Icon = "ui/perks/perk_rogue_adrenalinerush.png",
	IconDisabled = "ui/perks/perk_rogue_adrenalinerush_sw.png",
	Const = "AdrenalineRush"
}

// ---------------------------------------------|
// ----------------  WOW PALADIN ---------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.HolyLight <- {
	ID = "perk.wow.paladin.holylight",
	Script = "scripts/skills/perks/perk_wow_holylight",
	Name = this.Const.Wow_strings.PerkName.HolyLight,
	Tooltip = this.Const.Wow_strings.PerkDescription.HolyLight,
	Icon = "ui/perks/perk_paladin_holylight.png",
	IconDisabled = "ui/perks/perk_paladin_holylight_sw.png",
	Const = "HolyLight"
}

gt.Const.Perks.PerkDefObjects.BlessingofMight <- {
	ID = "perk.wow.paladin.blessingofmight",
	Script = "scripts/skills/perks/perk_wow_blessingofmight",
	Name = this.Const.Wow_strings.PerkName.BlessingofMight,
	Tooltip = this.Const.Wow_strings.PerkDescription.BlessingofMight,
	Icon = "ui/perks/perk_paladin_blessingofmight.png",
	IconDisabled = "ui/perks/perk_paladin_blessingofmight_sw.png",
	Const = "BlessingofMight"
}

gt.Const.Perks.PerkDefObjects.HolyPower <- {
	ID = "perk.wow.paladin.holypower",
	Script = "scripts/skills/perks/perk_wow_holypower",
	Name = this.Const.Wow_strings.PerkName.HolyPower,
	Tooltip = this.Const.Wow_strings.PerkDescription.HolyPower,
	Icon = "ui/perks/perk_paladin_holypower.png",
	IconDisabled = "ui/perks/perk_paladin_holypower_sw.png",
	Const = "HolyPower"
}

gt.Const.Perks.PerkDefObjects.Anticipation_paladin <- {
	ID = "perk.wow.paladin.anticipation",
	Script = "scripts/skills/perks/perk_wow_anticipation",
	Name = this.Const.Wow_strings.PerkName.Anticipation,
	Tooltip = this.Const.Wow_strings.PerkDescription.Anticipation,
	Icon = "ui/perks/perk_paladin_anticipation.png",
	IconDisabled = "ui/perks/perk_paladin_anticipation_sw.png",
	Const = "Anticipation"
}

gt.Const.Perks.PerkDefObjects.HammerofJustice <- {
	ID = "perk.wow.paladin.hammerofjustice",
	Script = "scripts/skills/perks/perk_wow_hammerofjustice",
	Name = this.Const.Wow_strings.PerkName.HammerofJustice,
	Tooltip = this.Const.Wow_strings.PerkDescription.HammerofJustice,
	Icon = "ui/perks/perk_paladin_hammerofjustice.png",
	IconDisabled = "ui/perks/perk_paladin_hammerofjustice_sw.png",
	Const = "HammerofJustice"
}

gt.Const.Perks.PerkDefObjects.DivineStrength <- {
	ID = "perk.wow.paladin.divinestrength",
	Script = "scripts/skills/perks/perk_wow_divinestrength",
	Name = this.Const.Wow_strings.PerkName.DivineStrength,
	Tooltip = this.Const.Wow_strings.PerkDescription.DivineStrength,
	Icon = "ui/perks/perk_paladin_divinestrength.png",
	IconDisabled = "ui/perks/perk_paladin_divinestrength_sw.png",
	Const = "DivineStrength"
}

gt.Const.Perks.PerkDefObjects.DevoutionAura <- {
	ID = "perk.wow.paladin.devoutionaura",
	Script = "scripts/skills/perks/perk_wow_devoutionaura",
	Name = this.Const.Wow_strings.PerkName.DevoutionAura,
	Tooltip = this.Const.Wow_strings.PerkDescription.DevoutionAura,
	Icon = "ui/perks/perk_paladin_devoutionaura.png",
	IconDisabled = "ui/perks/perk_paladin_devoutionaura_sw.png",
	Const = "DevoutionAura"
}

gt.Const.Perks.PerkDefObjects.RetributionAura <- {
	ID = "perk.wow.paladin.retributionaura",
	Script = "scripts/skills/perks/perk_wow_retributionaura",
	Name = this.Const.Wow_strings.PerkName.RetributionAura,
	Tooltip = this.Const.Wow_strings.PerkDescription.RetributionAura,
	Icon = "ui/perks/perk_paladin_retributionaura.png",
	IconDisabled = "ui/perks/perk_paladin_retributionaura_sw.png",
	Const = "RetributionAura"
}

gt.Const.Perks.PerkDefObjects.ConcentrationAura <- {
	ID = "perk.wow.paladin.concentrationaura",
	Script = "scripts/skills/perks/perk_wow_concentrationaura",
	Name = this.Const.Wow_strings.PerkName.ConcentrationAura,
	Tooltip = this.Const.Wow_strings.PerkDescription.ConcentrationAura,
	Icon = "ui/perks/perk_paladin_concentrationaura.png",
	IconDisabled = "ui/perks/perk_paladin_concentrationaura_sw.png",
	Const = "ConcentrationAura"
}

gt.Const.Perks.PerkDefObjects.SanctityAura <- {
	ID = "perk.wow.paladin.sanctityaura",
	Script = "scripts/skills/perks/perk_wow_sanctityaura",
	Name = this.Const.Wow_strings.PerkName.SanctityAura,
	Tooltip = this.Const.Wow_strings.PerkDescription.SanctityAura,
	Icon = "ui/perks/perk_paladin_sanctityaura.png",
	IconDisabled = "ui/perks/perk_paladin_sanctityaura_sw.png",
	Const = "SanctityAura"
}

gt.Const.Perks.PerkDefObjects.AuraMastery <- {
	ID = "perk.wow.paladin.auramastery",
	Script = "scripts/skills/perks/perk_wow_auramastery",
	Name = this.Const.Wow_strings.PerkName.AuraMastery,
	Tooltip = this.Const.Wow_strings.PerkDescription.AuraMastery,
	Icon = "ui/perks/perk_paladin_auramastery.png",
	IconDisabled = "ui/perks/perk_paladin_auramastery_sw.png",
	Const = "AuraMastery"
}

gt.Const.Perks.PerkDefObjects.Cleanse <- {
	ID = "perk.wow.paladin.cleanse",
	Script = "scripts/skills/perks/perk_wow_cleanse",
	Name = this.Const.Wow_strings.PerkName.Cleanse,
	Tooltip = this.Const.Wow_strings.PerkDescription.Cleanse,
	Icon = "ui/perks/perk_paladin_cleanse.png",
	IconDisabled = "ui/perks/perk_paladin_cleanse_sw.png",
	Const = "Cleanse"
}

gt.Const.Perks.PerkDefObjects.DivineShield <- {
	ID = "perk.wow.paladin.divineshield",
	Script = "scripts/skills/perks/perk_wow_divineshield",
	Name = this.Const.Wow_strings.PerkName.DivineShield,
	Tooltip = this.Const.Wow_strings.PerkDescription.DivineShield,
	Icon = "ui/perks/perk_paladin_divineshield.png",
	IconDisabled = "ui/perks/perk_paladin_divineshield_sw.png",
	Const = "DivineShield"
}

gt.Const.Perks.PerkDefObjects.SealofCommand <- {
	ID = "perk.wow.paladin.sealofcommand",
	Script = "scripts/skills/perks/perk_wow_sealofcommand",
	Name = this.Const.Wow_strings.PerkName.SealofCommand,
	Tooltip = this.Const.Wow_strings.PerkDescription.SealofCommand,
	Icon = "ui/perks/perk_paladin_sealofcommand.png",
	IconDisabled = "ui/perks/perk_paladin_sealofcommand_sw.png",
	Const = "SealofCommand"
}

// ---------------------------------------------|
// ----------------  WOW HUNTER ----------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.BeastMaster <- {
	ID = "perk.wow.hunter.beastmaster",
	Script = "scripts/skills/perks/perk_wow_beastmaster",
	Name = this.Const.Wow_strings.PerkName.BeastMaster,
	Tooltip = this.Const.Wow_strings.PerkDescription.BeastMaster,
	Icon = "ui/perks/perk_hunter_beastmaster.png",
	IconDisabled = "ui/perks/perk_hunter_beastmaster_sw.png",
	Const = "BeastMaster"
}

gt.Const.Perks.PerkDefObjects.HuntersMark <- {
	ID = "perk.wow.hunter.huntersmark",
	Script = "scripts/skills/perks/perk_wow_huntersmark",
	Name = this.Const.Wow_strings.PerkName.HuntersMark,
	Tooltip = this.Const.Wow_strings.PerkDescription.HuntersMark,
	Icon = "ui/perks/perk_hunter_huntersmark.png",
	IconDisabled = "ui/perks/perk_hunter_huntersmark_sw.png",
	Const = "HuntersMark"
}

gt.Const.Perks.PerkDefObjects.EnduranceTraining <- {
	ID = "perk.wow.hunter.endurancetraining",
	Script = "scripts/skills/perks/perk_wow_endurancetraining",
	Name = this.Const.Wow_strings.PerkName.EnduranceTraining,
	Tooltip = this.Const.Wow_strings.PerkDescription.EnduranceTraining,
	Icon = "ui/perks/perk_hunter_endurancetraining.png",
	IconDisabled = "ui/perks/perk_hunter_endurancetraining_sw.png",
	Const = "EnduranceTraining"
}

gt.Const.Perks.PerkDefObjects.ThickHide <- {
	ID = "perk.wow.hunter.thickhide",
	Script = "scripts/skills/perks/perk_wow_thickhide",
	Name = this.Const.Wow_strings.PerkName.ThickHide,
	Tooltip = this.Const.Wow_strings.PerkDescription.ThickHide,
	Icon = "ui/perks/perk_hunter_thickhide.png",
	IconDisabled = "ui/perks/perk_hunter_thickhide_sw.png",
	Const = "ThickHide"
}

gt.Const.Perks.PerkDefObjects.Survivalist <- {
	ID = "perk.wow.hunter.survivalist",
	Script = "scripts/skills/perks/perk_wow_survivalist",
	Name = this.Const.Wow_strings.PerkName.Survivalist,
	Tooltip = this.Const.Wow_strings.PerkDescription.Survivalist,
	Icon = "ui/perks/perk_hunter_survivalist.png",
	IconDisabled = "ui/perks/perk_hunter_survivalist_sw.png",
	Const = "Survivalist"
}

gt.Const.Perks.PerkDefObjects.LightingReflexes <- {
	ID = "perk.wow.hunter.lightingreflexes",
	Script = "scripts/skills/perks/perk_wow_lightingreflexes",
	Name = this.Const.Wow_strings.PerkName.LightingReflexes,
	Tooltip = this.Const.Wow_strings.PerkDescription.LightingReflexes,
	Icon = "ui/perks/perk_hunter_lightingreflexes.png",
	IconDisabled = "ui/perks/perk_hunter_lightingreflexes_sw.png",
	Const = "LightingReflexes"
}

gt.Const.Perks.PerkDefObjects.BestialSwiftness <- {
	ID = "perk.wow.hunter.bestialswiftness",
	Script = "scripts/skills/perks/perk_wow_bestialswiftness",
	Name = this.Const.Wow_strings.PerkName.BestialSwiftness,
	Tooltip = this.Const.Wow_strings.PerkDescription.BestialSwiftness,
	Icon = "ui/perks/perk_hunter_bestialswiftness.png",
	IconDisabled = "ui/perks/perk_hunter_bestialswiftness_sw.png",
	Const = "BestialSwiftness"
}

gt.Const.Perks.PerkDefObjects.UnleashedFury <- {
	ID = "perk.wow.hunter.unleashedfury",
	Script = "scripts/skills/perks/perk_wow_unleashedfury",
	Name = this.Const.Wow_strings.PerkName.UnleashedFury,
	Tooltip = this.Const.Wow_strings.PerkDescription.UnleashedFury,
	Icon = "ui/perks/perk_hunter_unleashedfury.png",
	IconDisabled = "ui/perks/perk_hunter_unleashedfury_sw.png",
	Const = "UnleashedFury"
}

gt.Const.Perks.PerkDefObjects.AspectoftheMonkey <- {
	ID = "perk.wow.hunter.aspectofthemonkey",
	Script = "scripts/skills/perks/perk_wow_aspectofthemonkey",
	Name = this.Const.Wow_strings.PerkName.AspectoftheMonkey,
	Tooltip = this.Const.Wow_strings.PerkDescription.AspectoftheMonkey,
	Icon = "ui/perks/perk_hunter_aspectofthemonkey.png",
	IconDisabled = "ui/perks/perk_hunter_aspectofthemonkey_sw.png",
	Const = "AspectoftheMonkey"
}

gt.Const.Perks.PerkDefObjects.AspectoftheHawk <- {
	ID = "perk.wow.hunter.aspectofthehawk",
	Script = "scripts/skills/perks/perk_wow_aspectofthehawk",
	Name = this.Const.Wow_strings.PerkName.AspectoftheHawk,
	Tooltip = this.Const.Wow_strings.PerkDescription.AspectoftheHawk,
	Icon = "ui/perks/perk_hunter_aspectofthehawk.png",
	IconDisabled = "ui/perks/perk_hunter_aspectofthehawk_sw.png",
	Const = "AspectoftheHawk"
}

gt.Const.Perks.PerkDefObjects.MasterThrowing <- {
	ID = "perk.wow.hunter.masterthrowing",
	Script = "scripts/skills/perks/perk_wow_masterthrowing",
	Name = this.Const.Wow_strings.PerkName.MasterThrowing,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterThrowing,
	Icon = "ui/perks/perk_hunter_masterthrowing.png",
	IconDisabled = "ui/perks/perk_hunter_masterthrowing_sw.png",
	Const = "MasterThrowing"
}

gt.Const.Perks.PerkDefObjects.MasterBow <- {
	ID = "perk.wow.hunter.masterbow",
	Script = "scripts/skills/perks/perk_wow_masterbow",
	Name = this.Const.Wow_strings.PerkName.MasterBow,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterBow,
	Icon = "ui/perks/perk_hunter_masterbow.png",
	IconDisabled = "ui/perks/perk_hunter_masterbow_sw.png",
	Const = "MasterBow"
}

gt.Const.Perks.PerkDefObjects.MasterCrossbow <- {
	ID = "perk.wow.hunter.mastercrossbow",
	Script = "scripts/skills/perks/perk_wow_mastercrossbow",
	Name = this.Const.Wow_strings.PerkName.MasterCrossbow,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterCrossbow,
	Icon = "ui/perks/perk_hunter_mastercrossbow.png",
	IconDisabled = "ui/perks/perk_hunter_mastercrossbow_sw.png",
	Const = "MasterCrossbow"
}

gt.Const.Perks.PerkDefObjects.MendPet <- {
	ID = "perk.wow.hunter.mendpet",
	Script = "scripts/skills/perks/perk_wow_mendpet",
	Name = this.Const.Wow_strings.PerkName.MendPet,
	Tooltip = this.Const.Wow_strings.PerkDescription.MendPet,
	Icon = "ui/perks/perk_hunter_mendpet.png",
	IconDisabled = "ui/perks/perk_hunter_mendpet_sw.png",
	Const = "MendPet"
}

gt.Const.Perks.PerkDefObjects.LethalShots <- {
	ID = "perk.wow.hunter.lethalshots",
	Script = "scripts/skills/perks/perk_wow_lethalshots",
	Name = this.Const.Wow_strings.PerkName.LethalShots,
	Tooltip = this.Const.Wow_strings.PerkDescription.LethalShots,
	Icon = "ui/perks/perk_hunter_lethalshots.png",
	IconDisabled = "ui/perks/perk_hunter_lethalshots_sw.png",
	Const = "LethalShots"
}

gt.Const.Perks.PerkDefObjects.Disengage <- {
	ID = "perk.wow.hunter.disengage",
	Script = "scripts/skills/perks/perk_wow_disengage",
	Name = this.Const.Wow_strings.PerkName.Disengage,
	Tooltip = this.Const.Wow_strings.PerkDescription.Disengage,
	Icon = "ui/perks/perk_hunter_disengage.png",
	IconDisabled = "ui/perks/perk_hunter_disengage_sw.png",
	Const = "Disengage"
}

gt.Const.Perks.PerkDefObjects.BestialWrath <- {
	ID = "perk.wow.hunter.bestialwrath",
	Script = "scripts/skills/perks/perk_wow_bestialwrath",
	Name = this.Const.Wow_strings.PerkName.BestialWrath,
	Tooltip = this.Const.Wow_strings.PerkDescription.BestialWrath,
	Icon = "ui/perks/perk_hunter_bestialwrath.png",
	IconDisabled = "ui/perks/perk_hunter_bestialwrath_sw.png",
	Const = "BestialWrath"
}

gt.Const.Perks.PerkDefObjects.PetCare <- {
	ID = "perk.wow.hunter.petcare",
	Script = "scripts/skills/perks/perk_wow_petcare",
	Name = this.Const.Wow_strings.PerkName.PetCare,
	Tooltip = this.Const.Wow_strings.PerkDescription.PetCare,
	Icon = "ui/perks/perk_hunter_petcare.png",
	IconDisabled = "ui/perks/perk_hunter_petcare_sw.png",
	Const = "PetCare"
}

gt.Const.Perks.PerkDefObjects.EagleEye <- {
	ID = "perk.wow.hunter.eagleeye",
	Script = "scripts/skills/perks/perk_wow_eagleeye",
	Name = this.Const.Wow_strings.PerkName.EagleEye,
	Tooltip = this.Const.Wow_strings.PerkDescription.EagleEye,
	Icon = "ui/perks/perk_hunter_eagleeye.png",
	IconDisabled = "ui/perks/perk_hunter_eagleeye_sw.png",
	Const = "EagleEye"
}

// ---------------------------------------------|
// ----------------  WOW MAGE ------------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.Fireball <- {
	ID = "perk.wow.mage.fireball",
	Script = "scripts/skills/perks/perk_wow_fireball",
	Name = this.Const.Wow_strings.PerkName.Fireball,
	Tooltip = this.Const.Wow_strings.PerkDescription.Fireball,
	Icon = "ui/perks/perk_mage_fireball.png",
	IconDisabled = "ui/perks/perk_mage_fireball_sw.png",
	Const = "Fireball"
}

gt.Const.Perks.PerkDefObjects.Frostbolt <- {
	ID = "perk.wow.mage.frostbolt",
	Script = "scripts/skills/perks/perk_wow_frostbolt",
	Name = this.Const.Wow_strings.PerkName.Frostbolt,
	Tooltip = this.Const.Wow_strings.PerkDescription.Frostbolt,
	Icon = "ui/perks/perk_mage_frostbolt.png",
	IconDisabled = "ui/perks/perk_mage_frostbolt_sw.png",
	Const = "Frostbolt"
}

gt.Const.Perks.PerkDefObjects.ArcaneIntellect <- {
	ID = "perk.wow.mage.arcaneintellect",
	Script = "scripts/skills/perks/perk_wow_arcaneintellect",
	Name = this.Const.Wow_strings.PerkName.ArcaneIntellect,
	Tooltip = this.Const.Wow_strings.PerkDescription.ArcaneIntellect,
	Icon = "ui/perks/perk_mage_arcaneintellect.png",
	IconDisabled = "ui/perks/perk_mage_arcaneintellect_sw.png",
	Const = "ArcaneIntellect"
}

gt.Const.Perks.PerkDefObjects.PresenceofMind <- {
	ID = "perk.wow.mage.presenceofmind",
	Script = "scripts/skills/perks/perk_wow_presenceofmind",
	Name = this.Const.Wow_strings.PerkName.PresenceofMind,
	Tooltip = this.Const.Wow_strings.PerkDescription.PresenceofMind,
	Icon = "ui/perks/perk_mage_presenceofmind.png",
	IconDisabled = "ui/perks/perk_mage_presenceofmind_sw.png",
	Const = "PresenceofMind"
}

gt.Const.Perks.PerkDefObjects.Evocation <- {
	ID = "perk.wow.mage.evocation",
	Script = "scripts/skills/perks/perk_wow_evocation",
	Name = this.Const.Wow_strings.PerkName.Evocation,
	Tooltip = this.Const.Wow_strings.PerkDescription.Evocation,
	Icon = "ui/perks/perk_mage_evocation.png",
	IconDisabled = "ui/perks/perk_mage_evocation_sw.png",
	Const = "Evocation"
}

gt.Const.Perks.PerkDefObjects.ManaShield <- {
	ID = "perk.wow.mage.manashield",
	Script = "scripts/skills/perks/perk_wow_manashield",
	Name = this.Const.Wow_strings.PerkName.ManaShield,
	Tooltip = this.Const.Wow_strings.PerkDescription.ManaShield,
	Icon = "ui/perks/perk_mage_manashield.png",
	IconDisabled = "ui/perks/perk_mage_manashield_sw.png",
	Const = "ManaShield"
}

gt.Const.Perks.PerkDefObjects.BlastWave <- {
	ID = "perk.wow.mage.blastwave",
	Script = "scripts/skills/perks/perk_wow_blastwave",
	Name = this.Const.Wow_strings.PerkName.BlastWave,
	Tooltip = this.Const.Wow_strings.PerkDescription.BlastWave,
	Icon = "ui/perks/perk_mage_blastwave.png",
	IconDisabled = "ui/perks/perk_mage_blastwave_sw.png",
	Const = "BlastWave"
}

gt.Const.Perks.PerkDefObjects.FireWard <- {
	ID = "perk.wow.mage.fireward",
	Script = "scripts/skills/perks/perk_wow_fireward",
	Name = this.Const.Wow_strings.PerkName.FireWard,
	Tooltip = this.Const.Wow_strings.PerkDescription.FireWard,
	Icon = "ui/perks/perk_mage_fireward.png",
	IconDisabled = "ui/perks/perk_mage_fireward_sw.png",
	Const = "FireWard"
}

gt.Const.Perks.PerkDefObjects.ArcticReach <- {
	ID = "perk.wow.mage.arcticreach",
	Script = "scripts/skills/perks/perk_wow_arcticreach",
	Name = this.Const.Wow_strings.PerkName.ArcticReach,
	Tooltip = this.Const.Wow_strings.PerkDescription.ArcticReach,
	Icon = "ui/perks/perk_mage_arcticreach.png",
	IconDisabled = "ui/perks/perk_mage_arcticreach_sw.png",
	Const = "ArcticReach"
}

gt.Const.Perks.PerkDefObjects.FrostArmor <- {
	ID = "perk.wow.mage.frostarmor",
	Script = "scripts/skills/perks/perk_wow_frostarmor",
	Name = this.Const.Wow_strings.PerkName.FrostArmor,
	Tooltip = this.Const.Wow_strings.PerkDescription.FrostArmor,
	Icon = "ui/perks/perk_mage_frostarmor.png",
	IconDisabled = "ui/perks/perk_mage_frostarmor_sw.png",
	Const = "FrostArmor"
}

gt.Const.Perks.PerkDefObjects.MasterPolearm <- {
	ID = "perk.wow.mage.masterpolearm",
	Script = "scripts/skills/perks/perk_wow_masterpolearm",
	Name = this.Const.Wow_strings.PerkName.MasterPolearm,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterPolearm,
	Icon = "ui/perks/perk_mage_masterpolearm.png",
	IconDisabled = "ui/perks/perk_mage_masterpolearm_sw.png",
	Const = "MasterPolearm"
}

gt.Const.Perks.PerkDefObjects.Ignite <- {
	ID = "perk.wow.mage.ignite",
	Script = "scripts/skills/perks/perk_wow_ignite",
	Name = this.Const.Wow_strings.PerkName.Ignite,
	Tooltip = this.Const.Wow_strings.PerkDescription.Ignite,
	Icon = "ui/perks/perk_mage_ignite.png",
	IconDisabled = "ui/perks/perk_mage_ignite_sw.png",
	Const = "Ignite"
}

gt.Const.Perks.PerkDefObjects.WintersChill <- {
	ID = "perk.wow.mage.winterschill",
	Script = "scripts/skills/perks/perk_wow_winterschill",
	Name = this.Const.Wow_strings.PerkName.WintersChill,
	Tooltip = this.Const.Wow_strings.PerkDescription.WintersChill,
	Icon = "ui/perks/perk_mage_winterschill.png",
	IconDisabled = "ui/perks/perk_mage_winterschill_sw.png",
	Const = "WintersChill"
}

gt.Const.Perks.PerkDefObjects.MagicFocus1 <- {
	ID = "perk.wow.mage.magicfocus1",
	Script = "scripts/skills/perks/perk_wow_magicfocus1",
	Name = this.Const.Wow_strings.PerkName.MagicFocus1,
	Tooltip = this.Const.Wow_strings.PerkDescription.MagicFocus1,
	Icon = "ui/perks/perk_mage_magicfocus1.png",
	IconDisabled = "ui/perks/perk_mage_magicfocus1_sw.png",
	Const = "MagicFocus1"
}

gt.Const.Perks.PerkDefObjects.MagicFocus2 <- {
	ID = "perk.wow.mage.magicfocus2",
	Script = "scripts/skills/perks/perk_wow_magicfocus2",
	Name = this.Const.Wow_strings.PerkName.MagicFocus2,
	Tooltip = this.Const.Wow_strings.PerkDescription.MagicFocus2,
	Icon = "ui/perks/perk_mage_magicfocus2.png",
	IconDisabled = "ui/perks/perk_mage_magicfocus2_sw.png",
	Const = "MagicFocus2"
}

gt.Const.Perks.PerkDefObjects.MagicFocus3 <- {
	ID = "perk.wow.mage.magicfocus3",
	Script = "scripts/skills/perks/perk_wow_magicfocus3",
	Name = this.Const.Wow_strings.PerkName.MagicFocus3,
	Tooltip = this.Const.Wow_strings.PerkDescription.MagicFocus3,
	Icon = "ui/perks/perk_mage_magicfocus3.png",
	IconDisabled = "ui/perks/perk_mage_magicfocus3_sw.png",
	Const = "MagicFocus3"
}

gt.Const.Perks.PerkDefObjects.Meditation <- {
	ID = "perk.wow.mage.meditation",
	Script = "scripts/skills/perks/perk_wow_meditation",
	Name = this.Const.Wow_strings.PerkName.Meditation,
	Tooltip = this.Const.Wow_strings.PerkDescription.Meditation,
	Icon = "ui/perks/perk_mage_meditation.png",
	IconDisabled = "ui/perks/perk_mage_meditation_sw.png",
	Const = "Meditation"
}

gt.Const.Perks.PerkDefObjects.GreatnessofMind <- {
	ID = "perk.wow.mage.greatnessofmind",
	Script = "scripts/skills/perks/perk_wow_greatnessofmind",
	Name = this.Const.Wow_strings.PerkName.GreatnessofMind,
	Tooltip = this.Const.Wow_strings.PerkDescription.GreatnessofMind,
	Icon = "ui/perks/perk_mage_greatnessofmind.png",
	IconDisabled = "ui/perks/perk_mage_greatnessofmind_sw.png",
	Const = "GreatnessofMind"
}

gt.Const.Perks.PerkDefObjects.MagicAbsorption <- {
	ID = "perk.wow.mage.magicabsorption",
	Script = "scripts/skills/perks/perk_wow_magicabsorption",
	Name = this.Const.Wow_strings.PerkName.MagicAbsorption,
	Tooltip = this.Const.Wow_strings.PerkDescription.MagicAbsorption,
	Icon = "ui/perks/perk_mage_magicabsorption.png",
	IconDisabled = "ui/perks/perk_mage_magicabsorption_sw.png",
	Const = "MagicAbsorption"
}

gt.Const.Perks.PerkDefObjects.MagicInstability <- {
	ID = "perk.wow.mage.magicinstability",
	Script = "scripts/skills/perks/perk_wow_magicinstability",
	Name = this.Const.Wow_strings.PerkName.MagicInstability,
	Tooltip = this.Const.Wow_strings.PerkDescription.MagicInstability,
	Icon = "ui/perks/perk_mage_magicinstability.png",
	IconDisabled = "ui/perks/perk_mage_magicinstability_sw.png",
	Const = "MagicInstability"
}

gt.Const.Perks.PerkDefObjects.FireAttunement <- {
	ID = "perk.wow.mage.fireattunement",
	Script = "scripts/skills/perks/perk_wow_fireattunement",
	Name = this.Const.Wow_strings.PerkName.FireAttunement,
	Tooltip = this.Const.Wow_strings.PerkDescription.FireAttunement,
	Icon = "ui/perks/perk_mage_fireattunement.png",
	IconDisabled = "ui/perks/perk_mage_fireattunement_sw.png",
	Const = "FireAttunement"
}

gt.Const.Perks.PerkDefObjects.IceAttunement <- {
	ID = "perk.wow.mage.iceattunement",
	Script = "scripts/skills/perks/perk_wow_iceattunement",
	Name = this.Const.Wow_strings.PerkName.IceAttunement,
	Tooltip = this.Const.Wow_strings.PerkDescription.IceAttunement,
	Icon = "ui/perks/perk_mage_iceattunement.png",
	IconDisabled = "ui/perks/perk_mage_iceattunement_sw.png",
	Const = "IceAttunement"
}

gt.Const.Perks.PerkDefObjects.ManaAgat <- {
	ID = "perk.wow.mage.manaagat",
	Script = "scripts/skills/perks/perk_wow_manaagat",
	Name = this.Const.Wow_strings.PerkName.ManaAgat,
	Tooltip = this.Const.Wow_strings.PerkDescription.ManaAgat,
	Icon = "ui/perks/perk_mage_manaagat.png",
	IconDisabled = "ui/perks/perk_mage_manaagat_sw.png",
	Const = "ManaAgat"
}

gt.Const.Perks.PerkDefObjects.FrostNova <- {
	ID = "perk.wow.mage.frostnova",
	Script = "scripts/skills/perks/perk_wow_frostnova",
	Name = this.Const.Wow_strings.PerkName.FrostNova,
	Tooltip = this.Const.Wow_strings.PerkDescription.FrostNova,
	Icon = "ui/perks/perk_mage_frostnova.png",
	IconDisabled = "ui/perks/perk_mage_frostnova_sw.png",
	Const = "FrostNova"
}

// ---------------------------------------------|
// ----------------  WOW PRIEST ----------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.Heal <- {
	ID = "perk.wow.priest.heal",
	Script = "scripts/skills/perks/perk_wow_heal",
	Name = this.Const.Wow_strings.PerkName.Heal,
	Tooltip = this.Const.Wow_strings.PerkDescription.Heal,
	Icon = "ui/perks/perk_priest_heal.png",
	IconDisabled = "ui/perks/perk_priest_heal_sw.png",
	Const = "Heal"
}

gt.Const.Perks.PerkDefObjects.Shield <- {
	ID = "perk.wow.priest.shield",
	Script = "scripts/skills/perks/perk_wow_shield",
	Name = this.Const.Wow_strings.PerkName.Shield,
	Tooltip = this.Const.Wow_strings.PerkDescription.Shield,
	Icon = "ui/perks/perk_priest_shield.png",
	IconDisabled = "ui/perks/perk_priest_shield_sw.png",
	Const = "Shield"
}

gt.Const.Perks.PerkDefObjects.BlessedRecovery <- {
	ID = "perk.wow.priest.blessedrecovery",
	Script = "scripts/skills/perks/perk_wow_blessedrecovery",
	Name = this.Const.Wow_strings.PerkName.BlessedRecovery,
	Tooltip = this.Const.Wow_strings.PerkDescription.BlessedRecovery,
	Icon = "ui/perks/perk_priest_blessedrecovery.png",
	IconDisabled = "ui/perks/perk_priest_blessedrecovery_sw.png",
	Const = "BlessedRecovery"
}

gt.Const.Perks.PerkDefObjects.Fortitude <- {
	ID = "perk.wow.priest.fortitude",
	Script = "scripts/skills/perks/perk_wow_fortitude",
	Name = this.Const.Wow_strings.PerkName.Fortitude,
	Tooltip = this.Const.Wow_strings.PerkDescription.Fortitude,
	Icon = "ui/perks/perk_priest_fortitude.png",
	IconDisabled = "ui/perks/perk_priest_fortitude_sw.png",
	Const = "Fortitude"
}

gt.Const.Perks.PerkDefObjects.DivineSpirit <- {
	ID = "perk.wow.priest.divinespirit",
	Script = "scripts/skills/perks/perk_wow_divinespirit",
	Name = this.Const.Wow_strings.PerkName.DivineSpirit,
	Tooltip = this.Const.Wow_strings.PerkDescription.DivineSpirit,
	Icon = "ui/perks/perk_priest_divinespirit.png",
	IconDisabled = "ui/perks/perk_priest_divinespirit_sw.png",
	Const = "DivineSpirit"
}

gt.Const.Perks.PerkDefObjects.InnerFire <- {
	ID = "perk.wow.priest.innerfire",
	Script = "scripts/skills/perks/perk_wow_innerfire",
	Name = this.Const.Wow_strings.PerkName.InnerFire,
	Tooltip = this.Const.Wow_strings.PerkDescription.InnerFire,
	Icon = "ui/perks/perk_priest_innerfire.png",
	IconDisabled = "ui/perks/perk_priest_innerfire_sw.png",
	Const = "InnerFire"
}

gt.Const.Perks.PerkDefObjects.InnerFocus <- {
	ID = "perk.wow.priest.innerfocus",
	Script = "scripts/skills/perks/perk_wow_innerfocus",
	Name = this.Const.Wow_strings.PerkName.InnerFocus,
	Tooltip = this.Const.Wow_strings.PerkDescription.InnerFocus,
	Icon = "ui/perks/perk_priest_innerfocus.png",
	IconDisabled = "ui/perks/perk_priest_innerfocus_sw.png",
	Const = "InnerFocus"
}

gt.Const.Perks.PerkDefObjects.HolyReach <- {
	ID = "perk.wow.priest.holyreach",
	Script = "scripts/skills/perks/perk_wow_holyreach",
	Name = this.Const.Wow_strings.PerkName.HolyReach,
	Tooltip = this.Const.Wow_strings.PerkDescription.HolyReach,
	Icon = "ui/perks/perk_priest_holyreach.png",
	IconDisabled = "ui/perks/perk_priest_holyreach_sw.png",
	Const = "HolyReach"
}

gt.Const.Perks.PerkDefObjects.Inspiration <- {
	ID = "perk.wow.priest.inspiration",
	Script = "scripts/skills/perks/perk_wow_inspiration",
	Name = this.Const.Wow_strings.PerkName.Inspiration,
	Tooltip = this.Const.Wow_strings.PerkDescription.Inspiration,
	Icon = "ui/perks/perk_priest_inspiration.png",
	IconDisabled = "ui/perks/perk_priest_inspiration_sw.png",
	Const = "Inspiration"
}

gt.Const.Perks.PerkDefObjects.HealingFocus <- {
	ID = "perk.wow.priest.healingfocus",
	Script = "scripts/skills/perks/perk_wow_healingfocus",
	Name = this.Const.Wow_strings.PerkName.HealingFocus,
	Tooltip = this.Const.Wow_strings.PerkDescription.HealingFocus,
	Icon = "ui/perks/perk_priest_healingfocus.png",
	IconDisabled = "ui/perks/perk_priest_healingfocus_sw.png",
	Const = "HealingFocus"
}

gt.Const.Perks.PerkDefObjects.MentalStrength <- {
	ID = "perk.wow.priest.mentalstrength",
	Script = "scripts/skills/perks/perk_wow_mentalstrength",
	Name = this.Const.Wow_strings.PerkName.MentalStrength,
	Tooltip = this.Const.Wow_strings.PerkDescription.MentalStrength,
	Icon = "ui/perks/perk_priest_mentalstrength.png",
	IconDisabled = "ui/perks/perk_priest_mentalstrength_sw.png",
	Const = "MentalStrength"
}

gt.Const.Perks.PerkDefObjects.MentalPower <- {
	ID = "perk.wow.priest.mentalpower",
	Script = "scripts/skills/perks/perk_wow_mentalpower",
	Name = this.Const.Wow_strings.PerkName.MentalPower,
	Tooltip = this.Const.Wow_strings.PerkDescription.MentalPower,
	Icon = "ui/perks/perk_priest_mentalpower.png",
	IconDisabled = "ui/perks/perk_priest_mentalpower_sw.png",
	Const = "MentalPower"
}

gt.Const.Perks.PerkDefObjects.UnbreakableWill <- {
	ID = "perk.wow.priest.unbreakablewill",
	Script = "scripts/skills/perks/perk_wow_unbreakablewill",
	Name = this.Const.Wow_strings.PerkName.UnbreakableWill,
	Tooltip = this.Const.Wow_strings.PerkDescription.UnbreakableWill,
	Icon = "ui/perks/perk_priest_unbreakablewill.png",
	IconDisabled = "ui/perks/perk_priest_unbreakablewill_sw.png",
	Const = "UnbreakableWill"
}

gt.Const.Perks.PerkDefObjects.SpiritalHealing <- {
	ID = "perk.wow.priest.spiritalhealing",
	Script = "scripts/skills/perks/perk_wow_spiritalhealing",
	Name = this.Const.Wow_strings.PerkName.SpiritalHealing,
	Tooltip = this.Const.Wow_strings.PerkDescription.SpiritalHealing,
	Icon = "ui/perks/perk_priest_spiritalhealing.png",
	IconDisabled = "ui/perks/perk_priest_spiritalhealing_sw.png",
	Const = "SpiritalHealing"
}

gt.Const.Perks.PerkDefObjects.MentalAgility <- {
	ID = "perk.wow.priest.mentalagility",
	Script = "scripts/skills/perks/perk_wow_mentalagility",
	Name = this.Const.Wow_strings.PerkName.MentalAgility,
	Tooltip = this.Const.Wow_strings.PerkDescription.MentalAgility,
	Icon = "ui/perks/perk_priest_mentalagility.png",
	IconDisabled = "ui/perks/perk_priest_mentalagility_sw.png",
	Const = "MentalAgility"
}

gt.Const.Perks.PerkDefObjects.Renew <- {
	ID = "perk.wow.priest.renew",
	Script = "scripts/skills/perks/perk_wow_renew",
	Name = this.Const.Wow_strings.PerkName.Renew,
	Tooltip = this.Const.Wow_strings.PerkDescription.Renew,
	Icon = "ui/perks/perk_priest_renew.png",
	IconDisabled = "ui/perks/perk_priest_renew_sw.png",
	Const = "Renew"
}

gt.Const.Perks.PerkDefObjects.RepairMaster <- {
	ID = "perk.wow.priest.repairmaster",
	Script = "scripts/skills/perks/perk_wow_repairmaster",
	Name = this.Const.Wow_strings.PerkName.RepairMaster,
	Tooltip = this.Const.Wow_strings.PerkDescription.RepairMaster,
	Icon = "ui/perks/perk_priest_repairmaster.png",
	IconDisabled = "ui/perks/perk_priest_repairmaster_sw.png",
	Const = "RepairMaster"
}

gt.Const.Perks.PerkDefObjects.PermanentRecovery <- {
	ID = "perk.wow.priest.permanentrecovery",
	Script = "scripts/skills/perks/perk_wow_permanentrecovery",
	Name = this.Const.Wow_strings.PerkName.PermanentRecovery,
	Tooltip = this.Const.Wow_strings.PerkDescription.PermanentRecovery,
	Icon = "ui/perks/perk_priest_permanentrecovery.png",
	IconDisabled = "ui/perks/perk_priest_permanentrecovery_sw.png",
	Const = "PermanentRecovery"
}

gt.Const.Perks.PerkDefObjects.LuckyRecovery <- {
	ID = "perk.wow.priest.luckyrecovery",
	Script = "scripts/skills/perks/perk_wow_luckyrecovery",
	Name = this.Const.Wow_strings.PerkName.LuckyRecovery,
	Tooltip = this.Const.Wow_strings.PerkDescription.LuckyRecovery,
	Icon = "ui/perks/perk_priest_luckyrecovery.png",
	IconDisabled = "ui/perks/perk_priest_luckyrecovery_sw.png",
	Const = "LuckyRecovery"
}

gt.Const.Perks.PerkDefObjects.Fade <- {
	ID = "perk.wow.priest.fade",
	Script = "scripts/skills/perks/perk_wow_fade",
	Name = this.Const.Wow_strings.PerkName.Fade,
	Tooltip = this.Const.Wow_strings.PerkDescription.Fade,
	Icon = "ui/perks/perk_priest_fade.png",
	IconDisabled = "ui/perks/perk_priest_fade_sw.png",
	Const = "Fade"
}

// ---------------------------------------------|
// ----------------  WOW DRUID -----------------|
// ---------------------------------------------|
gt.Const.Perks.PerkDefObjects.Moonfury <- {
	ID = "perk.wow.druid.moonfury",
	Script = "scripts/skills/perks/perk_wow_moonfury",
	Name = this.Const.Wow_strings.PerkName.Moonfury,
	Tooltip = this.Const.Wow_strings.PerkDescription.Moonfury,
	Icon = "ui/perks/perk_druid_moonfury.png",
	IconDisabled = "ui/perks/perk_druid_moonfury_sw.png",
	Const = "Moonfury"
}

gt.Const.Perks.PerkDefObjects.Ferocity <- {
	ID = "perk.wow.druid.ferocity",
	Script = "scripts/skills/perks/perk_wow_ferocity",
	Name = this.Const.Wow_strings.PerkName.Ferocity,
	Tooltip = this.Const.Wow_strings.PerkDescription.Ferocity,
	Icon = "ui/perks/perk_druid_ferocity.png",
	IconDisabled = "ui/perks/perk_druid_ferocity_sw.png",
	Const = "Ferocity"
}

gt.Const.Perks.PerkDefObjects.FaerieFire <- {
	ID = "perk.wow.druid.faeriefire",
	Script = "scripts/skills/perks/perk_wow_faeriefire",
	Name = this.Const.Wow_strings.PerkName.FaerieFire,
	Tooltip = this.Const.Wow_strings.PerkDescription.FaerieFire,
	Icon = "ui/perks/perk_druid_faeriefire.png",
	IconDisabled = "ui/perks/perk_druid_faeriefire_sw.png",
	Const = "FaerieFire"
}

gt.Const.Perks.PerkDefObjects.AbolishPoison <- {
	ID = "perk.wow.druid.abolishpoison",
	Script = "scripts/skills/perks/perk_wow_abolishpoison",
	Name = this.Const.Wow_strings.PerkName.AbolishPoison,
	Tooltip = this.Const.Wow_strings.PerkDescription.AbolishPoison,
	Icon = "ui/perks/perk_druid_abolishpoison.png",
	IconDisabled = "ui/perks/perk_druid_abolishpoison_sw.png",
	Const = "AbolishPoison"
}

gt.Const.Perks.PerkDefObjects.Barkskin <- {
	ID = "perk.wow.druid.barkskin",
	Script = "scripts/skills/perks/perk_wow_barkskin",
	Name = this.Const.Wow_strings.PerkName.Barkskin,
	Tooltip = this.Const.Wow_strings.PerkDescription.Barkskin,
	Icon = "ui/perks/perk_druid_barkskin.png",
	IconDisabled = "ui/perks/perk_druid_barkskin_sw.png",
	Const = "Barkskin"
}

gt.Const.Perks.PerkDefObjects.GiftofNature <- {
	ID = "perk.wow.druid.giftofnature",
	Script = "scripts/skills/perks/perk_wow_giftofnature",
	Name = this.Const.Wow_strings.PerkName.GiftofNature,
	Tooltip = this.Const.Wow_strings.PerkDescription.GiftofNature,
	Icon = "ui/perks/perk_druid_giftofnature.png",
	IconDisabled = "ui/perks/perk_druid_giftofnature_sw.png",
	Const = "GiftofNature"
}

gt.Const.Perks.PerkDefObjects.FerociousBite <- {
	ID = "perk.wow.druid.ferociousbite",
	Script = "scripts/skills/perks/perk_wow_ferociousbite",
	Name = this.Const.Wow_strings.PerkName.FerociousBite,
	Tooltip = this.Const.Wow_strings.PerkDescription.FerociousBite,
	Icon = "ui/perks/perk_druid_ferociousbite.png",
	IconDisabled = "ui/perks/perk_druid_ferociousbite_sw.png",
	Const = "FerociousBite"
}
	
gt.Const.Perks.PerkDefObjects.DemoralizingRoar <- {
	ID = "perk.wow.druid.demoralizingroar",
	Script = "scripts/skills/perks/perk_wow_demoralizingroar",
	Name = this.Const.Wow_strings.PerkName.DemoralizingRoar,
	Tooltip = this.Const.Wow_strings.PerkDescription.DemoralizingRoar,
	Icon = "ui/perks/perk_druid_demoralizingroar.png",
	IconDisabled = "ui/perks/perk_druid_demoralizingroar_sw.png",
	Const = "DemoralizingRoar"
}

gt.Const.Perks.PerkDefObjects.Swipe <- {
	ID = "perk.wow.druid.swipe",
	Script = "scripts/skills/perks/perk_wow_swipe",
	Name = this.Const.Wow_strings.PerkName.Swipe,
	Tooltip = this.Const.Wow_strings.PerkDescription.Swipe,
	Icon = "ui/perks/perk_druid_swipe.png",
	IconDisabled = "ui/perks/perk_druid_swipe_sw.png",
	Const = "Swipe"
}

gt.Const.Perks.PerkDefObjects.FeralCharge <- {
	ID = "perk.wow.druid.feralcharge",
	Script = "scripts/skills/perks/perk_wow_feralcharge",
	Name = this.Const.Wow_strings.PerkName.FeralCharge,
	Tooltip = this.Const.Wow_strings.PerkDescription.FeralCharge,
	Icon = "ui/perks/perk_druid_feralcharge.png",
	IconDisabled = "ui/perks/perk_druid_feralcharge_sw.png",
	Const = "FeralCharge"
}

gt.Const.Perks.PerkDefObjects.Swiftmend <- {
	ID = "perk.wow.druid.swiftmend",
	Script = "scripts/skills/perks/perk_wow_swiftmend",
	Name = this.Const.Wow_strings.PerkName.Swiftmend,
	Tooltip = this.Const.Wow_strings.PerkDescription.Swiftmend,
	Icon = "ui/perks/perk_druid_swiftmend.png",
	IconDisabled = "ui/perks/perk_druid_swiftmend_sw.png",
	Const = "Swiftmend"
}

gt.Const.Perks.PerkDefObjects.SharpenedClaws <- {
	ID = "perk.wow.druid.sharpenedclaws",
	Script = "scripts/skills/perks/perk_wow_sharpenedclaws",
	Name = this.Const.Wow_strings.PerkName.SharpenedClaws,
	Tooltip = this.Const.Wow_strings.PerkDescription.SharpenedClaws,
	Icon = "ui/perks/perk_druid_sharpenedclaws.png",
	IconDisabled = "ui/perks/perk_druid_sharpenedclaws_sw.png",
	Const = "SharpenedClaws"
}

gt.Const.Perks.PerkDefObjects.PrimalFury <- {
	ID = "perk.wow.druid.primalfury",
	Script = "scripts/skills/perks/perk_wow_primalfury",
	Name = this.Const.Wow_strings.PerkName.PrimalFury,
	Tooltip = this.Const.Wow_strings.PerkDescription.PrimalFury,
	Icon = "ui/perks/perk_druid_primalfury.png",
	IconDisabled = "ui/perks/perk_druid_primalfury_sw.png",
	Const = "PrimalFury"
}

gt.Const.Perks.PerkDefObjects.Clarity <- {
	ID = "perk.wow.druid.clarity",
	Script = "scripts/skills/perks/perk_wow_clarity",
	Name = this.Const.Wow_strings.PerkName.Clarity,
	Tooltip = this.Const.Wow_strings.PerkDescription.Clarity,
	Icon = "ui/perks/perk_druid_clarity.png",
	IconDisabled = "ui/perks/perk_druid_clarity_sw.png",
	Const = "Clarity"
}

gt.Const.Perks.PerkDefObjects.HeartofWild <- {
	ID = "perk.wow.druid.heartofwild",
	Script = "scripts/skills/perks/perk_wow_heartofwild",
	Name = this.Const.Wow_strings.PerkName.HeartofWild,
	Tooltip = this.Const.Wow_strings.PerkDescription.HeartofWild,
	Icon = "ui/perks/perk_druid_heartofwild.png",
	IconDisabled = "ui/perks/perk_druid_heartofwild_sw.png",
	Const = "HeartofWild"
}

gt.Const.Perks.PerkDefObjects.Furor <- {
	ID = "perk.wow.druid.furor",
	Script = "scripts/skills/perks/perk_wow_furor",
	Name = this.Const.Wow_strings.PerkName.Furor,
	Tooltip = this.Const.Wow_strings.PerkDescription.Furor,
	Icon = "ui/perks/perk_druid_furor.png",
	IconDisabled = "ui/perks/perk_druid_furor_sw.png",
	Const = "Furor"
}

gt.Const.Perks.PerkDefObjects.MarkofWild <- {
	ID = "perk.wow.druid.markofwild",
	Script = "scripts/skills/perks/perk_wow_markofwild",
	Name = this.Const.Wow_strings.PerkName.MarkofWild,
	Tooltip = this.Const.Wow_strings.PerkDescription.MarkofWild,
	Icon = "ui/perks/perk_druid_markofwild.png",
	IconDisabled = "ui/perks/perk_druid_markofwild_sw.png",
	Const = "MarkofWild"
}

gt.Const.Perks.PerkDefObjects.Tiger <- {
	ID = "perk.wow.druid.tiger",
	Script = "scripts/skills/perks/perk_wow_tiger",
	Name = this.Const.Wow_strings.PerkName.Tiger,
	Tooltip = this.Const.Wow_strings.PerkDescription.Tiger,
	Icon = "ui/perks/perk_druid_tiger.png",
	IconDisabled = "ui/perks/perk_druid_tiger_sw.png",
	Const = "Tiger"
}

gt.Const.Perks.PerkDefObjects.DireBear <- {
	ID = "perk.wow.druid.direbear",
	Script = "scripts/skills/perks/perk_wow_direbear",
	Name = this.Const.Wow_strings.PerkName.DireBear,
	Tooltip = this.Const.Wow_strings.PerkDescription.DireBear,
	Icon = "ui/perks/perk_druid_direbear.png",
	IconDisabled = "ui/perks/perk_druid_direbear_sw.png",
	Const = "DireBear"
}

gt.Const.Perks.PerkDefObjects.TranquilSpirit <- {
	ID = "perk.wow.druid.tranquilspirit",
	Script = "scripts/skills/perks/perk_wow_tranquilspirit",
	Name = this.Const.Wow_strings.PerkName.TranquilSpirit,
	Tooltip = this.Const.Wow_strings.PerkDescription.TranquilSpirit,
	Icon = "ui/perks/perk_druid_tranquilspirit.png",
	IconDisabled = "ui/perks/perk_druid_tranquilspirit_sw.png",
	Const = "TranquilSpirit"
}

gt.Const.Perks.PerkDefObjects.Dash <- {
	ID = "perk.wow.druid.dash",
	Script = "scripts/skills/perks/perk_wow_dash",
	Name = this.Const.Wow_strings.PerkName.Dash,
	Tooltip = this.Const.Wow_strings.PerkDescription.Dash,
	Icon = "ui/perks/perk_druid_dash.png",
	IconDisabled = "ui/perks/perk_druid_dash_sw.png",
	Const = "Dash"
}

// ---------------------------------------------|
// ----------------  WOW WARLOCK ---------------|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.Shadowbolt <- {
	ID = "perk.wow.warlock.shadowbolt",
	Script = "scripts/skills/perks/perk_wow_shadowbolt",
	Name = this.Const.Wow_strings.PerkName.Shadowbolt,
	Tooltip = this.Const.Wow_strings.PerkDescription.Shadowbolt,
	Icon = "ui/perks/perk_warlock_shadowbolt.png",
	IconDisabled = "ui/perks/perk_warlock_shadowbolt_sw.png",
	Const = "Shadowbolt"
}

gt.Const.Perks.PerkDefObjects.DrainSoul <- {
	ID = "perk.wow.warlock.drainsoul",
	Script = "scripts/skills/perks/perk_wow_drainsoul",
	Name = this.Const.Wow_strings.PerkName.DrainSoul,
	Tooltip = this.Const.Wow_strings.PerkDescription.DrainSoul,
	Icon = "ui/perks/perk_warlock_drainsoul.png",
	IconDisabled = "ui/perks/perk_warlock_drainsoul_sw.png",
	Const = "DrainSoul"
}

gt.Const.Perks.PerkDefObjects.DrainLife <- {
	ID = "perk.wow.warlock.drainlife",
	Script = "scripts/skills/perks/perk_wow_drainlife",
	Name = this.Const.Wow_strings.PerkName.DrainLife,
	Tooltip = this.Const.Wow_strings.PerkDescription.DrainLife,
	Icon = "ui/perks/perk_warlock_drainlife.png",
	IconDisabled = "ui/perks/perk_warlock_drainlife_sw.png",
	Const = "DrainLife"
}

gt.Const.Perks.PerkDefObjects.DrainStamina <- {
	ID = "perk.wow.warlock.drainstamina",
	Script = "scripts/skills/perks/perk_wow_drainstamina",
	Name = this.Const.Wow_strings.PerkName.DrainStamina,
	Tooltip = this.Const.Wow_strings.PerkDescription.DrainStamina,
	Icon = "ui/perks/perk_warlock_drainstamina.png",
	IconDisabled = "ui/perks/perk_warlock_drainstamina_sw.png",
	Const = "DrainStamina"
}

gt.Const.Perks.PerkDefObjects.LifeTap <- {
	ID = "perk.wow.warlock.lifetap",
	Script = "scripts/skills/perks/perk_wow_lifetap",
	Name = this.Const.Wow_strings.PerkName.LifeTap,
	Tooltip = this.Const.Wow_strings.PerkDescription.LifeTap,
	Icon = "ui/perks/perk_warlock_lifetap.png",
	IconDisabled = "ui/perks/perk_warlock_lifetap_sw.png",
	Const = "LifeTap"
}

gt.Const.Perks.PerkDefObjects.DemonArmor <- {
	ID = "perk.wow.warlock.demonarmor",
	Script = "scripts/skills/perks/perk_wow_demonarmor",
	Name = this.Const.Wow_strings.PerkName.DemonArmor,
	Tooltip = this.Const.Wow_strings.PerkDescription.DemonArmor,
	Icon = "ui/perks/perk_warlock_demonarmor.png",
	IconDisabled = "ui/perks/perk_warlock_demonarmor_sw.png",
	Const = "DemonArmor"
}

gt.Const.Perks.PerkDefObjects.DestructiveReach <- {
	ID = "perk.wow.warlock.destructivereach",
	Script = "scripts/skills/perks/perk_wow_destructivereach",
	Name = this.Const.Wow_strings.PerkName.DestructiveReach,
	Tooltip = this.Const.Wow_strings.PerkDescription.DestructiveReach,
	Icon = "ui/perks/perk_warlock_destructivereach.png",
	IconDisabled = "ui/perks/perk_warlock_destructivereach_sw.png",
	Const = "DestructiveReach"
}

gt.Const.Perks.PerkDefObjects.Devastation <- {
	ID = "perk.wow.warlock.devastation",
	Script = "scripts/skills/perks/perk_wow_devastation",
	Name = this.Const.Wow_strings.PerkName.Devastation,
	Tooltip = this.Const.Wow_strings.PerkDescription.Devastation,
	Icon = "ui/perks/perk_warlock_devastation.png",
	IconDisabled = "ui/perks/perk_warlock_devastation_sw.png",
	Const = "Devastation"
}

gt.Const.Perks.PerkDefObjects.CurseofAgony <- {
	ID = "perk.wow.warlock.curseofagony",
	Script = "scripts/skills/perks/perk_wow_curseofagony",
	Name = this.Const.Wow_strings.PerkName.CurseofAgony,
	Tooltip = this.Const.Wow_strings.PerkDescription.CurseofAgony,
	Icon = "ui/perks/perk_warlock_curseofagony.png",
	IconDisabled = "ui/perks/perk_warlock_curseofagony_sw.png",
	Const = "CurseofAgony"
}

gt.Const.Perks.PerkDefObjects.DrainFunnel <- {
	ID = "perk.wow.warlock.drainfunnel",
	Script = "scripts/skills/perks/perk_wow_drainfunnel",
	Name = this.Const.Wow_strings.PerkName.DrainFunnel,
	Tooltip = this.Const.Wow_strings.PerkDescription.DrainFunnel,
	Icon = "ui/perks/perk_warlock_drainfunnel.png",
	IconDisabled = "ui/perks/perk_warlock_drainfunnel_sw.png",
	Const = "DrainFunnel"
}

gt.Const.Perks.PerkDefObjects.Shadowburn <- {
	ID = "perk.wow.warlock.shadowburn",
	Script = "scripts/skills/perks/perk_wow_shadowburn",
	Name = this.Const.Wow_strings.PerkName.Shadowburn,
	Tooltip = this.Const.Wow_strings.PerkDescription.Shadowburn,
	Icon = "ui/perks/perk_warlock_shadowburn.png",
	IconDisabled = "ui/perks/perk_warlock_shadowburn_sw.png",
	Const = "Shadowburn"
}

gt.Const.Perks.PerkDefObjects.GrimReach <- {
	ID = "perk.wow.warlock.grimreach",
	Script = "scripts/skills/perks/perk_wow_grimreach",
	Name = this.Const.Wow_strings.PerkName.GrimReach,
	Tooltip = this.Const.Wow_strings.PerkDescription.GrimReach,
	Icon = "ui/perks/perk_warlock_grimreach.png",
	IconDisabled = "ui/perks/perk_warlock_grimreach_sw.png",
	Const = "GrimReach"
}

gt.Const.Perks.PerkDefObjects.FelDomination <- {
	ID = "perk.wow.warlock.feldomination",
	Script = "scripts/skills/perks/perk_wow_feldomination",
	Name = this.Const.Wow_strings.PerkName.FelDomination,
	Tooltip = this.Const.Wow_strings.PerkDescription.FelDomination,
	Icon = "ui/perks/perk_warlock_feldomination.png",
	IconDisabled = "ui/perks/perk_warlock_feldomination_sw.png",
	Const = "FelDomination"
}

gt.Const.Perks.PerkDefObjects.DemonSkin <- {
	ID = "perk.wow.warlock.demonskin",
	Script = "scripts/skills/perks/perk_wow_demonskin",
	Name = this.Const.Wow_strings.PerkName.DemonSkin,
	Tooltip = this.Const.Wow_strings.PerkDescription.DemonSkin,
	Icon = "ui/perks/perk_warlock_demonskin.png",
	IconDisabled = "ui/perks/perk_warlock_demonskin_sw.png",
	Const = "DemonSkin"
}

gt.Const.Perks.PerkDefObjects.DemonicEmbrace <- {
	ID = "perk.wow.warlock.demonicembrace",
	Script = "scripts/skills/perks/perk_wow_demonicembrace",
	Name = this.Const.Wow_strings.PerkName.DemonicEmbrace,
	Tooltip = this.Const.Wow_strings.PerkDescription.DemonicEmbrace,
	Icon = "ui/perks/perk_warlock_demonicembrace.png",
	IconDisabled = "ui/perks/perk_warlock_demonicembrace_sw.png",
	Const = "DemonicEmbrace"
}

gt.Const.Perks.PerkDefObjects.FelIntellect <- {
	ID = "perk.wow.warlock.felintellect",
	Script = "scripts/skills/perks/perk_wow_felintellect",
	Name = this.Const.Wow_strings.PerkName.FelIntellect,
	Tooltip = this.Const.Wow_strings.PerkDescription.FelIntellect,
	Icon = "ui/perks/perk_warlock_felintellect.png",
	IconDisabled = "ui/perks/perk_warlock_felintellect_sw.png",
	Const = "FelIntellect"
}

gt.Const.Perks.PerkDefObjects.ShadowMastery <- {
	ID = "perk.wow.warlock.shadowmastery",
	Script = "scripts/skills/perks/perk_wow_shadowmastery",
	Name = this.Const.Wow_strings.PerkName.ShadowMastery,
	Tooltip = this.Const.Wow_strings.PerkDescription.ShadowMastery,
	Icon = "ui/perks/perk_warlock_shadowmastery.png",
	IconDisabled = "ui/perks/perk_warlock_shadowmastery_sw.png",
	Const = "ShadowMastery"
}

gt.Const.Perks.PerkDefObjects.MasterDemonologist <- {
	ID = "perk.wow.warlock.masterdemonologist",
	Script = "scripts/skills/perks/perk_wow_masterdemonologist",
	Name = this.Const.Wow_strings.PerkName.MasterDemonologist,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterDemonologist,
	Icon = "ui/perks/perk_warlock_masterdemonologist.png",
	IconDisabled = "ui/perks/perk_warlock_masterdemonologist_sw.png",
	Const = "MasterDemonologist"
}

gt.Const.Perks.PerkDefObjects.Ruin <- {
	ID = "perk.wow.warlock.ruin",
	Script = "scripts/skills/perks/perk_wow_ruin",
	Name = this.Const.Wow_strings.PerkName.Ruin,
	Tooltip = this.Const.Wow_strings.PerkDescription.Ruin,
	Icon = "ui/perks/perk_warlock_ruin.png",
	IconDisabled = "ui/perks/perk_warlock_ruin_sw.png",
	Const = "Ruin"
}

gt.Const.Perks.PerkDefObjects.CurseofDoom <- {
	ID = "perk.wow.warlock.curseofdoom",
	Script = "scripts/skills/perks/perk_wow_curseofdoom",
	Name = this.Const.Wow_strings.PerkName.CurseofDoom,
	Tooltip = this.Const.Wow_strings.PerkDescription.CurseofDoom,
	Icon = "ui/perks/perk_warlock_curseofdoom.png",
	IconDisabled = "ui/perks/perk_warlock_curseofdoom_sw.png",
	Const = "CurseofDoom"
}

gt.Const.Perks.PerkDefObjects.Fear <- {
	ID = "perk.wow.warlock.fear",
	Script = "scripts/skills/perks/perk_wow_fear",
	Name = this.Const.Wow_strings.PerkName.Fear,
	Tooltip = this.Const.Wow_strings.PerkDescription.Fear,
	Icon = "ui/perks/perk_warlock_fear.png",
	IconDisabled = "ui/perks/perk_warlock_fear_sw.png",
	Const = "Fear"
}

// ---------------------------------------------|
// -----------  WOW COMMON PERKS DEFINITION ----|
// ---------------------------------------------|

gt.Const.Perks.PerkDefObjects.MagicInterference <- {
	ID = "perk.wow.common.magicinterference",
	Script = "scripts/skills/perks/perk_wow_magicinterference",
	Name = this.Const.Wow_strings.PerkName.MagicInterference,
	Tooltip = this.Const.Wow_strings.PerkDescription.MagicInterference,
	Icon = "ui/perks/perk_magic_interference.png",
	IconDisabled = "ui/perks/perk_magic_interference_sw.png",
	Const = "MagicInterference"
}

gt.Const.Perks.PerkDefObjects.ElusiveProtection <- {
	ID = "perk.wow.common.elusiveprotection",
	Script = "scripts/skills/perks/perk_wow_elusiveprotection",
	Name = this.Const.Wow_strings.PerkName.ElusiveProtection,
	Tooltip = this.Const.Wow_strings.PerkDescription.ElusiveProtection,
	Icon = "ui/perks/perk_elusive_protection.png",
	IconDisabled = "ui/perks/perk_elusive_protection_sw.png",
	Const = "ElusiveProtection"
}

// ---------------------------------------------|
// -----------  WOW END PERKS DEFINITION -------|
// ---------------------------------------------|