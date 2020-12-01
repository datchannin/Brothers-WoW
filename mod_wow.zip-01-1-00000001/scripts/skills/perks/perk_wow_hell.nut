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
				_properties.HitpointsMult *= this.Const.HitpointsScase.day10;
			}
			else if (current_day <= 30)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day30;
			}
			else if (current_day <= 50)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day50;
			}
			else if (current_day <= 70)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day70;
			}
			else if (current_day <= 90)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day90;
			}
			else if (current_day <= 110)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day110;
			}
			else if (current_day <= 130)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day130;
			}
			else if (current_day <= 150)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day150;
			}
			else if (current_day <= 170)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day170;
			}
			else if (current_day <= 190)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day190;
			}
			else if (current_day <= 210)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day210;
			}
			else if (current_day <= 230)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day230;
			}
			else if (current_day <= 250)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day250;
			}
			else if (current_day <= 270)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day270;
			}
			else if (current_day <= 290)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day290;
			}
			else if (current_day <= 310)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day310;
			}
			else if (current_day <= 330)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day330;
			}
			else if (current_day <= 350)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day350;
			}
			else if (current_day <= 370)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day370;
			}
			else if (current_day <= 390)
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day390;
			}
			else
			{
				_properties.HitpointsMult *= this.Const.HitpointsScase.day400;
			}
		}
	}
});