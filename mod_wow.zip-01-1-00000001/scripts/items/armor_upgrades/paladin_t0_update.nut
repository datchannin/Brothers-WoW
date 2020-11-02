this.paladin_t0_update <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {
		BraveryValue = 10,
		HitpointsValue = 15
	},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.paladin_t0_update";
		this.m.Name = "Lightforge Spaulders";
		this.m.Description = "Bright metal shoulders protects the paladin\'s neck from all types of weapons. Can be only applied to Lightforge Breastplate.";
		this.m.ArmorDescription = "This armor is used with Lightforge Spaulders that gives additional properties.";
		this.m.Icon = "armor_upgrades/upgrade_wow_paladin_shoulders_t0.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_wow_paladin_shoulders_t0.png";
		this.m.OverlayIconLarge = "armor_upgrades/upgrade_inventory_wow_paladin_shoulders_t0.png";
		this.m.SpriteFront = "upgrade_wow_paladin_shoulders_t0";
		this.m.SpriteBack = null;
		this.m.SpriteDamagedFront = "upgrade_wow_paladin_shoulders_t0_damaged";
		this.m.SpriteDamagedBack = null;
		this.m.SpriteCorpseFront = "upgrade_wow_paladin_shoulders_t0_dead";
		this.m.SpriteCorpseBack = null;
		this.m.Value = 200;
		this.m.ConditionModifier = 60;
		this.m.StaminaModifier = 3;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+60[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-3[/color] Maximum Fatigue"
		});
		
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/health.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.HitpointsValue + "[/color] Maximum Hitpoints"
		});
		
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.BraveryValue + "[/color] Maximum Bravery"
		});
		
		return result;
	}

	function onUse( _actor, _item = null )
	{
		if (this.isUsed())
		{
			return false;
		}

		local armor = _item == null ? _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body) : _item;

		if (armor == null)
		{
			return false;
		}

		if (armor.getName() != "Lightforge Breastplate")
		{
			return false;
		}

		this.Sound.play("sounds/inventory/armor_upgrade_use_01.wav", this.Const.Sound.Volume.Inventory);
		armor.setUpgrade(this);

		return true;
	}

	function onUpdateProperties( _properties )
	{
		_properties.T0_paladin_shoulder = true;
		_properties.Bravery += this.m.BraveryValue;
		_properties.Hitpoints += this.m.HitpointsValue;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/health.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.HitpointsValue + "[/color] Maximum Hitpoints"
		});
		
		_result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.BraveryValue + "[/color] Maximum Bravery"
		});
	}

});

