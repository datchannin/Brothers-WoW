/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.rogue_camouflage_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.camouflage_skill";
		this.m.Name = "Camouflage";
		this.m.Description = "Increase character\'s Melee Defense for this turn and allows to ignore hostile zone of control.";
		this.m.Icon = "ui/perks/skill_rogue_camouflage.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_camouflage_sw.png";
		this.m.Overlay = "skill_rogue_camouflage";
		this.m.SoundOnUse = [
			"sounds/combat/rogue_camouflage.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 25;
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
		];
	}

	function onUse( _user, _targetTile )
	{
		if (!this.getContainer().hasSkill("effects.camouflage"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/camouflage_effect"));
			return true;
		}

		return false;
	}
});