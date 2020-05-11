this.perk_wow_master_spear <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.master_spear";
		this.m.Name = this.Const.Wow_strings.PerkName.MasterSpear;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MasterSpear;
		this.m.Icon = "ui/perks/perk_warrior_masterspear.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsMasterInSpears = true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.getID() == "actives.thrust")
		{
			_properties.DamageTotalMult *= 1.2;
			_properties.TargetAttractionMult *= 1.2;
		}
	}
});