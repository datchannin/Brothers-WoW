/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.druid_bash_skill <- this.inherit("scripts/skills/skill", {
	m = {
		heartofwild = false
	},
	function create()
	{
		this.m.ID = "actives.bash_skill";
		this.m.Name = "Bash";
		this.m.Description = "Bear stuns the target with his mass.";
		this.m.Icon = "ui/perks/skill_druid_bash.png";
		this.m.IconDisabled = "ui/perks/skill_druid_bash_sw.png";
		this.m.Overlay = "skill_druid_bash";
		this.m.SoundOnUse = [
			"sounds/combat/druid_bash.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 20;
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

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.bearform"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
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

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.heartofwild = user.getSkills().hasSkill("perk.wow.druid.heartofwild");
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		target.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));

		if (this.m.heartofwild)
		{
			local effect = target.getSkills().getSkillByID("effects.stunned");
			effect.addTurns(1);
			if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " stunned " + this.Const.UI.getColorizedEntityName(target) + " for two turns");
			}
		}
		else
		{
			if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " stunned " + this.Const.UI.getColorizedEntityName(target) + " for one turn");
			}
		}

		return true;
	}
});