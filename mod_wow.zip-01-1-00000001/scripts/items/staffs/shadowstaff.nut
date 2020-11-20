this.shadowstaff <- this.inherit("scripts/items/staffs/staff", {
	m = {},
	function create()
	{
		this.staff.create();
		this.m.ID = "staff.shadowstaff";
		this.m.Name = "Shadow Staff";
		this.m.Description = "A long two-handed staff that absorbs the light around it.";
		this.m.Categories = "Staff, Two-Handed";
		this.m.IconLarge = "staffs/staff_shadow_140x70.png";
		this.m.Icon = "staffs/staff_shadow_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = false;
		this.m.IsAoE = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "staff_shadow";
		this.m.Value = 16000;
		this.m.Condition = 120.0;
		this.m.ConditionMax = 120.0;
		this.m.StaminaModifier = -20;
		this.m.SpellShadowPower = 20;
	}
});

