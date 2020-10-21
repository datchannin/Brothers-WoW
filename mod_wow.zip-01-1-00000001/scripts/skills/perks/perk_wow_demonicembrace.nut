/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_demonicembrace <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.demonicembrace";
		this.m.Name = this.Const.Wow_strings.PerkName.DemonicEmbrace;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DemonicEmbrace;
		this.m.Icon = "ui/perks/perk_warlock_demonicembrace.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		local actor = this.getContainer().getActor();

		if (actor.getHitpoints() == actor.getHitpointsMax())
		{
			actor.setHitpoints(this.Math.floor(actor.getHitpoints() * 1.25));
		}
	}

	function onUpdate( _properties )
	{
		_properties.HitpointsMult *= 1.25;
	}
});