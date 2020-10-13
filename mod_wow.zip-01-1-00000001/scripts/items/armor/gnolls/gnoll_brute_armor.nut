this.gnoll_brute_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.updateVariant();
		this.m.ID = "armor.body.gnoll_brute_armor";
		this.m.Name = "Metal Armor for Gnoll Brutes";
		this.m.Description = "";
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.ShowOnCharacter = true;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 750;
		this.m.ConditionMax = 750;
		this.m.StaminaModifier = -50;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_gnoll_brute_armor";
		this.m.SpriteDamaged = "bust_gnoll_brute_armor_damaged";
		this.m.SpriteCorpse = "bust_gnoll_brute_armor_dead";
	}

});

