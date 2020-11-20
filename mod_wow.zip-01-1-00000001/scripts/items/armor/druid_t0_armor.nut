/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.druid_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.druid_t0_armor";
		this.m.Name = "Wildheart Vest";
		this.m.Description = "Druid armor. Colors of Nature and Emerald Dream.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 3000;
		this.m.Condition = 220;
		this.m.ConditionMax = 220;
		this.m.StaminaModifier = -20;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_druid_body_" + variant;
		this.m.SpriteDamaged = "bust_wow_druid_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_druid_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_wow_druid_body_" + variant + ".png";
		this.m.Icon = "armor/icon_wow_druid_body_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.armor.getTooltip();

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Set bonus: [color=" + this.Const.UI.Color.PositiveValue + "]\'Heart of Wild\'[/color] doubles bonuses for Cat and Bear, [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] [color=" + this.Const.UI.Color.PositiveValue + "]\'Innervate\'[/color] power"
		});

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Furor\'[/color] decreases shapeshift fatigue cost by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] points"
		});

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.armor.onUpdateProperties(_properties);
		_properties.T0_druid_armor = true;
	}
});