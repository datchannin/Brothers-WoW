/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warrior_berserkerrage_skill <- this.inherit("scripts/skills/skill", {
	m = {
		MultValue = 25,
		T0_warrior_head = false
	},
	function create()
	{
		this.m.ID = "actives.berserkerrage_skill";
		this.m.Name = "Berserker Rage";
		this.m.Description = "Increase character\'s power. Damage done will be increased for this turn.";
		this.m.Icon = "ui/perks/skill_warrior_berserkerrage.png";
		this.m.IconDisabled = "ui/perks/skill_warrior_berserkerrage_sw.png";
		this.m.Overlay = "skill_warrior_berserkerrage";
		this.m.SoundOnUse = [
			"sounds/combat/warrior_berserkerrage1.wav",
			"sounds/combat/warrior_berserkerrage2.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 10;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getMultValue()
	{
		local total_mult_value = this.m.MultValue;

		if (this.m.T0_warrior_head)
		{
			total_mult_value += 5;
		}

		return total_mult_value;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local total_mult_value = getMultValue();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Damage done will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + total_mult_value + "%[/color]"
		});

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.berserkerrage");
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.T0_warrior_head = _properties.T0_warrior_head;
	}

	function onUse( _user, _targetTile )
	{
		local total_mult_value = getMultValue();
		local effect = this.new("scripts/skills/effects/berserkerrage_effect");
		effect.setValue(total_mult_value);
		this.m.Container.add(effect);
		//_user.getSkills().add(effect);

		return true;
	}

});

