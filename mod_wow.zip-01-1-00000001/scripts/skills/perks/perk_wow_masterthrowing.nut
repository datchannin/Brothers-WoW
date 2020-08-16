/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.04, game_version = 1.4.0.36*/
this.perk_wow_masterthrowing <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.masterthrowing";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterThrowing;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterThrowing;
		this.m.Icon = "ui/perks/perk_hunter_masterthrowing.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInThrowing = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.RangedWeapon))
		{
			if (_skill.getID() == "actives.throw_javelin" || _skill.getID() == "actives.throw_axe" || _skill.getID() == "actives.throw_balls" || _skill.getID() == "actives.throw_spear_skill")
			{
				_properties.DamageTotalMult *= 1.2;
			}
		}
	}
});