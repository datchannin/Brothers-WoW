/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.perk_wow_sealofcommand <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.sealofcommand";
		this.m.Name = this.Const.Wow_strings.PerkName.SealofCommand;
		this.m.Description = this.Const.Wow_strings.PerkDescription.SealofCommand;
		this.m.Icon = "ui/perks/perk_paladin_sealofcommand.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();

		if (actor.getHitpoints() == actor.getHitpointsMax())
		{
			actor.setHitpoints(this.Math.floor(actor.getHitpoints() * 1.1));
		}
	}

	function onUpdate( _properties )
	{
		_properties.ActionPointsBonus = 1;
		_properties.HitpointsMult *= 1.1;
		_properties.Stamina += 10;
		_properties.Initiative -= 10;
	}	
});