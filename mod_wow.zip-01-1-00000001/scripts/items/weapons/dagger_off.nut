this.dagger_off <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.dagger_off";
		this.m.Name = "Dagger";
		this.m.Description = "Small dagger made exclusively for left-handed use. Only rogues know how to use it.";
		this.m.Categories = "Dagger, One-Handed";
		this.m.IconLarge = "weapons/melee/dagger_off_01.png";
		this.m.Icon = "weapons/melee/dagger_off_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_dagger_off_01";
		this.m.Condition = 40.0;
		this.m.ConditionMax = 40.0;
		this.m.Value = 180;
		this.m.ChanceToHitHead = 0;
		this.m.IsAllowedInBag = false;
	}

	function onEquip()
	{
		local actor = this.m.Container.getActor();
		local items = actor.getItems();
		local item = items.getItemAtSlot(this.Const.ItemSlot.Offhand);

		if ((actor.getCurrentProperties().IsOffDaggerMaster) || (actor.getBackground().getID() == "background.raider_rogue"))
		{
			this.weapon.onEquip();
		}
		else
		{
			actor.getItems().unequip(item);
			this.World.Assets.getStash().add(item);
		}
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});