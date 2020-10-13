this.gnoll_assassin_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.updateVariant();
		this.m.ID = "armor.head.gnoll_assassin_helmet";
		this.m.Name = "Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 620;
		this.m.ConditionMax = 620;
		this.m.StaminaModifier = -20;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_gnoll_assassin_helmet";
		this.m.SpriteDamaged = "bust_gnoll_assassin_helmet_damaged";
		this.m.SpriteCorpse = "bust_gnoll_assassin_helmet_dead";
	}

});

