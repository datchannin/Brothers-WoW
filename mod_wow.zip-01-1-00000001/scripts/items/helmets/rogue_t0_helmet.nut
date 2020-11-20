/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.rogue_t0_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.rogue_t0_helmet";
		this.m.Name = "Shadowcraft Cap";
		this.m.Description = "A thick mask that allows the rogue to hide his face from the gaze of his victims";
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = false;
		this.m.HideCorpseHead = false;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.IsDroppedAsLoot = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 2000;
		this.m.Condition = 180;
		this.m.ConditionMax = 180;
		this.m.StaminaModifier = -8;
		this.m.Vision = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_rogue_helmet_" + variant;
		this.m.SpriteDamaged = "bust_wow_rogue_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_rogue_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/icon_wow_rogue_helmet_" + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.helmet.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Camouflage\'[/color] skill duration will be increased by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] turn"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Initiative\'[/color] perk also dives [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Ranged Defense"
		});
		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.helmet.onUpdateProperties(_properties);
		_properties.T0_rogue_head = true;
	}
});