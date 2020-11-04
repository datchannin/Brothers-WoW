/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.mage_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.mage_t0_armor";
		this.m.Name = "Magister\'s Robes";
		this.m.Description = "Robe suitable for Mage daily work. The fabric is hot and the color of a blazing fire.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 1500;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = -12;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_mage_body_" + variant;
		this.m.SpriteDamaged = "bust_wow_mage_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_mage_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_wow_mage_body_" + variant + ".png";
		this.m.Icon = "armor/icon_wow_mage_body_" + variant + ".png";
	}
	
	function getTooltip()
	{
		local result = this.armor.getTooltip();

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Set bonus: [color=" + this.Const.UI.Color.PositiveValue + "]\'Fireball\'[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]\'Frostbolt\'[/color] base power increases by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] points"
		});

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Fire Attunement\'[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]\'Ice Attunement\'[/color] have double effect"
		});

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.armor.onUpdateProperties(_properties);
		_properties.T0_mage_armor = true;
	}
});