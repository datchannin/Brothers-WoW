this.rogue_disarm_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.rogue_disarm_skill";
		this.m.Name = "Disarm";
		this.m.Description = "Disarm an opponent. The hit does not damage, but temporarily disarm an target. A disarmed enemy can not use any weapon skills, but may still use other skills and move freely. Unarmed targets can not be disarmed.";
		this.m.Icon = "skills/active_170.png";
		this.m.IconDisabled = "skills/active_170_sw.png";
		this.m.Overlay = "active_170";
		this.m.SoundOnUse = [
			//"sounds/combat/dlc4/whip_01.wav",
			//"sounds/combat/dlc4/whip_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.skill.getDefaultUtilityTooltip();

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]80%[/color] chance to disarm on a hit"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		if (this.Math.rand(1, 100) < 21)
		{
			if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " has resisted disarm skill");
			}
			return false;
		}

		local target = _targetTile.getEntity();

		if (!target.getCurrentProperties().IsStunned && !target.getCurrentProperties().IsImmuneToDisarm)
		{
			target.getSkills().add(this.new("scripts/skills/effects/disarmed_effect"));

			if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has disarmed " + this.Const.UI.getColorizedEntityName(target) + " for one turn");
			}

			return true;
		}
		else
		{
			return false;
		}
	}
});