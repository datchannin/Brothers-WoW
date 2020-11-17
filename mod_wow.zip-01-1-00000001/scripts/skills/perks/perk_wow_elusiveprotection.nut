this.perk_wow_elusiveprotection <- this.inherit("scripts/skills/skill", {
	m = {
		PercentArmor = 15
	},
	function create()
	{
		this.m.ID = "perk.wow.common.elusiveprotection";
		this.m.Name = this.Const.Wow_strings.PerkName.ElusiveProtection;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ElusiveProtection;
		this.m.Icon = "ui/perks/perk_elusive_protection.png";
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
		
		if (fatigue <= 30)
		{
			percent = 15;
		}
		else
		{
			percent = 0
		}

		return percent;		
	}

	function getTooltip()
	{
		local percent = this.getPercentValue();
		local tooltip = this.skill.getTooltip();

		if (percent > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Damage to hitpoints from attacks will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + percent + "%[/color]"
			});
		}
		else
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s body and head armor are too heavy as to have any damage to hitpoints benefit from using elusive protection[/color]"
			});
		}

		tooltip.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Damage to armor from attacks will be reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.PercentArmor + "%[/color]"
		});

		return tooltip;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}

		local percent = this.getPercentValue() * 0.01;
		local armor_percent = this.m.PercentArmor * 0.01;
		_properties.DamageReceivedRegularMult *= (1.0 - percent);
		_properties.DamageReceivedArmorMult *= (1.0 - armor_percent);
	}

});