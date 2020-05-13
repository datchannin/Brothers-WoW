this.warrior_berserkerrage_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.berserkerrage_skill";
		this.m.Name = "Berserker Rage";
		this.m.Description = "Increase character\'s power. Damage done is increased by 25%.";
		this.m.Icon = "ui/perks/perk_warrior_berserkerrage.png";
		this.m.IconDisabled = "ui/perks/perk_warrior_berserkerrage_sw.png";
		this.m.Overlay = "perk_warrior_berserkerrage";
		this.m.SoundOnUse = [
			"sounds/combat/indomitable_01.wav",
			"sounds/combat/indomitable_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 25;
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
				text = "Damage done will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			},
		];
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.warrior_berserkerrage");
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		if (!this.getContainer().hasSkill("effects.warrior_berserkerrage"))
		{
			//this.m.Container.add(this.new("scripts/skills/effects/berserkerrage_effect"));
			return true;
		}

		return false;
	}

});

