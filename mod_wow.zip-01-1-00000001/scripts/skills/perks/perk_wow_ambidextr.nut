/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_ambidextr <- this.inherit("scripts/skills/skill", {
	m = {
		BaseValue = 5,
		RogueLevel = 1
	},
	function create()
	{
		this.m.ID = "perk.wow.rogue.ambidextr";
		this.m.Name = this.Const.Wow_strings.PerkName.Ambidextr;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Ambidextr;
		this.m.Icon = "ui/perks/perk_rogue_ambidextr.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getValue()
	{
		local result = this.m.BaseValue;
		local scale_value = 0;

		scale_value = this.m.RogueLevel * this.Const.RogueScale.ambidextr;

		result += scale_value;
		
		return result;
	}

	function getDescription()
	{
		local value = getValue();
	
		return "You have a natural ability to use a weapon in your off hand. You deal additional [color=" + this.Const.UI.Color.PositiveValue + "]" + value + "%[/color] damage";
	}

	function canDealAdditionalDamage()
	{
		local off = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		local offID;

		if (off != null)
		{
			offID = off.getID();
		}
		else
		{
			return 0;
		}

		if (offID == "weapon.dagger_off" || offID == "weapon.rondel_dagger_off" || offID == "weapon.qatal_dagger_off")
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}

	function isHidden()
	{
		return this.skill.isHidden() || !this.canDealAdditionalDamage();
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.RogueLevel = user.getLevel();
		local value = getValue();
		local value_percant = value * 0.01;

		if (this.canDealAdditionalDamage())
		{
			_properties.MeleeDamageMult *= (1 + value_percant);
		}
	}
});