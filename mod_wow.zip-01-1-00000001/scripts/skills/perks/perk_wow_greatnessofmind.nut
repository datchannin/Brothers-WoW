/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_greatnessofmind <- this.inherit("scripts/skills/skill", {
	m = {
		BaseValue = 40,
		presenseofmind = false,
		MageLevel = 1
	},
	function create()
	{
		this.m.ID = "perk.wow.mage.greatnessofmind";
		this.m.Name = this.Const.Wow_strings.PerkName.GreatnessofMind;
		this.m.Description = this.Const.Wow_strings.PerkDescription.GreatnessofMind;
		this.m.Icon = "ui/perks/perk_mage_greatnessofmind.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTotalExpValue()
	{
		local total_exp = this.m.BaseValue;
		local scale = 0;

		scale = this.Math.floor(this.m.MageLevel * this.Const.MageScale.exp_share);

		total_exp += scale;

		return total_exp;
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local total_exp = getTotalExpValue();

		if (this.m.presenseofmind)
		{
			foreach( ally in allies )
			{
				if ((!ally.getSkills().hasSkill("perk.wow.mage.greatnessofmind")) && (!ally.getSkills().hasSkill("perk.wow.mage.presenceofmind")))
				{
					local effect = this.new("scripts/skills/effects/greatnessofmind_effect");
					effect.SetValue(total_exp);
					ally.getSkills().add(effect);
				}
			}			
		}
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.MageLevel = user.getLevel();
		this.m.presenseofmind = user.getSkills().hasSkill("perk.wow.mage.presenceofmind");
	}
});