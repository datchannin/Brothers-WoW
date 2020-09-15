this.warlock_t0_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.warlock_t0_armor";
		this.m.Name = "Dreadmist Robe";
		this.m.Description = "Robe suitable for Warlocks daily work. The huge skull serves as a reminder for enemies in a possible afterlife.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 800;
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -11;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_body_" + variant;
		this.m.SpriteDamaged = "bust_wow_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_wow_body_armor_" + variant + ".png";
		this.m.Icon = "armor/icon_wow_body_armor_" + variant + ".png";
	}
});