/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.winterwolfgetheal_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.winterwolfgetheal";
		this.m.Name = "Winterwolf get Heal";
		this.m.Description = "Winterwolf can be Healed.";
		this.m.Icon = "ui/perks/perk_hunter_mendpet.png";
		this.m.IconMini = "effect_mini_concentrationaura";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
	}
});