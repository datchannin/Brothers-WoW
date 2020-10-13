this.gnoll_brute_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.updateVariant();
		this.m.ID = "armor.head.gnoll_brute_helmet";
		this.m.Name = "Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 750;
		this.m.ConditionMax = 750;
		this.m.StaminaModifier = -35;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_gnoll_brute_helmet";
		this.m.SpriteDamaged = "bust_gnoll_brute_helmet_damaged";
		this.m.SpriteCorpse = "bust_gnoll_brute_helmet_dead";
	}

});

