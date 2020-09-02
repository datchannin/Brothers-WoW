/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.stunimmune_effect <- this.inherit("scripts/skills/skill", {
	m = {
		IsEnabled = true,
	},
	function create()
	{
		this.m.ID = "effects.stun_immune";
		this.m.Name = "Stun Immunity";
		this.m.Description = "Being Master of Shields allow this character ignore stun effects.";
		this.m.Icon = "ui/perks/effect_warrior_stunimmunity.png";
		this.m.IconMini = "effect_mini_stunimmunity";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
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
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Immune to being stunned"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (this.m.IsEnabled)
		{
			_properties.IsImmuneToStun = true;
		}
	}

});