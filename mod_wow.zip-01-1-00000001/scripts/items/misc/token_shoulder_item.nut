this.token_shoulder_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.token_shoulder";
		this.m.Name = "Token Shoulder";
		this.m.Description = "The base of an ancient shoulder once removed from a slain hero. An experienced artisan will be able to turn it into an excellent shoulder.";
		this.m.Icon = "misc/inventory_token_shoulder.png";
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

