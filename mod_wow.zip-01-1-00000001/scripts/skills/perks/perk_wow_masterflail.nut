/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_masterflail <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.masterflail";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterFlail;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterFlail;
		this.m.Icon = "ui/perks/perk_rogue_masterflail.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInFlails = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null)
		{
			if (_skill.getID() == "actives.flail" || _skill.getID() == "actives.lash" || _skill.getID() == "actives.cascade" || _skill.getID() == "actives.hail" || _skill.getID() == "actives.pound" || _skill.getID() == "actives.thresh")
			{
				_properties.DamageTotalMult *= 1.2;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});