/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.gnoll_mystic_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.updateVariant();
		this.m.ID = "armor.body.gnoll_mystic_armor";
		this.m.Name = "Cloth Armor for Gnoll Mystic";
		this.m.Description = "";
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.ShowOnCharacter = true;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 360;
		this.m.ConditionMax = 360;
		this.m.StaminaModifier = -15;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_gnoll_mystic_armor";
		this.m.SpriteDamaged = "bust_gnoll_mystic_armor_damaged";
		this.m.SpriteCorpse = "bust_gnoll_mystic_armor_dead";
	}

});

