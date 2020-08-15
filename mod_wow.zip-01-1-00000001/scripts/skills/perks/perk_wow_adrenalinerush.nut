/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
this.perk_wow_adrenalinerush <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.adrenalinerush";
		this.m.Name = this.Const.Wow_strings.PerkName.AdrenalineRush;
		this.m.Description = this.Const.Wow_strings.PerkDescription.AdrenalineRush;
		this.m.Icon = "ui/perks/perk_rogue_adrenalinerush.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
		this.getContainer().add(this.new("scripts/skills/effects/adrenalinerush_effect"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.adrenalinerush");
	}
});