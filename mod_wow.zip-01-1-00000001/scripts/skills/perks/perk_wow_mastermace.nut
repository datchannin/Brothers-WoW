/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.perk_wow_mastermace <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.mastermace";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterMace;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterMace;
		this.m.Icon = "ui/perks/perk_rogue_mastermace.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInMaces = true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand != null)
		{
			if (_skill.getID() == "actives.knock_out" || _skill.getID() == "actives.bash" || _skill.getID() == "actives.cudgel" || _skill.getID() == "actives.strike_down" || _skill.getID() == "actives.crumble" || _skill.getID() == "actives.knock_over")
			{
				_properties.DamageTotalMult *= 1.2;
				_properties.TargetAttractionMult *= 1.2;
			}
		}
	}
});