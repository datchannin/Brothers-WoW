/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.druid_catform_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.catform_skill";
		this.m.Name = "Shapeshift into cat form";
		this.m.Description = "Enables the druid to shapeshift into a cat, this skill requires free hands";
		this.m.Icon = "ui/perks/skill_druid_catform.png";
		this.m.IconDisabled = "ui/perks/skill_druid_catform_sw.png";
		this.m.Overlay = "skill_druid_catform";
		this.m.SoundOnUse = [
			"sounds/combat/druid_catform.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
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
			text = "Shapeshift into a cat. Your mind should stay under your control."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/feral2.png",
			text = "Requires free hands."
		});

		if (this.m.Container.hasSkill("effects.catform"))
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/feral2.png",
				text = "You are already is under shapeshift effect. Use this again to become human."
			});
		}

		return ret;
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			if ((!this.m.Container.hasSkill("effects.bearform")) && (!this.m.Container.hasSkill("effects.moonfury")))
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
			if (!this.getContainer().getActor().getItems().hasEmptySlot(this.Const.ItemSlot.Mainhand) || !this.getContainer().getActor().getItems().hasEmptySlot(this.Const.ItemSlot.Offhand))
			{
				return true;
			}
			else
			{
				if (this.m.Container.hasSkill("effects.bearform") || (this.m.Container.hasSkill("effects.moonfury")))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		if (!this.m.Container.hasSkill("actives.druid_claws_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_claws_skill"));
		}

		if (!this.m.Container.hasSkill("actives.hand_to_hand"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/hand_to_hand"));
		}

		if (!this.m.Container.hasSkill("actives.tigersfury_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_tigersfury_skill"));
		}

		if (!this.m.Container.hasSkill("effects.catform"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/catform_effect"));
			this.m.Container.removeByID("actives.hand_to_hand");
		}
		else
		{
			this.m.Container.removeByID("effects.catform");
			this.m.Container.removeByID("actives.druid_claws_skill");
			this.m.Container.removeByID("actives.tigersfury_skill");
		}
	}
});

