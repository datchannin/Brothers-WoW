this.inventory_badge_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.badge";
		this.m.Name = "Ancient Badge";
		this.m.Description = "Can be found in dangerous dungeons. Exchanges for item tokens that can be used for Item Sets create.";
		this.m.Icon = "misc/inventory_badge_item.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 2000;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
	}

});

