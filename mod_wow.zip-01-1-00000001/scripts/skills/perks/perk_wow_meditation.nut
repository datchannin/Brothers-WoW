/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 081, game_version = 1.4.0.41*/
this.perk_wow_meditation <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.meditation";
		this.m.Name = this.Const.Wow_strings.PerkName.Meditation;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Meditation;
		this.m.Icon = "ui/perks/perk_mage_meditation.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onCombatStarted()
	{
		this.getContainer().add(this.new("scripts/skills/effects/meditation_effect"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.meditation");
	}
});