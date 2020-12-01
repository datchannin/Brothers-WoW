/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_hell <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.common.hell";
		this.m.Name = this.Const.Wow_strings.PerkName.Hell;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Hell;
		this.m.Icon = "ui/perks/perk_hell.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		if (this.World.Assets.getCombatDifficulty() == 4)
		{

		}
	}
});