this.gnoll_poacher_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.updateVariant();
		this.m.ID = "armor.body.gnoll_poacher_armor";
		this.m.Name = "Leather Armor for Gnoll Poacher";
		this.m.Description = "";
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.ShowOnCharacter = true;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 620;
		this.m.ConditionMax = 620;
		this.m.StaminaModifier = -25;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_gnoll_poacher_armor";
		this.m.SpriteDamaged = "bust_gnoll_poacher_armor_damaged";
		this.m.SpriteCorpse = "bust_gnoll_poacher_armor_dead";
	}

});

