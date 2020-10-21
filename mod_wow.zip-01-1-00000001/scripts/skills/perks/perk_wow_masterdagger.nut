/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_masterdagger <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.masterdagger";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterDagger;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterDagger;
		this.m.Icon = "ui/perks/perk_rogue_masterdagger.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInDaggers = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.OneHanded))
		{
			if (_skill.getID() == "actives.stab" || _skill.getID() == "actives.puncture")
			{
				_properties.DamageTotalMult *= 1.1;
				_properties.DamageDirectAdd += 0.1;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});