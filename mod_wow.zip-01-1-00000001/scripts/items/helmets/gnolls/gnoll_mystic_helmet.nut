/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.gnoll_mystic_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.updateVariant();
		this.m.ID = "armor.head.gnoll_mystic_helmet";
		this.m.Name = "Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 360;
		this.m.ConditionMax = 360;
		this.m.StaminaModifier = -10;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_gnoll_mystic_helmet";
		this.m.SpriteDamaged = "bust_gnoll_mystic_helmet_damaged";
		this.m.SpriteCorpse = "bust_gnoll_mystic_helmet_dead";
	}

});

