this.perk_wow_magicinterference <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.common.magicinterference";
		this.m.Name = this.Const.Wow_strings.PerkName.MagicInterference;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MagicInterference;
		this.m.Icon = "ui/perks/perk_magic_interference.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getFatigueSumm()
	{
		local value = 0;
		local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		
		if (body != null)
		{
			if (body.getStaminaModifier() < 0)
			{
				value = value - body.getStaminaModifier();
			}
		}

		if (head != null)
		{
			if (head.getStaminaModifier() < 0)
			{
				value = value - head.getStaminaModifier();
			}
		}
		
		return value;
	}

	function getPercentValue()
	{
		local fatigue = getFatigueSumm();
		local percent = 0;
		
		if (fatigue <= 20)
		{
			percent = 40;
		}
		else
		{
			if (fatigue <= 40)
			{
				local delta = fatigue - 20;
				percent = 40 - 2*delta;
			}
			else
			{
				percent = 0
			}
		}

		return percent;		
	}

	function getShield()
	{
		local shield = false;
		local offhanditem = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		if (offhanditem != null && offhanditem.isItemType(this.Const.Items.ItemType.Shield))
		{
			shield = true;
		}
		
		return shield;
	}

	function getTooltip()
	{
		local percent = this.getPercentValue();
		local shield = this.getShield();
		local tooltip = this.skill.getTooltip();

		if (shield)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character uses shield, so he can not have any benefit from using magic interference[/color]"
			});
		}
		else
		{
			if (percent > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Damage to hitpoints taken from attacks will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + percent + "%[/color]"
				});
			}
			else
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/tooltips/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s body and head armor are too heavy as to have any benefit from using magic interference[/color]"
				});
			}
		}

		return tooltip;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}

		local shield = this.getShield();
		if (shield)
		{
			return;
		}

		local percent = this.getPercentValue() * 0.01;
		_properties.DamageReceivedRegularMult *= (1.0 - percent);
	}

});