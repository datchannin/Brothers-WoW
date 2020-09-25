/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.priest_blessedrecover_skill <- this.inherit("scripts/skills/skill", {
	m = {
		cut_injuries = true,
		break_injuries = false,
		fracture_injuries = false,
		pierce_injuries = false,
		split_injuries = false,
		permanent_injuries = false,		
	},
	function create()
	{
		this.m.ID = "actives.blessedrecover_skill";
		this.m.Name = "Injuries Recover";
		this.m.Description = "Gives you possibility to recover injuries from you target.";
		this.m.Icon = "ui/perks/skill_priest_blessedrecovery.png";
		this.m.IconDisabled = "ui/perks/skill_priest_blessedrecovery_sw.png";
		this.m.Overlay = "skill_priest_blessedrecovery";
		this.m.SoundOnUse = [
			"sounds/combat/priest_blessedrecover.wav"
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
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 100;
		this.m.MinRange = 0;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		if (this.m.cut_injuries)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are able to recover [color=" + this.Const.UI.Color.DamageValue + "] \'Cut\' [/color] and [color=" + this.Const.UI.Color.DamageValue + "] \'Deep Cut\' [/color] injuries."
			});
		}
		
		if (this.m.break_injuries)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are able to recover [color=" + this.Const.UI.Color.DamageValue + "] \'Break\' [/color] injuries."
			});
		}
		
		if (this.m.fracture_injuries)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are able to recover [color=" + this.Const.UI.Color.DamageValue + "] \'Fracture\' [/color] injuries."
			});
		}

		if (this.m.pierce_injuries)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are able to recover [color=" + this.Const.UI.Color.DamageValue + "] \'Pierce\' [/color] injuries."
			});
		}

		if (this.m.split_injuries)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are able to recover [color=" + this.Const.UI.Color.DamageValue + "] \'Split\' [/color] injuries."
			});
		}

		if (this.m.permanent_injuries)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are able to recover some [color=" + this.Const.UI.Color.DamageValue + "] \'Permanent\' [/color] injuries."
			});
		}

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

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.break_injuries = user.getSkills().hasSkill("perk.wow.priest.recoverybroke");
		this.m.fracture_injuries = user.getSkills().hasSkill("perk.wow.priest.recoveryfracture");
		this.m.pierce_injuries = user.getSkills().hasSkill("perk.wow.priest.recoverypierce");
		this.m.split_injuries = user.getSkills().hasSkill("perk.wow.priest.recoverysplit");
		this.m.permanent_injuries = user.getSkills().hasSkill("perk.wow.priest.recoverymaximum");
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		local skills = target.getSkills();

		if (this.m.cut_injuries)
		{
			skills.removeByID("injury.cut_achilles_tendon");
			skills.removeByID("injury.cut_arm");
			skills.removeByID("injury.cut_arm_sinew");
			skills.removeByID("injury.cut_artery");
			skills.removeByID("injury.cut_leg_muscles");
			skills.removeByID("injury.cut_throat_injury");
			skills.removeByID("injury.deep_abdominal_cut");
			skills.removeByID("injury.deep_chest_cut");
			skills.removeByID("injury.deep_face_cut");
		}

		if (this.m.break_injuries)
		{
			skills.removeByID("injury.broken_arm");
			skills.removeByID("injury.broken_leg");
			skills.removeByID("injury.broken_nose");
			skills.removeByID("injury.broken_ribs");
		}

		if (this.m.fracture_injuries)
		{
			skills.removeByID("injury.fractured_elbow");
			skills.removeByID("injury.fractured_hand");
			skills.removeByID("injury.fractured_ribs");
			skills.removeByID("injury.fractured_skull");
		}

		if (this.m.pierce_injuries)
		{
			skills.removeByID("injury.pierced_arm_muscles");
			skills.removeByID("injury.pierced_cheek");
			skills.removeByID("injury.pierced_chest");
			skills.removeByID("injury.pierced_hand");
			skills.removeByID("injury.pierced_leg_muscles");
			skills.removeByID("injury.pierced_lung");
			skills.removeByID("injury.pierced_side");
		}

		if (this.m.split_injuries)
		{
			skills.removeByID("injury.split_hand");
			skills.removeByID("injury.split_nose");
			skills.removeByID("injury.split_shoulder");
		}

		if (this.m.permanent_injuries)
		{
			skills.removeByID("injury.broken_elbow_joint");
			skills.removeByID("injury.broken_knee");
			skills.removeByID("injury.collapsed_lung_part");
			skills.removeByID("injury.traumatized");
			skills.removeByID("injury.weakened_heart");
			skills.removeByID("injury.brain_damage");
			skills.removeByID("injury.maimed_foot");
		}

		return true;
	}

});