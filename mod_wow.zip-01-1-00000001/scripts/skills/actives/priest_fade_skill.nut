/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.priest_fade_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.fade_skill";
		this.m.Name = "Fade";
		this.m.Description = "Fade out and ignore hostile zone of control for one turn.";
		this.m.Icon = "ui/perks/skill_priest_fade.png";
		this.m.IconDisabled = "ui/perks/skill_priest_fade_sw.png";
		this.m.Overlay = "skill_priest_fade";
		this.m.SoundOnUse = [
			"sounds/combat/priest_fade.ogg"
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
		if (!this.getContainer().hasSkill("effects.fade"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/fade_effect"));
			return true;
		}

		return false;
	}
});

