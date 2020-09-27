/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.offdagger_effect <- this.inherit("scripts/skills/skill", {
	m = {
		PunctureBonus = 5,
		ChopBonus = 9,
		FlailBonus = 15,
		SlashBonus = 20
	},
	function create()
	{
		this.m.ID = "effects.offdagger";
		this.m.Name = "Offhand Dagger";
		this.m.Icon = "ui/perks/perk_rogue_camouflage.png";
		this.m.IconMini = "effect_mini_camouflage";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = true;
	}

	function setPunctureBonus ( _d )
	{
		this.m.PunctureBonus = _d;
	}
	function setChopBonus ( _d )
	{
		this.m.ChopBonus = _d;
	}
	function setFlailBonus ( _d )
	{
		this.m.FlailBonus = _d;
	}
	function setSlashBonus ( _d )
	{
		this.m.SlashBonus = _d;
	}

	function getDescription()
	{
		return "This character uses additional offhand dagger. His mainhand weapon skills accept new effects.";
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
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsImmuneToDisarm = true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local slash_percent = this.m.SlashBonus * 0.01;

		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.OneHanded))
		{
			if (_skill.getID() == "actives.puncture")
			{
				_properties.MeleeSkill += this.m.PunctureBonus;
			}
			if (_skill.getID() == "actives.chop")
			{
				_properties.HitChance[this.Const.BodyPart.Head] += this.m.ChopBonus;
			}
			if (_skill.getID() == "actives.slash")
			{
				_properties.DamageTotalMult *= (1 + slash_percent);
			}
			if (_skill.getID() == "actives.flail")
			{
				_properties.DamageDirectAdd += this.m.FlailBonus;
			}
		}
	}
});