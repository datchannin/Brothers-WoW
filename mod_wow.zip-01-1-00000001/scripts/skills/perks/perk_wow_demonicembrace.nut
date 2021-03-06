/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_demonicembrace <- this.inherit("scripts/skills/skill", {
	m = {
		T0_warlock_head = false
	},
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
			if (this.m.T0_warlock_head)
			{
				actor.setHitpoints(this.Math.floor(actor.getHitpoints() * 1.35));
			}
			else
			{
				actor.setHitpoints(this.Math.floor(actor.getHitpoints() * 1.25));
			}
		}
	}

	function onUpdate( _properties )
	{
		this.m.T0_warlock_head = _properties.T0_warlock_head;
		if (_properties.T0_warlock_head)
		{
			_properties.HitpointsMult *= 1.35;
		}
		else
		{
			_properties.HitpointsMult *= 1.25;
		}
	}
});