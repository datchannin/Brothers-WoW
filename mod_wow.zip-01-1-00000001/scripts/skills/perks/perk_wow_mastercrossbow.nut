/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_mastercrossbow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.mastercrossbow";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterCrossbow;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterCrossbow;
		this.m.Icon = "ui/perks/perk_hunter_mastercrossbow.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInCrossbow = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.RangedWeapon))
		{
			if (_skill.getID() == "actives.shoot_bolt" || _skill.getID() == "actives.shoot_stake" || _skill.getID() == "actives.fire_handgonne")
			{
				_properties.DamageTotalMult *= 1.2;
			}
		}
	}
});