/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.priest_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.priest_t0_armor";
		this.m.Name = "Devout Robes";
		this.m.Description = "Robe suitable for Priest daily work. Blood and dirt leave no trace on this robe.";
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
		this.m.Sprite = "bust_wow_priest_body_" + variant;
		this.m.SpriteDamaged = "bust_wow_priest_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_priest_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_wow_priest_body_" + variant + ".png";
		this.m.Icon = "armor/icon_wow_priest_body_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.armor.getTooltip();

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.armor.onUpdateProperties(_properties);
		_properties.T0_priest_armor = true;
	}
});