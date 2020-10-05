/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.prowl_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.prowl";
		this.m.Name = "Prowl";
		this.m.Icon = "ui/perks/perk_druid_prowl.png";
		this.m.IconMini = "effect_mini_prowl";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character sneaked around for this turn. Effect will be removed if druid removes his cat form.";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Ignores hostile Zone of Control."
		});
	
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.IsImmuneToZoneOfControl = true;
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}
});