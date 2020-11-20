/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.rogue_t0_update <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {
		FatigueRecoveryValue = 3
	},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.rogue_t0_update";
		this.m.Name = "Shadowcraft Spaulders";
		this.m.Description = "Strong and tough shoulders protects the rogue\'s neck from all types of weapons. Can be only applied to Shadowcraft Tunic.";
		this.m.ArmorDescription = "This armor is used with Shadowcraft Spaulders that gives additional properties.";
		this.m.Icon = "armor_upgrades/upgrade_wow_rogue_shoulders_t0.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_wow_rogue_shoulders_t0.png";
		this.m.OverlayIconLarge = "armor_upgrades/upgrade_inventory_wow_rogue_shoulders_t0.png";
		this.m.SpriteFront = "upgrade_wow_rogue_shoulders_t0";
		this.m.SpriteBack = null;
		this.m.SpriteDamagedFront = "upgrade_wow_rogue_shoulders_t0_damaged";
		this.m.SpriteDamagedBack = null;
		this.m.SpriteCorpseFront = "upgrade_wow_rogue_shoulders_t0_dead";
		this.m.SpriteCorpseBack = null;
		this.m.Value = 200;
		this.m.ConditionModifier = 40;
		this.m.StaminaModifier = 1;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+40[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-1[/color] Maximum Fatigue"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.FatigueRecoveryValue + "[/color] Fatigue Recovery Rate"
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

		if (armor.getName() != "Shadowcraft Tunic")
		{
			return false;
		}

		this.Sound.play("sounds/inventory/armor_upgrade_use_01.wav", this.Const.Sound.Volume.Inventory);
		armor.setUpgrade(this);

		return true;
	}

	function onUpdateProperties( _properties )
	{
		_properties.T0_rogue_shoulder = true;
		_properties.FatigueRecoveryRate += this.m.FatigueRecoveryValue;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.FatigueRecoveryValue + "[/color] Fatigue Recovery Rate"
		});
	}

});

