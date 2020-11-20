this.froststaff <- this.inherit("scripts/items/staffs/staff", {
	m = {},
	function create()
	{
		this.staff.create();
		this.m.ID = "staff.froststaff";
		this.m.Name = "Frost Staff";
		this.m.Description = "A long two-handed staff that radiates waves of cold air.";
		this.m.Categories = "Staff, Two-Handed";
		this.m.IconLarge = "staffs/staff_frost_140x70.png";
		this.m.Icon = "staffs/staff_frost_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = false;
		this.m.IsAoE = false;
		this.m.AddGenericSkill = false;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "staff_frost";
		this.m.Value = 3200;
		this.m.Condition = 90.0;
		this.m.ConditionMax = 90.0;
		this.m.StaminaModifier = -20;
		this.m.SpellFrostPower = 15;
	}
});

