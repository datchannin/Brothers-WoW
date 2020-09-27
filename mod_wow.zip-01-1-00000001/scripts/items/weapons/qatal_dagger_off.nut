/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.qatal_dagger_off <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		DualIsInCharacter = false
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.qatal_dagger_off";
		this.m.Name = "Qatal Dagger";
		this.m.Description = "A curved blade for left-handed use. Particularly effective against targets already debilitated. Only rogues know how to use it.";
		this.m.Categories = "Dagger, One-Handed";
		this.m.IconLarge = "weapons/melee/qatal_dagger_off_01.png";
		this.m.Icon = "weapons/melee/qatal_dagger_off_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_qatal_dagger_off";
		this.m.Condition = 60.0;
		this.m.ConditionMax = 60.0;
		this.m.Value = 1000;
		this.m.ChanceToHitHead = 6;
		this.m.IsAllowedInBag = false;
	}

	function getTooltip()
	{
		local result = [
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
		
		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 65,
			type = "text",
			text = this.m.Categories
		});
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.m.ConditionMax > 1)
		{
			result.push({
				id = 4,
				type = "progressbar",
				icon = "ui/icons/asset_supplies.png",
				value = this.getCondition(),
				valueMax = this.getConditionMax(),
				text = "" + this.getCondition() + " / " + this.getConditionMax() + "",
				style = "armor-body-slim"
			});
		}
		
		if (this.m.ChanceToHitHead > 0)
		{
			result.push({
				id = 9,
				type = "text",
				icon = "ui/icons/chance_to_hit_head.png",
				text = "Chance to hit head [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.ChanceToHitHead + "%[/color]"
			});
		}
		
		if (this.m.StaminaModifier < 0)
		{
			result.push({
				id = 8,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Maximum Fatigue [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.StaminaModifier + "[/color]"
			});
		}

		if (this.m.FatigueOnSkillUse > 0)
		{
			result.push({
				id = 8,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Weapon skills build up [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.FatigueOnSkillUse + "[/color] more fatigue"
			});
		}
		else if (this.m.FatigueOnSkillUse < 0)
		{
			result.push({
				id = 8,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Weapon skills build up [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.FatigueOnSkillUse + "[/color] less fatigue"
			});
		}

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Slash\'[/color] skill increases damage by [color=" + this.Const.UI.Color.PositiveValue + "]40%[/color]"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/direct_damage.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Flail\'[/color] skill has [color=" + this.Const.UI.Color.PositiveValue + "]25[/color] points additional direct damage"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/hitchance.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Puncture\'[/color] skill increases hit chance for [color=" + this.Const.UI.Color.PositiveValue + "]15%[/color]"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/chance_to_hit_head.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]\'Chop\'[/color] skill increases chance to hit head by [color=" + this.Const.UI.Color.PositiveValue + "]15%[/color]"
		});

		return result;
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
				actor.getSkills().removeByID("effects.offdagger");
				
				local offdagger_effect = this.new("scripts/skills/effects/offdagger_effect");
				offdagger_effect.setPunctureBonus(15);
				offdagger_effect.setChopBonus(15);
				offdagger_effect.setFlailBonus(25);
				offdagger_effect.setSlashBonus(40);
				actor.getSkills().add(offdagger_effect);
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

