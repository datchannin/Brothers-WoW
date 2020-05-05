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
	ID = "perk.wow.warrior.master_spear",
	Script = "scripts/skills/perks/perk_wow_master_spear",
	Name = this.Const.Wow_strings.PerkName.MasterSpear,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterSpear,
	Icon = "ui/perks/perk_warrior_masterspear.png",
	IconDisabled = "ui/perks/perk_warrior_masterspear_sw.png",
	Const = "MasterSpear"
}

gt.Const.Perks.PerkDefObjects.MasterSword <- {
	ID = "perk.wow.warrior.master_sword",
	Script = "scripts/skills/perks/perk_wow_master_sword",
	Name = this.Const.Wow_strings.PerkName.MasterSword,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterSword,
	Icon = "ui/perks/perk_warrior_mastersword.png",
	IconDisabled = "ui/perks/perk_warrior_mastersword_sw.png",
	Const = "MasterSword"
}

gt.Const.Perks.PerkDefObjects.MasterAxe <- {
	ID = "perk.wow.warrior.master_axe",
	Script = "scripts/skills/perks/perk_wow_master_axe",
	Name = this.Const.Wow_strings.PerkName.MasterAxe,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterAxe,
	Icon = "ui/perks/perk_warrior_masteraxe.png",
	IconDisabled = "ui/perks/perk_warrior_masteraxe_sw.png",
	Const = "MasterAxe"
}

gt.Const.Perks.PerkDefObjects.MasterHammer <- {
	ID = "perk.wow.warrior.master_hammer",
	Script = "scripts/skills/perks/perk_wow_master_hammer",
	Name = this.Const.Wow_strings.PerkName.MasterHammer,
	Tooltip = this.Const.Wow_strings.PerkDescription.MasterHammer,
	Icon = "ui/perks/perk_warrior_masterhammer.png",
	IconDisabled = "ui/perks/perk_warrior_masterhammer_sw.png",
	Const = "MasterHammer"
}

gt.Const.Perks.PerkDefObjects.MasterShield <- {
	ID = "perk.wow.warrior.master_shield",
	Script = "scripts/skills/perks/perk_wow_master_shield",
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
// ----------------  WOW PALADIN ---------------|
// ---------------------------------------------|