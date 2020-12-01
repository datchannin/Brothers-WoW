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
		local current_day = this.World.getTime().Days;

		if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Hell)
		{
			if (current_day <= 10)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day10;
				_properties.Stamina += this.Const.StaminaScale.day10;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day10;
				_properties.Bravery += this.Const.BraveryScale.day10;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day10;
				_properties.RangedSkill += this.Const.RangedSkillScale.day10;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day10;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day10;
			}
			else if (current_day <= 30)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day30;
				_properties.Stamina += this.Const.StaminaScale.day30;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day30;
				_properties.Bravery += this.Const.BraveryScale.day30;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day30;
				_properties.RangedSkill += this.Const.RangedSkillScale.day30;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day30;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day30;
			}
			else if (current_day <= 50)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day50;
				_properties.Stamina += this.Const.StaminaScale.day50;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day50;
				_properties.Bravery += this.Const.BraveryScale.day50;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day50;
				_properties.RangedSkill += this.Const.RangedSkillScale.day50;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day50;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day50;
			}
			else if (current_day <= 70)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day70;
				_properties.Stamina += this.Const.StaminaScale.day70;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day70;
				_properties.Bravery += this.Const.BraveryScale.day70;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day70;
				_properties.RangedSkill += this.Const.RangedSkillScale.day70;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day70;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day70;
			}
			else if (current_day <= 90)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day90;
				_properties.Stamina += this.Const.StaminaScale.day90;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day90;
				_properties.Bravery += this.Const.BraveryScale.day90;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day90;
				_properties.RangedSkill += this.Const.RangedSkillScale.day90;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day90;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day90;
			}
			else if (current_day <= 110)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day110;
				_properties.Stamina += this.Const.StaminaScale.day110;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day110;
				_properties.Bravery += this.Const.BraveryScale.day110;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day110;
				_properties.RangedSkill += this.Const.RangedSkillScale.day110;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day110;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day110;
			}
			else if (current_day <= 130)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day130;
				_properties.Stamina += this.Const.StaminaScale.day130;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day130;
				_properties.Bravery += this.Const.BraveryScale.day130;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day130;
				_properties.RangedSkill += this.Const.RangedSkillScale.day130;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day130;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day130;
			}
			else if (current_day <= 150)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day150;
				_properties.Stamina += this.Const.StaminaScale.day150;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day150;
				_properties.Bravery += this.Const.BraveryScale.day150;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day150;
				_properties.RangedSkill += this.Const.RangedSkillScale.day150;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day150;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day150;
			}
			else if (current_day <= 170)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day170;
				_properties.Stamina += this.Const.StaminaScale.day170;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day170;
				_properties.Bravery += this.Const.BraveryScale.day170;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day170;
				_properties.RangedSkill += this.Const.RangedSkillScale.day170;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day170;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day170;
			}
			else if (current_day <= 190)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day190;
				_properties.Stamina += this.Const.StaminaScale.day190;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day190;
				_properties.Bravery += this.Const.BraveryScale.day190;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day190;
				_properties.RangedSkill += this.Const.RangedSkillScale.day190;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day190;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day190;
			}
			else if (current_day <= 210)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day210;
				_properties.Stamina += this.Const.StaminaScale.day210;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day210;
				_properties.Bravery += this.Const.BraveryScale.day210;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day210;
				_properties.RangedSkill += this.Const.RangedSkillScale.day210;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day210;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day210;
			}
			else if (current_day <= 230)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day230;
				_properties.Stamina += this.Const.StaminaScale.day230;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day230;
				_properties.Bravery += this.Const.BraveryScale.day230;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day230;
				_properties.RangedSkill += this.Const.RangedSkillScale.day230;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day230;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day230;
			}
			else if (current_day <= 250)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day250;
				_properties.Stamina += this.Const.StaminaScale.day250;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day250;
				_properties.Bravery += this.Const.BraveryScale.day250;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day250;
				_properties.RangedSkill += this.Const.RangedSkillScale.day250;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day250;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day250;
			}
			else if (current_day <= 270)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day270;
				_properties.Stamina += this.Const.StaminaScale.day270;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day270;
				_properties.Bravery += this.Const.BraveryScale.day270;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day270;
				_properties.RangedSkill += this.Const.RangedSkillScale.day270;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day270;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day270;
			}
			else if (current_day <= 290)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day290;
				_properties.Stamina += this.Const.StaminaScale.day290;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day290;
				_properties.Bravery += this.Const.BraveryScale.day290;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day290;
				_properties.RangedSkill += this.Const.RangedSkillScale.day290;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day290;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day290;
			}
			else if (current_day <= 310)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day310;
				_properties.Stamina += this.Const.StaminaScale.day310;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day310;
				_properties.Bravery += this.Const.BraveryScale.day310;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day310;
				_properties.RangedSkill += this.Const.RangedSkillScale.day310;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day310;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day310;
			}
			else if (current_day <= 330)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day330;
				_properties.Stamina += this.Const.StaminaScale.day330;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day330;
				_properties.Bravery += this.Const.BraveryScale.day330;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day330;
				_properties.RangedSkill += this.Const.RangedSkillScale.day330;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day330;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day330;
			}
			else if (current_day <= 350)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day350;
				_properties.Stamina += this.Const.StaminaScale.day350;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day350;
				_properties.Bravery += this.Const.BraveryScale.day350;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day350;
				_properties.RangedSkill += this.Const.RangedSkillScale.day350;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day350;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day350;
			}
			else if (current_day <= 370)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day370;
				_properties.Stamina += this.Const.StaminaScale.day370;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day370;
				_properties.Bravery += this.Const.BraveryScale.day370;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day370;
				_properties.RangedSkill += this.Const.RangedSkillScale.day370;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day370;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day370;
			}
			else if (current_day <= 390)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day390;
				_properties.Stamina += this.Const.StaminaScale.day390;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day390;
				_properties.Bravery += this.Const.BraveryScale.day390;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day390;
				_properties.RangedSkill += this.Const.RangedSkillScale.day390;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day390;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day390;
			}
			else
			{
				_properties.HitpointsMult *= this.Const.HitpointsScale.day400;
				_properties.Stamina += this.Const.StaminaScale.day400;
				_properties.FatigueRecoveryRate += this.Const.FatigueRecoveryScale.day400;
				_properties.Bravery += this.Const.BraveryScale.day400;
				_properties.MeleeSkill += this.Const.MeleeSkillScale.day400;
				_properties.RangedSkill += this.Const.RangedSkillScale.day400;
				_properties.MeleeDefense += this.Const.MeleeDefenseScale.day400;
				_properties.RangedDefense += this.Const.RangedDefenseScale.day400;
			}
		}
	}
});