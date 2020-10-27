this.warrior_t0_shoulders <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.warrior_t0_shoulders";
		this.m.Name = "Spaulders of Valor";
		this.m.Description = "Solid and heavy metal spaulders protects the warrior\'s neck from all types of weapons.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/icon_wow_warrior_shoulders_01.png";
		this.m.Sprite = "bust_wow_warrior_shoulders_01";
		this.m.Value = 2500;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_halfplate_impact_03.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);
	}

});

