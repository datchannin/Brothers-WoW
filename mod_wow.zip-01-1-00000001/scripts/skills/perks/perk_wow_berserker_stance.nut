/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.41*/
this.perk_wow_berserker_stance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.berserker_stance";
		this.m.Name = this.Const.Wow_strings.PerkName.BerserkerStance;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BerserkerStance;
		this.m.Icon = "ui/perks/perk_warrior_berserkerstance.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
		this.getContainer().add(this.new("scripts/skills/effects/berserkerstance_effect"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.berserkerstance");
	}
});