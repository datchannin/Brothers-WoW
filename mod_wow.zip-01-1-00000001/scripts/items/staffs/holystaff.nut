this.holystaff <- this.inherit("scripts/items/staffs/staff", {
	m = {},
	function create()
	{
		this.staff.create();
		this.m.ID = "staff.holystaff";
		this.m.Name = "Holy Staff";
		this.m.Description = "A long two-handed staff that glows with a soft light.";
		this.m.Categories = "Staff, Two-Handed";
		this.m.IconLarge = "staffs/staff_holy_140x70.png";
		this.m.Icon = "staffs/staff_holy_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = false;
		this.m.IsAoE = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "staff_holy";
		this.m.Value = 16000;
		this.m.Condition = 120.0;
		this.m.ConditionMax = 120.0;
		this.m.StaminaModifier = -20;
		this.m.SpellHolyPower = 20;
	}
});

