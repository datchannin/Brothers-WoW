/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.41*/
this.perk_wow_toughness <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.toughness";
		this.m.Name = this.Const.Wow_strings.PerkName.Toughness;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Toughness;
		this.m.Icon = "ui/perks/perk_warrior_toughness.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill != null && !_skill.isAttack())
		{
			return;
		}

		local armor = this.getContainer().getActor().getArmor(this.Const.BodyPart.Head) + this.getContainer().getActor().getArmor(this.Const.BodyPart.Body);
		_properties.DamageReceivedArmorMult *= 0.97;
	}

});