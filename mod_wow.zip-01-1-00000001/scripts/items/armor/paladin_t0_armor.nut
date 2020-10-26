/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.paladin_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {
		HitpointsModifier = 6
	},
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
		this.m.Value = 800;
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -11;
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
			id = 15,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Maximum Hitpoints [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.HitpointsModifier + "[/color]"
		});

		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Lightforge Set bonus: Shadowbolt Damage [color=" + this.Const.UI.Color.PositiveValue + "]+" + Const.WarlockSet.T0_bonus + "[/color]"
		});

		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.armor.onUpdateProperties(_properties);
		_properties.Hitpoints += this.m.HitpointsModifier;
		_properties.T0_warlock_armor = true;
	}
});