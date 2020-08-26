/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.catform_effect <- this.inherit("scripts/skills/skill", {
	m = {
		initBody = "",
		initHead = ""
	},
	function create()
	{
		this.m.ID = "effects.catform";
		this.m.Name = "Cat Form";
		this.m.Icon = "ui/perks/perk_druid_catform.png";
		this.m.IconMini = "effect_mini_catform";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "You are under shapeshift effect now. Big bad cat.";
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function toDropWeapons()
	{
		local actor = this.getContainer().getActor();

		local items = actor.getItems();
		if (items.getItemAtSlot(this.Const.ItemSlot.Mainhand))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
			item.drop();
		}
		if (items.getItemAtSlot(this.Const.ItemSlot.Offhand))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Offhand);
			item.drop();
		}
	}

	function onAdded()
	{
		toDropWeapons();
		local actor = this.getContainer().getActor();
		this.m.initBody = actor.getSprite("body").getBrush().Name;
		this.m.initHead = actor.getSprite("head").getBrush().Name;

		actor.setDirty(true);

		actor.getSprite("body").setBrush("druid_cat_body");
		actor.getSprite("head").setBrush("druid_cat_head_01");

		actor.getSprite("armor").Alpha = 10;
		actor.getSprite("helmet").Alpha = 10;
		actor.getSprite("shield_icon").Alpha = 10;
		actor.getSprite("armor_layer_plate").Alpha = 10;
		actor.getSprite("armor_layer_tabbard").Alpha = 10;
		actor.getSprite("hair").Alpha = 10;
		actor.getSprite("beard").Alpha = 10;
		actor.getSprite("tattoo_head").Alpha = 10;
		actor.getSprite("tattoo_body").Alpha = 10;
		actor.getSprite("quiver").Alpha = 10;
		actor.getSprite("arms_icon").Alpha = 10;
		actor.getSprite("dirt").Alpha = 10;
		actor.getSprite("accessory").Alpha = 10;
		actor.getSprite("surcoat").Alpha = 10;
		actor.getSprite("armor_upgrade_back").Alpha = 10;
		actor.getSprite("armor_upgrade_front").Alpha = 10;
	}

	function onUpdate( _properties )
	{
		toDropWeapons();
		local actor = this.getContainer().getActor();
		actor.getSprite("armor").Alpha = 10;
		actor.getSprite("helmet").Alpha = 10;
		actor.getSprite("shield_icon").Alpha = 10;
		actor.getSprite("armor_layer_plate").Alpha = 10;
		actor.getSprite("armor_layer_tabbard").Alpha = 10;
		actor.getSprite("hair").Alpha = 10;
		actor.getSprite("beard").Alpha = 10;
		actor.getSprite("tattoo_head").Alpha = 10;
		actor.getSprite("tattoo_body").Alpha = 10;
		actor.getSprite("quiver").Alpha = 10;
		actor.getSprite("arms_icon").Alpha = 10;
		actor.getSprite("dirt").Alpha = 10;
		actor.getSprite("accessory").Alpha = 10;
		actor.getSprite("surcoat").Alpha = 10;
		actor.getSprite("armor_upgrade_back").Alpha = 10;
		actor.getSprite("armor_upgrade_front").Alpha = 10;
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();
	
		local items = actor.getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = null;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = null;
	}

	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();
		
		local items = actor.getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = null;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = null;
	}
});