/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.paladin_t0_armor";
		this.m.Name = "Lightforge Breastplate";
		this.m.Description = "Bright metal breastplate protects the paladin\'s body from all types of weapons";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 8000;
		this.m.Condition = 400;
		this.m.ConditionMax = 400;
		this.m.StaminaModifier = -50;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_paladin_body_" + variant;
		this.m.SpriteDamaged = "bust_wow_paladin_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_paladin_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_wow_paladin_body_" + variant + ".png";
		this.m.Icon = "armor/icon_wow_paladin_body_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.armor.getTooltip();

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Set bonus: [color=" + this.Const.UI.Color.PositiveValue + "]\'Auras\'[/color] Action Points cost reduces by [color=" + this.Const.UI.Color.PositiveValue + "]9[/color] points"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Holy Light\'[/color] base power increases by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] points"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Blessing of Might\'[/color] effect increases by [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color]"
		});
		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.armor.onUpdateProperties(_properties);
		_properties.T0_paladin_armor = true;
	}
});