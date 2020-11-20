this.staff <- this.inherit("scripts/items/item", {
	m = {
		AddGenericSkill = true,
		ShowQuiver = false,
		ShowArmamentIcon = true,
		ArmamentIcon = "",
		ArmamentIconBloody = "",
		BreakingSound = "sounds/combat/weapon_break_01.wav",
		EquipSound = this.Const.Wow_sound.DefaultStaffEquip,
		RangeMin = 1,
		RangeMax = 1,
		RangeIdeal = 1,
		RangeMaxBonus = 9,
		SpellHolyPower = 0,
		SpellFirePower = 0,
		SpellFrostPower = 0,
		SpellShadowPower = 0,
		FatigueOnSkillUse = 0,
		StaminaModifier = 0,
		IsDoubleGrippable = false,
		IsAgainstShields = false,
		IsAoE = false,
		IsEnforcingRangeLimit = false,
		IsBloodied = false
	},
	function getRangeMin()
	{
		return this.m.RangeMin;
	}

	function getRangeMax()
	{
		return this.m.RangeMax;
	}

	function getRangeIdeal()
	{
		return this.m.RangeIdeal;
	}

	function getRangeEffective()
	{
		return this.m.RangeMax;
	}

	function getRangeMaxBonus()
	{
		return this.m.RangeMaxBonus;
	}

	function isDoubleGrippable()
	{
		return this.m.IsDoubleGrippable;
	}

	function isAgainstShields()
	{
		return this.m.IsAgainstShields;
	}

	function isAoE()
	{
		return this.m.IsAoE;
	}

	function isEnforcingRangeLimit()
	{
		return this.m.IsEnforcingRangeLimit;
	}

	function isAmountShown()
	{
		return this.m.Condition != this.m.ConditionMax;
	}

	function getAmountString()
	{
		return "" + this.Math.floor(this.m.Condition / (this.m.ConditionMax * 1.0) * 100) + "%";
	}

	function getAmountColor()
	{
		return this.Const.Items.ConditionColor[this.Math.min(this.Math.max(0, this.Math.floor(this.m.Condition / (this.m.ConditionMax * 1.0) * (this.Const.Items.ConditionColor.len() - 1))), this.Const.Items.ConditionColor.len() - 1)];
	}

	function getStaminaModifier()
	{
		return this.m.StaminaModifier;
	}

	function getValue()
	{
		return this.Math.floor(this.m.Value * (this.m.Condition / (this.m.ConditionMax * 1.0)));
	}

	function setBloodied( _isBloodied )
	{
		if (_isBloodied == this.m.IsBloodied)
		{
			return;
		}

		this.m.IsBloodied = _isBloodied;

		if (this.m.ShowArmamentIcon)
		{
			if (this.m.SlotType == this.Const.ItemSlot.Offhand)
			{
				if (_isBloodied && this.doesBrushExist(this.m.ArmamentIcon + "_bloodied"))
				{
					this.getContainer().getAppearance().Shield = this.m.ArmamentIcon + "_bloodied";
				}
				else
				{
					this.getContainer().getAppearance().Shield = this.m.ArmamentIcon;
				}
			}
			else if (_isBloodied && this.doesBrushExist(this.m.ArmamentIcon + "_bloodied"))
			{
				this.getContainer().getAppearance().Weapon = this.m.ArmamentIcon + "_bloodied";
			}
			else
			{
				this.getContainer().getAppearance().Weapon = this.m.ArmamentIcon;
			}

			this.getContainer().updateAppearance();
		}
	}

	function create()
	{
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

		if (this.m.SpellHolyPower > 0)
		{
			result.push({
				id = 4,
				type = "text",
				icon = "ui/icons/holy_power.png",
				text = "Base [color=" + this.Const.UI.Color.PositiveValue + "]\'Holy\'[/color] spell power [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.SpellFrostPower + "[/color]"
			});
		}

		if (this.m.SpellFirePower > 0)
		{
			result.push({
				id = 4,
				type = "text",
				icon = "ui/icons/fire_power.png",
				text = "Base [color=" + this.Const.UI.Color.PositiveValue + "]\'Fire\'[/color] spell power [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.SpellFrostPower + "[/color]"
			});
		}

		if (this.m.SpellFrostPower > 0)
		{
			result.push({
				id = 4,
				type = "text",
				icon = "ui/icons/frost_power.png",
				text = "Base [color=" + this.Const.UI.Color.PositiveValue + "]\'Frost\'[/color] spell power [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.SpellFrostPower + "[/color]"
			});
		}

		if (this.m.SpellShadowPower > 0)
		{
			result.push({
				id = 4,
				type = "text",
				icon = "ui/icons/shadow_power.png",
				text = "Base [color=" + this.Const.UI.Color.PositiveValue + "]\'Shadow\'[/color] spell power [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.SpellFrostPower + "[/color]"
			});
		}

		if (this.m.RangeMax > 1)
		{
			result.push({
				id = 7,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getRangeMax() + "[/color] tiles"
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

		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play(this.m.EquipSound[this.Math.rand(0, this.m.EquipSound.len() - 1)], this.Const.Sound.Volume.Inventory);
	}

	function isDroppedAsLoot()
	{
		return false;
	}

	function updateAppearance()
	{
		if (!this.isEquipped())
		{
			return;
		}

		local changed = false;

		if (this.m.ShowArmamentIcon)
		{
			if (this.m.SlotType == this.Const.ItemSlot.Offhand)
			{
				changed = this.getContainer().getAppearance().Shield != this.m.ArmamentIcon;
				this.getContainer().getAppearance().Shield = this.m.ArmamentIcon;
			}
			else
			{
				changed = this.getContainer().getAppearance().Weapon != this.m.ArmamentIcon;
				this.getContainer().getAppearance().Weapon = this.m.ArmamentIcon;
				this.getContainer().getAppearance().TwoHanded = this.m.BlockedSlotType != null;
			}
		}
		else if (this.m.SlotType == this.Const.ItemSlot.Offhand)
		{
			changed = this.getContainer().getAppearance().Shield != "";
			this.getContainer().getAppearance().Shield = "";
		}
		else
		{
			changed = this.getContainer().getAppearance().Weapon != "";
			this.getContainer().getAppearance().Weapon = "";
			this.getContainer().getAppearance().TwoHanded = false;
		}

		if (changed)
		{
			this.getContainer().updateAppearance();
		}
	}

	function addSkill( _skill )
	{
		this.item.addSkill(_skill);

		if (_skill.isType(this.Const.SkillType.Active))
		{
			_skill.setFatigueCost(this.Math.max(0, _skill.getFatigueCostRaw() + this.m.FatigueOnSkillUse));
		}
	}

	function getAdditionalRange( _actor )
	{
		return 0;
	}

	function onEquip()
	{
		this.item.onEquip();

		if (this.m.AddGenericSkill)
		{
			this.addGenericItemSkill();
		}

		this.updateAppearance();

		if (this.m.Condition == this.m.ConditionMax && !this.isKindOf(this.getContainer().getActor().get(), "player"))
		{
			this.m.Condition = this.Math.rand(1, this.Math.max(1, this.m.ConditionMax - 2)) * 1.0;
		}
	}

	function onUnequip()
	{
		this.m.IsBloodied = false;
		this.item.onUnequip();

		if (this.m.ShowArmamentIcon)
		{
			if (this.m.SlotType == this.Const.ItemSlot.Offhand)
			{
				this.getContainer().getAppearance().Shield = "";
			}
			else
			{
				this.getContainer().getAppearance().Weapon = "";
				this.getContainer().getAppearance().TwoHanded = false;
			}
		}

		this.getContainer().updateAppearance();
	}

	function onUpdateProperties( _properties )
	{
		_properties.Stamina += this.m.StaminaModifier;
		_properties.SpellHolyPower += this.m.SpellHolyPower;
		_properties.SpellFirePower += this.m.SpellFirePower;
		_properties.SpellFrostPower += this.m.SpellFrostPower;
		_properties.SpellShadowPower += this.m.SpellShadowPower;
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
		local actor = this.getContainer().getActor();

		if (actor == null || actor.isNull())
		{
			return;
		}

		if (actor.isPlayerControlled() && _skill.getDirectDamage() < 1.0 && !_skill.isRanged() && this.m.ConditionMax > 1)
		{
			if (_target.getArmorMax(_hitInfo.BodyPart) >= 50 && _hitInfo.DamageInflictedArmor >= 5 || this.m.ConditionMax == 2)
			{
				this.lowerCondition();
			}
		}
	}

	function onUse( _skill )
	{
	}

	function onCombatFinished()
	{
		this.item.onCombatFinished();
		this.setBloodied(false);
	}

	function onDelayedRemoveSelf( _tag )
	{
		this.drop();
	}

	function lowerCondition( _value = this.Const.Combat.WeaponDurabilityLossOnHit )
	{
		local actor = this.getContainer().getActor();
		this.m.Condition = this.Math.maxf(0.0, this.m.Condition - _value);

		if (this.m.Condition == 0 && !actor.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + "\'s " + this.getName() + " has broken!");
			this.Tactical.spawnIconEffect("status_effect_36", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			this.Sound.play(this.m.BreakingSound, 1.0, actor.getPos());
			this.Time.scheduleEvent(this.TimeUnit.Virtual, 300, this.onDelayedRemoveSelf, null);
		}
	}

	function onSerialize( _out )
	{
		this.item.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.item.onDeserialize(_in);
		this.m.Condition = this.Math.minf(this.m.ConditionMax, this.m.Condition);
	}

});

