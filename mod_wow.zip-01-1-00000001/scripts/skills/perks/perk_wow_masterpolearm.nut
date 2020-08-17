/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.05, game_version = 1.4.0.37*/
this.perk_wow_masterpolearm <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.masterpolearm";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterPolearm;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterPolearm;
		this.m.Icon = "ui/perks/perk_mage_masterpolearm.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInPolearms = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.TwoHanded))
		{
			if (_skill.getID() == "actives.impale" || _skill.getID() == "actives.repel" || _skill.getID() == "actives.strike" || _skill.getID() == "actives.reap" || _skill.getID() == "actives.hook")
			{
				_properties.DamageTotalMult *= 1.2;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});