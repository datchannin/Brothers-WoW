this.mobility_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.mobility";
		this.m.Name = "Mobility";
		this.m.Description = "Focus on this battle. Do more, but pay the full price.";
		this.m.Icon = "ui/perks/perk_54_active.png";
		this.m.IconDisabled = "ui/perks/perk_54_active_sw.png";
		this.m.Overlay = "perk_54_active";
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = [
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
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Current Fatigue is increased by 30"
			}
		];
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		_user.setActionPoints(this.Math.min(_user.getActionPointsMax(), _user.getActionPoints() + 2));

		if (!_user.isHiddenToPlayer())
		{
		//	_user.playSound(this.Const.Sound.ActorEvent.Fatigue, this.Const.Sound.Volume.Actor * _user.getSoundVolume(this.Const.Sound.ActorEvent.Fatigue));
		}

		return true;
	}

});

