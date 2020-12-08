/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_eviscerate <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.eviscerate";
		this.m.Name = this.Const.Wow_strings.PerkName.Eviscerate;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Eviscerate;
		this.m.Icon = "ui/perks/perk_rogue_eviscerate.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.eviscerate_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/rogue_eviscerate_skill"));
		}
	}

	function onCombatStarted()
	{
		this.getContainer().add(this.new("scripts/skills/effects/combopoint_effect"));
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.eviscerate_skill");
		this.m.Container.removeByID("effects.combopoint_effect");
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local actor = this.m.Container.getActor();
		if (_skill.getID() == "actives.puncture" || _skill.getID() == "actives.chop" || _skill.getID() == "actives.slash" || _skill.getID() == "actives.flail")
		{
			if ((_damageInflictedHitpoints <= 0) && (_damageInflictedArmor <= 0))
			{
				return;
			}

			local combopoints = actor.getSkills().getSkillByID("effects.combopoint");
			if (combopoints != null)
			{
				combopoints.addComboPoint();
			}
			else
			{
				local effect = this.new("scripts/skills/effects/combopoint_effect");
				effect.addComboPoint();
				actor.getSkills().add(effect);
			}
		}
	}
});