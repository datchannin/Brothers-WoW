/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.paladin_divineshield_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Delay = 0
	},
	function create()
	{
		this.m.ID = "actives.divineshield";
		this.m.Name = "Divine Shield";
		this.m.Description = "Ask \'Light\' to buff your friend with Immunity for one turn. You can do it with one turn delay.";
		this.m.Icon = "ui/perks/skill_paladin_divineshield.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_divineshield_sw.png";
		this.m.Overlay = "skill_paladin_divineshield";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_divineshield.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 2;
	}

	function getTooltip()
	{
		local ret = this.skill.getDefaultUtilityTooltip();

		ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Power your target with Immunity for one turn."
		});
		
		if (this.m.Delay > 0)
		{
			ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Skill should to be recharged. You can not ask \'Light\' about this buff now."
			});
		}
		return ret;
	}

	function isUsable()
	{
		if (this.m.Delay == 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();
		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Delay = 2;
		local targetEntity = _targetTile.getEntity();

		this.spawnIcon("effect_paladin_divineshield", _targetTile);

		targetEntity.getSkills().add(this.new("scripts/skills/effects/divineshield_effect"));
		return true;
	}

	function onTurnEnd()
	{
		if (this.m.Delay > 0)
		{
			this.m.Delay--;
		}
		else
		{
			this.m.Delay = 0;
		}
	}
});