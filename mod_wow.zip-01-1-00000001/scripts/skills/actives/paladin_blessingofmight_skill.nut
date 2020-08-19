/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.06, game_version = 1.4.0.38*/
this.paladin_blessingofmight_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.blessingofmight_skill";
		this.m.Name = "Blessing of Might";
		this.m.Description = "Increase character\'s power. Damage done is increased by 20% for two turns.";
		this.m.Icon = "ui/perks/skill_paladin_blessingofmight.png";
		this.m.IconDisabled = "ui/perks/skill_paladin_blessingofmight_sw.png";
		this.m.Overlay = "skill_paladin_blessingofmight";
		this.m.SoundOnUse = [
			"sounds/combat/paladin_blessingofmight.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		return [
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
				id = 6,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] for two turns"
			},
		];
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local effect = this.getContainer().getActor().getSkills().getSkillByID("effects.blessingofmight");

		if (effect != null)
		{
			effect.reset();
		}
		else
		{
			this.m.Container.add(this.new("scripts/skills/effects/blessingofmight_effect"));
		}

		return true;
	}
});

