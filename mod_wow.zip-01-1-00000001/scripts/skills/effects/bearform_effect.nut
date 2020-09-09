/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.bearform_effect <- this.inherit("scripts/skills/skill", {
	m = {
		initBody = "",
		initHead = "",
		abolishpoison = false,
		heartofwild = false,
		direbear = false
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

	function getHealthMult()
	{
		local healthmult = 0.3;

		if (this.m.heartofwild)
		{
			healthmult += 0.3;
		}
		if (this.m.direbear)
		{
			healthmult += 0.25;
		}

		return healthmult;
	}

	function getTooltip()
	{
		local ret = [
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
		local healthmult = getHealthMult() * 100;

		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + healthmult + "%[/color]."
		});

		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/damage_received.png",
			text = "Damage taken is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
		});

		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Bravery is increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] points."
		});

		if (this.m.direbear)
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Bravery is increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			});
		}

		if (this.m.abolishpoison)
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are immune to the \'Poison\' effect while Bear form is applied."
			});
		}

		return ret;
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
		local items = actor.getItems();
		local appearance = actor.getItems().getAppearance();

		if (value == 0)
		{
			setvalue = false;
		}
		else
		{
			setvalue = true;
		}

		appearance.HideBeard = !setvalue;
		appearance.HideHair = !setvalue;
		
		if (items.getItemAtSlot(this.Const.ItemSlot.Body))
		{
			actor.getSprite("armor").Visible = setvalue;
		}
		if (items.getItemAtSlot(this.Const.ItemSlot.Head))
		{
			actor.getSprite("helmet").Visible = setvalue;
			actor.getSprite("helmet_damage").Visible = setvalue;
		}
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
		actor.getSprite("body").setBrush(this.m.initBody);
		actor.getSprite("head").setBrush(this.m.initHead);
		toSetVisibleBrush(1);

		this.removeSelf();
	}

	function onUpdate( _properties )
	{
		toDropWeapons();
		local actor = this.getContainer().getActor();
		toSetVisibleBrush(0);

		this.m.abolishpoison = actor.getSkills().hasSkill("perk.wow.druid.abolishpoison");
		this.m.direbear = actor.getSkills().hasSkill("perk.wow.druid.direbear");
		this.m.heartofwild = actor.getSkills().hasSkill("perk.wow.druid.heartofwild");

		local healthmult = getHealthMult();

		_properties.HitpointsMult *= (1 + healthmult);

		if (actor.getSkills().hasSkill("perk.wow.druid.abolishpoison"))
		{
			_properties.IsImmuneToPoison = true;
		}
		if (actor.getSkills().hasSkill("perk.wow.druid.direbear"))
		{
			_properties.BraveryMult *= 1.1;
		}

		_properties.DamageReceivedTotalMult *= 0.9;
		_properties.Bravery += 20;
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

		local items = actor.getItems();
		if (items.getItemAtSlot(this.Const.ItemSlot.Head))
		{
			local helm = items.getItemAtSlot(this.Const.ItemSlot.Head);
			items.unequip(helm);
			items.equip(helm);
		}	
	}

	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();

		actor.getSprite("body").setBrush(this.m.initBody);
		actor.getSprite("head").setBrush(this.m.initHead);
		toSetVisibleBrush(1);
		
		this.removeSelf();
	}
});