/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_t0_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.paladin_t0_helmet";
		this.m.Name = "Lightforge Helm";
		this.m.Description = "Bright metal helmet protects the paladin\'s head from all types of weapons";
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = false;
		this.m.HideCorpseHead = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.IsDroppedAsLoot = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 5000;
		this.m.Condition = 400;
		this.m.ConditionMax = 400;
		this.m.StaminaModifier = -28;
		this.m.Vision = -3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_paladin_helmet_" + variant;
		this.m.SpriteDamaged = "bust_wow_paladin_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_paladin_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/icon_wow_paladin_helmet_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.helmet.getTooltip();

		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Aura Mastery\'[/color] perk increases auras range by [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color]"
		});

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.helmet.onUpdateProperties(_properties);
		_properties.T0_paladin_head = true;
	}
});