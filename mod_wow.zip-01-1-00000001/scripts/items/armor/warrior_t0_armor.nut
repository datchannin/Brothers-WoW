/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warrior_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.warrior_t0_armor";
		this.m.Name = "Breastplate of Valor";
		this.m.Description = "Solid and heavy metal breastplate protects the warrior\'s body from all types of weapons.";
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
		this.m.Sprite = "bust_wow_warrior_body_" + variant;
		this.m.SpriteDamaged = "bust_wow_warrior_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_warrior_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_wow_warrior_body_" + variant + ".png";
		this.m.Icon = "armor/icon_wow_warrior_body_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.armor.getTooltip();
//		result.push({
//			id = 15,
//			type = "text",
//			icon = "ui/icons/health.png",
//			text = "Maximum Hitpoints [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.HitpointsModifier + "[/color]"
//		});

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.armor.onUpdateProperties(_properties);
//		_properties.T0_warrior_armor = true;
	}
});