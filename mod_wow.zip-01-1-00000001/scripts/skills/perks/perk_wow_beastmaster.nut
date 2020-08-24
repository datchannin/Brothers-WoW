/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.perk_wow_beastmaster <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "perk.wow.hunter.beastmaster";
		this.m.Name = this.Const.Wow_strings.PerkName.BeastMaster;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BeastMaster;
		this.m.Icon = "ui/perks/perk_hunter_beastmaster.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onCombatStarted()
	{
		this.m.IsSpent = false;
		local actor = this.getContainer().getActor();
		local items = actor.getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Accessory));
		items.equip(this.new("scripts/items/accessory/winterwolf_item"));
		this.skill.onCombatStarted();
	}

	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();
		local items = actor.getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Accessory));
		this.skill.onCombatFinished();
	}	
});