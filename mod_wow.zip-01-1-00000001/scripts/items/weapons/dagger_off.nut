this.dagger_off <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		DualIsInCharacter = false
	},
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
		this.weapon.onEquip();
		local actor = this.getContainer().getActor();
		local items = actor.getItems();
		local item = items.getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (!this.m.DualIsInCharacter)
		{
			if (actor.getCurrentProperties().IsOffDaggerMaster)
			{
				this.m.DualIsInCharacter = true;
				this.weapon.onEquip();
				actor.getSkills().removeByID("effects.offdagger");
				actor.getSkills().add(this.new("scripts/skills/effects/offdagger_effect"));
			}
			else
			{
				actor.getItems().unequip(item);
				this.World.Assets.getStash().add(item);
			}
		}
	}

	function onUnequip()
	{
		this.weapon.onUnequip();
		local actor = this.m.Container.getActor();
		actor.getSkills().removeByID("effects.offdagger");
		this.m.DualIsInCharacter = false;
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

	function onSerialize( _out )
	{
		this.weapon.onSerialize(_out);
		_out.writeBool(this.m.DualIsInCharacter);
	}

	function onDeserialize( _in )
	{
		this.weapon.onDeserialize(_in);
		this.m.DualIsInCharacter = _in.readBool();
	}
});