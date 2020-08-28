/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.bearform_effect <- this.inherit("scripts/skills/skill", {
	m = {
		initBody = "",
		initHead = ""
	},
	function create()
	{
		this.m.ID = "effects.bearform";
		this.m.Name = "Bear Form";
		this.m.Icon = "ui/perks/perk_druid_bearform.png";
		this.m.IconMini = "effect_mini_bearform";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "You are under shapeshift effect now. Big strong bear.";
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
	
	function toDropArmor()
	{
		local actor = this.getContainer().getActor();

		local items = actor.getItems();
		if (items.getItemAtSlot(this.Const.ItemSlot.Body))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Body);
			item.drop();
		}
		if (items.getItemAtSlot(this.Const.ItemSlot.Head))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Head);
			item.drop();
		}
	}

	function toSetVisibleBrush(value)
	{
		local setvalue = true;
		local actor = this.getContainer().getActor();
		local appearance = actor.getItems().getAppearance();

		if (value == 0)
		{
			setvalue = false;
		}
		else
		{
			setvalue = true;
		}

		actor.getSprite("armor").Visible = setvalue;
		actor.getSprite("helmet").Visible = setvalue;
		actor.getSprite("helmet_damage").Visible = setvalue;
		actor.getSprite("shield_icon").Visible = setvalue;
		actor.getSprite("arms_icon").Visible = setvalue;
		actor.getSprite("hair").Visible = setvalue;
		actor.getSprite("beard").Visible = setvalue;
		actor.getSprite("beard_top").Visible = setvalue;
		actor.getSprite("tattoo_head").Visible = setvalue;
		actor.getSprite("tattoo_body").Visible = setvalue;
		actor.getSprite("quiver").Visible = setvalue;
		actor.getSprite("dirt").Visible = setvalue;
		actor.getSprite("accessory").Visible = setvalue;
		actor.getSprite("surcoat").Visible = setvalue;
		actor.getSprite("armor_upgrade_back").Visible = setvalue;
		actor.getSprite("armor_upgrade_front").Visible = setvalue;
		actor.getSprite("permanent_injury_1").Visible = setvalue;
		actor.getSprite("permanent_injury_2").Visible = setvalue;
		actor.getSprite("permanent_injury_3").Visible = setvalue;
		actor.getSprite("permanent_injury_4").Visible = setvalue;
		actor.getSprite("injury_body").Visible = setvalue;
		actor.getSprite("injury").Visible = setvalue;
		appearance.HideBeard = !setvalue;
		appearance.HideHair = !setvalue;
	}

	function onAdded()
	{
		toDropWeapons();
		local actor = this.getContainer().getActor();
		this.m.initBody = actor.getSprite("body").getBrush().Name;
		this.m.initHead = actor.getSprite("head").getBrush().Name;

		actor.setDirty(true);
		actor.getSprite("body").setBrush("druid_bear_body");
		actor.getSprite("head").setBrush("druid_bear_head_01");

		toSetVisibleBrush(0);
	}

	function onDeath()
	{
		local actor = this.getContainer().getActor();
		local appearance = actor.getItems().getAppearance();
		appearance.CorpseArmor = "";
		appearance.HelmetCorpse = "";
	}

	function onUpdate( _properties )
	{
		toDropWeapons();
		local actor = this.getContainer().getActor();
		toSetVisibleBrush(0);
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();
		if (actor.isAlive())
		{
			actor.getSprite("body").setBrush(this.m.initBody);
			actor.getSprite("head").setBrush(this.m.initHead);		
			toSetVisibleBrush(1);
		}
	}

	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();
		if (actor.isAlive())
		{
			actor.getSprite("body").setBrush(this.m.initBody);
			actor.getSprite("head").setBrush(this.m.initHead);
			toSetVisibleBrush(1);
		}
	}
});