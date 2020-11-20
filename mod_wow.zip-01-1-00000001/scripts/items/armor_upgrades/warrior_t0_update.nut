/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.warrior_t0_update <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {
		HitpointsValue = 25
	},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.warrior_t0_update";
		this.m.Name = "Spaulders of Valor";
		this.m.Description = "Solid and heavy metal shoulders protects the warrior\'s neck from all types of weapons. Can be only applied to Breastplate of Valor.";
		this.m.ArmorDescription = "This armor is used with Spaulders of Valor that gives additional properties.";
		this.m.Icon = "armor_upgrades/upgrade_wow_warrior_shoulders_t0.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_wow_warrior_shoulders_t0.png";
		this.m.OverlayIconLarge = "armor_upgrades/upgrade_inventory_wow_warrior_shoulders_t0.png";
		this.m.SpriteFront = "upgrade_wow_warrior_shoulders_t0";
		this.m.SpriteBack = null;
		this.m.SpriteDamagedFront = "upgrade_wow_warrior_shoulders_t0_damaged";
		this.m.SpriteDamagedBack = null;
		this.m.SpriteCorpseFront = "upgrade_wow_warrior_shoulders_t0_dead";
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

		if (armor.getName() != "Breastplate of Valor")
		{
			return false;
		}

		this.Sound.play("sounds/inventory/armor_upgrade_use_01.wav", this.Const.Sound.Volume.Inventory);
		armor.setUpgrade(this);

		return true;
	}

	function onUpdateProperties( _properties )
	{
		_properties.T0_warrior_shoulder = true;
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
	}

});

