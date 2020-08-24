/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.rogue_kidneyshot_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.kidneyshot_skill";
		this.m.Name = "Kidney Shot";
		this.m.Description = "Hit the enemy in the kidneys. This move stuns target.";
		this.m.Icon = "ui/perks/skill_rogue_kidneyshot.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_kidneyshot_sw.png";
		this.m.Overlay = "skill_rogue_kidneyshot";
		this.m.SoundOnUse = [
			"sounds/combat/rogue_kidneyshot.wav"
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
			text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]100%[/color] chance to stun on a hit if target does not have immunity to stun effects."
		});
		return ret;
	}

	function onVerifyTarget( _userTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_userTile, _targetTile))
		{
			return false;
		}

		if (_targetTile.getEntity().getCurrentProperties().IsStunned)
		{
			return false;
		}

		if (_targetTile.getEntity().getCurrentProperties().IsImmuneToStun)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		target.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));

		if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " stunned " + this.Const.UI.getColorizedEntityName(target) + " for one turn");
		}

		return true;
	}
});