/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.druid_bearform_skill <- this.inherit("scripts/skills/skill", {
	m = {
		furor = false
	},
	function create()
	{
		this.m.ID = "actives.bearform_skill";
		this.m.Name = "Shapeshift into bear form";
		this.m.Description = "Enables the druid to shapeshift into a bear, this skill requires free hands";
		this.m.Icon = "ui/perks/skill_druid_bearform.png";
		this.m.IconDisabled = "ui/perks/skill_druid_bearform_sw.png";
		this.m.Overlay = "skill_druid_bearform";
		this.m.SoundOnUse = [
			"sounds/combat/druid_bearform.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
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
			text = "Shapeshift into a bear. Your mind should stay under your control."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/feral2.png",
			text = "Requires free hands."
		});

		if (this.m.Container.hasSkill("effects.bearform"))
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
			if ((!this.m.Container.hasSkill("effects.catform")) && (!this.m.Container.hasSkill("effects.moonfury")))
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
				if (this.m.Container.hasSkill("effects.catform") || (this.m.Container.hasSkill("effects.moonfury")))
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

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.furor = user.getSkills().hasSkill("perk.wow.druid.furor");
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.furor)
		{
			this.m.FatigueCost = 15;
		}
	}

	function onUse( _user, _targetTile )
	{
		if (!this.m.Container.hasSkill("actives.maul_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_maul_skill"));
		}

		if (!this.m.Container.hasSkill("actives.bash_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/druid_bash_skill"));
		}

		if (!this.m.Container.hasSkill("actives.hand_to_hand"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/hand_to_hand"));
		}

		if (this.m.Container.hasSkill("perk.wow.druid.giftofnature"))
		{
			if (!this.m.Container.hasSkill("actives.frenziedregeneration_skill"))
			{
				this.m.Container.add(this.new("scripts/skills/actives/druid_frenziedregeneration_skill"));
			}
		}

		if (!this.m.Container.hasSkill("effects.bearform"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/bearform_effect"));
			this.m.Container.removeByID("actives.hand_to_hand");
		}
		else
		{
			this.m.Container.removeByID("effects.bearform");
			this.m.Container.removeByID("effects.barkskin");
			this.m.Container.removeByID("actives.maul_skill");
			this.m.Container.removeByID("actives.bash_skill");
			this.m.Container.removeByID("actives.frenziedregeneration_skill");
		}
	}
});

