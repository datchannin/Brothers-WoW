/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.perk_wow_camouflage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.camouflage";
		this.m.Name = this.Const.Wow_strings.PerkName.Camouflage;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Camouflage;
		this.m.Icon = "ui/perks/perk_rogue_camouflage.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsOffDaggerMaster = true;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.camouflage_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/rogue_camouflage_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.camouflage_skill");
	}
});