/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.gnoll_axe_two_handed <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.gnoll_axe_two_handed";
		this.m.Name = "Gnoll Heavy Axe";
		this.m.Description = "A massive heavy axe that is created by gnolls blacksmith.";
		this.m.Categories = "Axe, Two-Handed";
		this.m.IconLarge = "weapons/gnolls/gnoll_axe2_70x140.png";
		this.m.Icon = "weapons/gnolls/gnoll_axe2_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsDroppedAsLoot = false;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_gnoll_axe2";
		this.m.Value = 3200;
		this.m.ShieldDamage = 42;
		this.m.Condition = 110.0;
		this.m.ConditionMax = 110.0;
		this.m.StaminaModifier = -36;
		this.m.RegularDamage = 80;
		this.m.RegularDamageMax = 100;
		this.m.ArmorDamageMult = 1.5;
		this.m.DirectDamageMult = 0.4;
		this.m.DirectDamageAdd = 0.1;
		this.m.ChanceToHitHead = 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/split_man"));
		this.addSkill(this.new("scripts/skills/actives/round_swing"));
		local skillToAdd = this.new("scripts/skills/actives/split_shield");
		skillToAdd.setApplyAxeMastery(true);
		skillToAdd.setFatigueCost(skillToAdd.getFatigueCostRaw() + 5);
		this.addSkill(skillToAdd);
	}

});

