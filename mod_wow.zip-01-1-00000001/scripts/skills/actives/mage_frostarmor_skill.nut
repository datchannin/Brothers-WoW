/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.05, game_version = 1.4.0.37*/
this.mage_frostarmor_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.frostarmor_skill";
		this.m.Name = "Frost Armor";
		this.m.Description = "Allows character to ignore hostile zone of control for one turn.";
		this.m.Icon = "ui/perks/skill_mage_frostarmor.png";
		this.m.IconDisabled = "ui/perks/skill_mage_frostarmor_sw.png";
		this.m.Overlay = "skill_mage_frostarmor";
		this.m.SoundOnUse = [
			"sounds/combat/mage_frostarmor_cast.wav"
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
				icon = "ui/icons/special.png",
				text = "Ignores hostile Zone of Control"
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
		if (!this.getContainer().hasSkill("effects.frostarmor"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/frostarmor_effect"));
			return true;
		}

		return false;
	}
});

