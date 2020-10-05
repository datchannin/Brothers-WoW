/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.perk_wow_masteraxe <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.masteraxe";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterAxe;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterAxe;
		this.m.Icon = "ui/perks/perk_warrior_masteraxe.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInAxes = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null)
		{
			if (_skill.getID() == "actives.round_swing" || _skill.getID() == "actives.split_axe" || _skill.getID() == "actives.split_man" || _skill.getID() == "actives.strike" || _skill.getID() == "actives.chop")
			{
				_properties.DamageTotalMult *= 1.2;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});