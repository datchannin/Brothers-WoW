/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.gnoll_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.gnoll_shield";
		this.m.Name = "Gnoll Metal Shield";
		this.m.Description = "A massive metal shield that is created by gnolls blacksmith.";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.SoundOnHit = this.Const.Sound.ShieldHitMetal;
		this.m.IsDroppedAsLoot = false;
		this.updateVariant();
		this.m.Value = 740;
		this.m.MeleeDefense = 22;
		this.m.RangedDefense = 22;
		this.m.StaminaModifier = -25;
		this.m.Condition = 106;
		this.m.ConditionMax = 106;
		this.m.FatigueOnSkillUse = 8;
	}

	function updateVariant()
	{
		this.m.Sprite = "icon_gnoll_shield";
		this.m.SpriteDamaged = "icon_gnoll_shield_damaged";
		this.m.ShieldDecal = "icon_gnoll_shield_destroyed";
		this.m.IconLarge = "weapons/gnolls/gnoll_shield_70x140.png";
		this.m.Icon = "weapons/gnolls/gnoll_shield_70x70.png";
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

});

