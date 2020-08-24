/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.01, game_version = 1.4.0.40*/
this.winterwolf_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {
		Skill = null,
		Entity = null,
		Script = "scripts/entity/tactical/winterwolf",
		UnleashSounds = [
			"sounds/combat/winterwolf_unleash1.wav",
			"sounds/combat/winterwolf_unleash2.wav"
		]
	},
	function isAllowedInBag()
	{
		return false;
	}

	function getScript()
	{
		return this.m.Script;
	}

	function isUnleashed()
	{
		return this.m.Entity != null;
	}

	function getName()
	{
		if (this.m.Entity == null)
		{
			return this.item.getName();
		}
		else
		{
			return "Winterwolf Collar";
		}
	}

	function setName( _n )
	{
		this.m.Name = _n;
	}

	function getDescription()
	{
		if (this.m.Entity == null)
		{
			return this.item.getDescription();
		}
		else
		{
			return "The collar of a winterwolf that has been unleashed onto the battlefield.";
		}
	}

	function create()
	{
		this.accessory.create();
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ID = "accessory.winterwolf_item";
		this.m.Name = this.Const.Wow_strings.WinterwolfNames[this.Math.rand(0, this.Const.Wow_strings.WinterwolfNames.len() - 1)] + " the Winterwolf";
		this.m.Description = "Snow wolf with huge fangs. Such an animal can gnaw the enemy's throat in an instant.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IsChangeableInBattle = false;
		this.m.Value = 0;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/inventory/wardog_inventory_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
	}

	function updateVariant()
	{
		this.setEntity(this.m.Entity);
	}

	function setEntity( _e )
	{
		this.m.Entity = _e;

		if (this.m.Entity != null)
		{
			this.m.Icon = "tools/dog_01_leash_70x70.png";
		}
		else
		{
			this.m.Icon = "tools/winterwolf_01_0" + this.m.Variant + "_70x70.png";
		}
	}

	function onEquip()
	{
		this.accessory.onEquip();
		local unleash = this.new("scripts/skills/actives/unleash_winterwolf");
		unleash.setItem(this);
		this.m.Skill = this.WeakTableRef(unleash);
		this.addSkill(unleash);
	}

	function onCombatFinished()
	{
		this.setEntity(null);
	}

	function onCombatFinished()
	{
		this.setEntity(null);
	}

	function onSerialize( _out )
	{
		this.accessory.onSerialize(_out);
		_out.writeString(this.m.Name);
	}

	function onDeserialize( _in )
	{
		this.accessory.onDeserialize(_in);
		this.m.Name = _in.readString();
	}

});