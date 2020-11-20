/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.gnoll_dagger <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.gnoll_dagger";
		this.m.Name = "Gnoll Dagger";
		this.m.Description = "Dagger.";
		this.m.Categories = "Sword/Dagger, One-Handed";
		this.m.IconLarge = "weapons/gnolls/gnoll_dagger_70x140.png";
		this.m.Icon = "weapons/gnolls/gnoll_dagger_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.IsDroppedAsLoot = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_gnoll_dagger";
		this.m.Value = 750;
		this.m.Condition = 75.0;
		this.m.ConditionMax = 75.0;
		this.m.StaminaModifier = -5;
		this.m.RegularDamage = 40;
		this.m.RegularDamageMax = 50;
		this.m.ArmorDamageMult = 0.7;
		this.m.DirectDamageMult = 0.15;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local slash = this.new("scripts/skills/actives/slash");
		slash.m.Icon = "skills/active_77.png";
		slash.m.IconDisabled = "skills/active_77_sw.png";
		slash.m.Overlay = "active_77";
		this.addSkill(slash);
		this.addSkill(this.new("scripts/skills/actives/puncture"));
	}

});

