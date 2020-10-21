/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
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
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 12;
		this.m.MinRange = 0;
		this.m.MaxRange = 4;
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
		local targetEntity = _targetTile.getEntity();

		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (targetEntity == null)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(targetEntity))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();

		local effect = targetEntity.getSkills().getSkillByID("effects.blessingofmight");
		this.spawnIcon("effect_paladin_blessingofmight", targetEntity.getTile());

		if (effect != null)
		{
			effect.reset();
		}
		else
		{
			targetEntity.getSkills().add(this.new("scripts/skills/effects/blessingofmight_effect"));
		}

		return true;
	}
});

