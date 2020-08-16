/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.04, game_version = 1.4.0.36*/
this.perk_wow_masterhammer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.masterhammer";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterHammer;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterHammer;
		this.m.Icon = "ui/perks/perk_warrior_masterhammer.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsMasterInHammers = true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null && mainhand.isItemType(this.Const.Items.ItemType.TwoHanded))
		{
			if (_skill.getID() == "actives.batter" || _skill.getID() == "actives.shatter" || _skill.getID() == "actives.smite")
			{
				_properties.DamageTotalMult *= 1.2;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});