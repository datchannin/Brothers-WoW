/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_mastersword <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.mastersword";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterSword;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterSword;
		this.m.Icon = "ui/perks/perk_warrior_mastersword.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsMasterInSwords = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null)
		{
			if (_skill.getID() == "actives.slash" || _skill.getID() == "actives.decapitate" || _skill.getID() == "actives.gash" || _skill.getID() == "actives.lunge" || _skill.getID() == "actives.slash_lightins" || _skill.getID() == "actives.riposte" || _skill.getID() == "actives.split" || _skill.getID() == "actives.swing" || _skill.getID() == "actives.overhead_strike")
			{
				_properties.DamageTotalMult *= 1.2;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});