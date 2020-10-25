this.token_helmet_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.token_helmet";
		this.m.Name = "Token Helmet";
		this.m.Description = "The base of an ancient helmet once removed from a slain hero. An experienced artisan will be able to turn it into an excellent helmet.";
		this.m.Icon = "misc/inventory_token_helmet.png";
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

