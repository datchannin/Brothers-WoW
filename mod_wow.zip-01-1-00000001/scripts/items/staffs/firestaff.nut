this.firestaff <- this.inherit("scripts/items/staffs/staff", {
	m = {},
	function create()
	{
		this.staff.create();
		this.m.ID = "staff.firestaff";
		this.m.Name = "Fire Staff";
		this.m.Description = "A long two-handed staff that glows with a flaming aura.";
		this.m.Categories = "Staff, Two-Handed";
		this.m.IconLarge = "staffs/staff_fire_140x70.png";
		this.m.Icon = "staffs/staff_fire_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = false;
		this.m.IsAoE = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "staff_fire";
		this.m.Value = 16000;
		this.m.Condition = 120.0;
		this.m.ConditionMax = 120.0;
		this.m.StaminaModifier = -20;
		this.m.SpellFirePower = 12;
	}
});

