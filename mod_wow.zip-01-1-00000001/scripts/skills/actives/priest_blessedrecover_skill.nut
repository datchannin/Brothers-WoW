/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.06, game_version = 1.4.0.38*/
this.priest_blessedrecover_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.blessedrecover_skill";
		this.m.Name = "Injuries Recover";
		this.m.Description = "Gives you possibility to recover injuries from you target.";
		this.m.Icon = "ui/perks/skill_priest_blessedrecovery.png";
		this.m.IconDisabled = "ui/perks/skill_priest_blessedrecovery_sw.png";
		this.m.Overlay = "skill_rogue_kick";
		this.m.SoundOnUse = [
			//"sounds/combat/rogue_kick1.wav",
			//"sounds/combat/rogue_kick2.wav",
			//"sounds/combat/rogue_kick3.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 1;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local target = _targetTile.getEntity();
		
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (target == null)
		{
			return false;
		}

		local skills = target.getSkills();
		local brain_damage_injury = (skills.hasSkill("injury.brain_damage"));
		
		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
		}

		local skills = target.getSkills();
		local brain_damage_injury = (skills.hasSkill("injury.brain_damage"));
		if (brain_damage_injury)
		{
			skills.removeByID("injury.brain_damage");
		}

		return true;
	}

});