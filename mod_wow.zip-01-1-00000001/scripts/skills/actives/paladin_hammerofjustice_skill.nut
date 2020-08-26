/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.paladin_hammerofjustice_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.hammerofjustice_skill";
		this.m.Name = "Hammer of Justice";
		this.m.Description = "Hit the enemy with Holy Hammer into your enemy and stun him for one turn.";
		this.m.Icon = "ui/perks/skill_paladin_hammerofjustice.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_hammerofjustice_sw.png";
		this.m.Overlay = "skill_paladin_hammerofjustice";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_hammerofjustice.wav"
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
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
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