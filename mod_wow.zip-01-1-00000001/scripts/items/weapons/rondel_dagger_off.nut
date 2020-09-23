this.rondel_dagger_off <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.rondel_dagger_off";
		this.m.Name = "Rondel Dagger";
		this.m.Description = "A long, quadrangular spike for left-handed use. Only rogues know how to use it.";
		this.m.Categories = "Dagger, One-Handed";
		this.m.IconLarge = "weapons/melee/dagger_off_02.png";
		this.m.Icon = "weapons/melee/dagger_off_02_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_dagger_off_02";
		this.m.Condition = 50.0;
		this.m.ConditionMax = 50.0;
		this.m.Value = 400;
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

