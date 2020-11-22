/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.hunter_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.hunter_t0_armor";
		this.m.Name = "Beaststalker\'s Tunic";
		this.m.Description = "Hunting armor. Wild beasts can\'t pierce this tunic.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 6500;
		this.m.Condition = 300;
		this.m.ConditionMax = 300;
		this.m.StaminaModifier = -28;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_hunter_body_" + variant;
		this.m.SpriteDamaged = "bust_wow_hunter_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_hunter_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_wow_hunter_body_" + variant + ".png";
		this.m.Icon = "armor/icon_wow_hunter_body_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.armor.getTooltip();

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Set bonus: [color=" + this.Const.UI.Color.PositiveValue + "]\'Mend Pet\'[/color] base power will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color]"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Set bonus: [color=" + this.Const.UI.Color.PositiveValue + "]\'Bestial Wrath\'[/color] effect will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]"
		});

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Hunter\'s Mark\'[/color] increases efficiency by [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color]"
		});

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.armor.onUpdateProperties(_properties);
		_properties.T0_hunter_armor = true;
	}
});