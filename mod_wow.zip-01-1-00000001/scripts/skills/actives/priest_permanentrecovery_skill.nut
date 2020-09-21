/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.priest_permanentrecovery_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseChance = 20,
		luckyrecovery = false
	},
	function create()
	{
		this.m.ID = "actives.permanentrecovery_skill";
		this.m.Name = "Permanent Recovery";
		this.m.Description = "Gives you possibility to recover some kind of \'Permanent\' injuries from you target.";
		this.m.Icon = "ui/perks/skill_priest_permanentrecovery.png";
		this.m.IconDisabled = "ui/perks/skill_priest_permanentrecovery_sw.png";
		this.m.Overlay = "skill_priest_permanentrecovery";
		this.m.SoundOnUse = [
			"sounds/combat/priest_blessedrecover.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 100;
		this.m.MinRange = 0;
		this.m.MaxRange = 1;
	}

	function GetTotalChance()
	{
		local chance = this.m.BaseChance;

		if (this.m.luckyrecovery)
		{
			chance += 20;
		}

		return chance;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local chance = GetTotalChance();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "You are able to recover some [color=" + this.Const.UI.Color.DamageValue + "] \'Permanent\' [/color] injuries."
		});
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Chance to recover is [color=" + this.Const.UI.Color.PositiveValue + "]" + chance + "%[/color] for every injury independently."
		});

		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local target = _targetTile.getEntity();
		
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (target == null)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.luckyrecovery = user.getSkills().hasSkill("perk.wow.priest.luckyrecovery");
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		local skills = target.getSkills();
		local chance = GetTotalChance();
		local r = 0;

		this.spawnIcon("effect_priest_permanentrecovery", _targetTile);

		r = this.Math.rand(0, 99);
		if (r <= chance)
		{
			skills.removeByID("injury.broken_elbow_joint");
		}

		r = this.Math.rand(0, 99);
		if (r <= chance)
		{
			skills.removeByID("injury.broken_knee");
		}
		
		r = this.Math.rand(0, 99);
		if (r <= chance)
		{
			skills.removeByID("injury.collapsed_lung_part");
		}
		
		r = this.Math.rand(0, 99);
		if (r <= chance)
		{
			skills.removeByID("injury.traumatized");
		}
		
		r = this.Math.rand(0, 99);
		if (r <= chance)
		{
			skills.removeByID("injury.weakened_heart");
		}
		
		r = this.Math.rand(0, 99);
		if (r <= chance)
		{
			skills.removeByID("injury.brain_damage");
		}
		
		r = this.Math.rand(0, 99);
		if (r <= chance)
		{
			skills.removeByID("injury.maimed_foot");
		}

		return true;
	}

});