/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.druid_moonfury_skill <- this.inherit("scripts/skills/skill", {
	m = {
		baseActionPointsCost = 9,
		furor = false,
		T0_druid_armor = false,
		T0_druid_head = false
	},
	function create()
	{
		this.m.ID = "actives.moonfury_skill";
		this.m.Name = "Moonfury";
		this.m.Description = "Enables the druid to get into moonfury state. This state helps him to use Nature abilities and grants \'Innervate\' skill.";
		this.m.Icon = "ui/perks/skill_druid_moonfury.png";
		this.m.IconDisabled = "ui/perks/skill_druid_moonfury_sw.png";
		this.m.Overlay = "skill_druid_moonfury";
		this.m.SoundOnUse = [
			"sounds/combat/druid_moonfury.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = (this.Const.SkillOrder.Any+1);
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enables the moonfury state."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Grants \'Innervate\' skill."
		});

		if (this.m.Container.hasSkill("effects.moonfury"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are already under moonfury effect. Use this skill again to remove the effect."
			});
		}

		return ret;
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			if ((!this.m.Container.hasSkill("effects.bearform")) && (!this.m.Container.hasSkill("effects.catform")))
			{
				return true;
			}
		}

		return false;
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (this.m.Container.hasSkill("effects.catform") || (this.m.Container.hasSkill("effects.bearform")))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.furor = user.getSkills().hasSkill("perk.wow.druid.furor");
		this.m.T0_druid_armor = _properties.T0_druid_armor;
		this.m.T0_druid_head = _properties.T0_druid_head;
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.furor)
		{
			this.m.FatigueCost = 15;
			if (this.m.T0_druid_armor)
			{
				this.m.FatigueCost = 0;
			}
			if (this.m.T0_druid_head)
			{
				this.m.ActionPointCost = 0;
			}
		}
		else
		{
			this.m.FatigueCost = 30;
			this.m.ActionPointCost = 9;
		}
	}

	function onUse( _user, _targetTile )
	{			
		if (!this.m.Container.hasSkill("actives.innervate_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_innervate_skill"));
		}

		if (this.m.Container.hasSkill("perk.wow.druid.giftofnature"))
		{
			if (!this.m.Container.hasSkill("actives.rejuvenation_skill"))
			{
				this.m.Container.add(this.new("scripts/skills/actives/druid_rejuvenation_skill"));
			}
		}

		if (!this.m.Container.hasSkill("effects.moonfury"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/moonfury_effect"));
		}
		else
		{
			this.m.Container.removeByID("effects.moonfury");
			this.m.Container.removeByID("effects.barkskin");
			this.m.Container.removeByID("actives.innervate_skill");
			this.m.Container.removeByID("actives.rejuvenation_skill");
		}
	}
});

