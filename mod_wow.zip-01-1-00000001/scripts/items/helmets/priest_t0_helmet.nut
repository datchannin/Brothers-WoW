/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.priest_t0_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.priest_t0_helmet";
		this.m.Name = "Devout Hood";
		this.m.Description = "A white hood for Priests. Sparkles with soft light.";
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = false;
		this.m.HideCorpseHead = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.IsDroppedAsLoot = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 1200;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = -4;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_priest_helmet_" + variant;
		this.m.SpriteDamaged = "bust_wow_priest_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_priest_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/icon_wow_priest_helmet_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.helmet.getTooltip();

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Mental Strength\'[/color] effect value will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color]"
		});

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.helmet.onUpdateProperties(_properties);
		_properties.T0_priest_head = true;
	}
});