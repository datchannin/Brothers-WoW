this.perk_wow_battle_shout <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.battle_shout";
		this.m.Name = this.Const.Wow_strings.PerkName.BattleShout;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BattleShout;
		this.m.Icon = "ui/perks/perk_warrior_battleshout.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
	}

	function onRemoved()
	{
	}
});