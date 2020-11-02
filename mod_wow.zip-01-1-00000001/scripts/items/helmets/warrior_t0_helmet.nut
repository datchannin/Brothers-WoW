/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warrior_t0_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.warrior_t0_helmet";
		this.m.Name = "Helm of Valor";
		this.m.Description = "Solid and heavy metal helmet of the Warriors. Best head protection against all weapons.";
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
		this.m.Sprite = "bust_wow_warrior_helmet_" + variant;
		this.m.SpriteDamaged = "bust_wow_warrior_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_warrior_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/icon_wow_warrior_helmet_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.helmet.getTooltip();
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
		this.helmet.onUpdateProperties(_properties);
//		_properties.T0_warlock_head = true;
	}
});