/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.gnoll_axe <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.gnoll_axe";
		this.m.Name = "Human Splitter";
		this.m.Description = "A heavy axe that is created by gnolls blacksmith.";
		this.m.Categories = "Axe, One-Handed";
		this.m.IconLarge = "weapons/gnolls/gnoll_axe_70x140.png";
		this.m.Icon = "weapons/gnolls/gnoll_axe_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDroppedAsLoot = false;
		this.m.IsDoubleGrippable = true;
		this.m.IsAgainstShields = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_gnoll_axe";
		this.m.Value = 2100;
		this.m.ShieldDamage = 24;
		this.m.Condition = 72.0;
		this.m.ConditionMax = 72.0;
		this.m.StaminaModifier = -28;
		this.m.RegularDamage = 40;
		this.m.RegularDamageMax = 75;
		this.m.ArmorDamageMult = 1.3;
		this.m.DirectDamageMult = 0.3;
		this.m.FatigueOnSkillUse = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill;
		skill = this.new("scripts/skills/actives/chop");
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/split_shield");
		skill.setApplyAxeMastery(true);
		this.addSkill(skill);
	}

});

