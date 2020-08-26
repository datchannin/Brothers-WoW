/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.01, game_version = 1.4.0.40*/
this.catform_effect <- this.inherit("scripts/skills/skill", {
	m = {},
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
	}

	function onUpdate( _properties )
	{
		toDropWeapons();
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