this.warlock_t0_helm <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.warlock_t0_helm";
		this.m.Name = "Dreadmist Mask";
		this.m.Description = "A closed mask for Warlocks. From under the dark hood, the eyes sending death are not visible";
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = true;
		this.m.HideCorpseHead = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.IsDroppedAsLoot = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wow_helmet_" + variant;
		this.m.SpriteDamaged = "bust_wow_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wow_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_wow_helmet_" + variant + ".png";
	}
});