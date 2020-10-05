/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.mage_fireward_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.fireward_skill";
		this.m.Name = "Fire Ward";
		this.m.Description = "Increase character\'s Ranged and Melee Defense for one turn.";
		this.m.Icon = "ui/perks/skill_mage_fireward.png";
		this.m.IconDisabled = "ui/perks/skill_mage_fireward_sw.png";
		this.m.Overlay = "skill_mage_fireward";
		this.m.SoundOnUse = [
			"sounds/combat/mage_fireward_cast.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 15;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color]"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Ranged Defense will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color]"
			},
		];
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		if (!this.getContainer().hasSkill("effects.fireward"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/fireward_effect"));
			return true;
		}

		return false;
	}
});

