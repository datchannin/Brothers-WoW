this.perk_wow_petsummon <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "perk.wow.hunter.petsummon";
		this.m.Name = this.Const.Wow_strings.PerkName.PetSummon;
		this.m.Description = this.Const.Wow_strings.PerkDescription.PetSummon;
		this.m.Icon = "ui/perks/perk_hunter_petsummon.png";
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