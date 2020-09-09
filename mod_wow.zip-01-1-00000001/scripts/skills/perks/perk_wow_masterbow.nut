/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.perk_wow_masterbow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.masterbow";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterBow;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterBow;
		this.m.Icon = "ui/perks/perk_hunter_masterbow.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInBow = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.RangedWeapon))
		{
			if (_skill.getID() == "actives.quick_shot" || _skill.getID() == "actives.aimed_shot")
			{
				_properties.DamageTotalMult *= 1.2;
			}
		}
	}
});