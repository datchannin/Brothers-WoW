/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
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
		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.OneHanded))
		{
			if (_skill.getID() == "actives.slash" || _skill.getID() == "actives.decapitate" || _skill.getID() == "actives.gash" || _skill.getID() == "actives.lunge" || _skill.getID() == "actives.slash_lightins")
			{
				_properties.DamageTotalMult *= 1.2;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});