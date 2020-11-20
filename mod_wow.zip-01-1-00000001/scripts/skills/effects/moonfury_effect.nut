/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.moonfury_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.moonfury";
		this.m.Name = "Moonfury";
		this.m.Icon = "ui/perks/perk_druid_moonfury.png";
		this.m.IconMini = "effect_mini_moonfury";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "You are under moonfury effect now. Casting some spells has new effects.";
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

		return ret;
	}

	function onAdded()
	{
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("perk.wow.druid.heartofwild"))
		{
			_properties.FatigueRecoveryRate += 3;
			_properties.Stamina +=10;
		}
	}

	function onRemoved()
	{
	}
});