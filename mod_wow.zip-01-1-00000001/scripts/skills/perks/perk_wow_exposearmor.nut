/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.perk_wow_exposearmor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.exposearmor";
		this.m.Name = this.Const.Wow_strings.PerkName.ExposeArmor;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ExposeArmor;
		this.m.Icon = "ui/perks/perk_rogue_exposearmor.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		local items = this.getContainer().getActor().getItems();
		local off = items.getItemAtSlot(this.Const.ItemSlot.Offhand);
		local offID;

		if (off != null)
		{
			offID = off.getID();
		}

		if (off == null && !items.hasBlockedSlot(this.Const.ItemSlot.Offhand) || off != null && off.isItemType(this.Const.Items.ItemType.Tool))
		{
			_properties.DamageDirectAdd += 0.1;
		}

		if (offID == "weapon.dagger_off" || offID == "weapon.rondel_dagger_off" || offID == "weapon.qatal_dagger_off")
		{
			_properties.DamageDirectAdd += 0.4;
		}
	}
});