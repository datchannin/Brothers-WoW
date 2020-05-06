this.stunimmune_effect <- this.inherit("scripts/skills/skill", {
	m = {
		IsEnabled = true,
	},
	function create()
	{
		this.m.ID = "effects.stun_immune";
		this.m.Name = "Stun Immunity";
		this.m.Description = "Being Master of Shields allow this character ignore stun effects.";
		this.m.Icon = "ui/perks/perk_01.png";
		this.m.IconMini = "perk_01_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onUpdate( _properties )
	{
		if (this.m.IsEnabled)
		{
			_properties.IsImmuneToStun = true;
		}
	}

});