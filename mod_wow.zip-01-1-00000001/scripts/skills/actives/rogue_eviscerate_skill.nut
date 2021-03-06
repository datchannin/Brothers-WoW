this.rogue_eviscerate_skill <- this.inherit("scripts/skills/skill", {
	m = {
		damage_base_min = 55,
		damage_base_max = 75,
		ComboPointQuantity = 0,
		ComboPointMaximum = 5,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.eviscerate_skill";
		this.m.Name = "Eviscerate";
		this.m.Description = "Powerful attack with a special rogue dagger at the opponent armor\'s weakspots. Ignores all armor, can be used only if rogue already has [color=" + this.Const.UI.Color.DamageValue + "]" + this.m.ComboPointMaximum + "[/color] Combo Points. Spends all Combo Points after using.";
		this.m.KilledString = "Stabbed";
		this.m.Icon = "ui/perks/skill_rogue_eviscerate.png";
		this.m.IconDisabled = "ui/perks/skill_rogue_eviscerate_sw.png";
		this.m.Overlay = "skill_rogue_eviscerate";
		this.m.SoundOnUse = [
			"sounds/combat/rogue_eviscerate_use01.ogg",
			"sounds/combat/rogue_eviscerate_use02.ogg",
			"sounds/combat/rogue_eviscerate_use03.ogg",
			"sounds/combat/rogue_eviscerate_use04.ogg"
		];
		this.m.SoundOnHit = [
			"sounds/combat/rogue_eviscerate01.ogg",
			"sounds/combat/rogue_eviscerate02.ogg",
			"sounds/combat/rogue_eviscerate03.ogg",
			"sounds/combat/rogue_eviscerate04.ogg",
			"sounds/combat/rogue_eviscerate05.ogg"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = false;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.HitChanceBonus = 0;
		this.m.DirectDamageMult = 1.0;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTotalMinDamage()
	{
		local total_damage_min = this.m.damage_base_min;
		local scale = 0;

		scale = this.Math.floor(total_damage_min * this.m.CurrentLevel * this.Const.RogueScale.eviscerate_min);

		total_damage_min += scale;

		return total_damage_min;
	}

	function getTotalMaxDamage()
	{
		local total_damage_max = this.m.damage_base_max;
		local scale = 0;

		scale = this.Math.floor(total_damage_max * this.m.CurrentLevel * this.Const.RogueScale.eviscerate_max);

		total_damage_max += scale;

		return total_damage_max;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();

		local damage_min_st = getTotalMinDamage();
		local damage_max_st = getTotalMaxDamage();
		
		local damage_min = this.Math.floor(damage_min_st * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_max = this.Math.floor(damage_max_st * p.DamageTotalMult * p.MeleeDamageMult);

		local ret = this.getDefaultUtilityTooltip();
		
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_max + "[/color] damage to hitpoints, of which [color=" + this.Const.UI.Color.DamageValue + "]100%[/color] can ignore armor"
		});

		ret.push({
			id = 8,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Completely ignores armor"
		});

		return ret;
	}

	function isUsable()
	{
		if (this.m.ComboPointQuantity == 5)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		local combopoints = user.getSkills().getSkillByID("effects.combopoint");
		if (combopoints != null)
		{
			this.m.ComboPointQuantity = combopoints.getComboPoint();
		}
		else
		{
			this.m.ComboPointQuantity = 0;
		}
	}

	function equipProperWeapon()
	{
		local off = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		local offID;

		if (off != null)
		{
			offID = off.getID();
		}
		else
		{
			return 0;
		}

		if (offID == "weapon.dagger_off" || offID == "weapon.rondel_dagger_off" || offID == "weapon.qatal_dagger_off")
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.equipProperWeapon())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUse( _user, _targetTile )
	{
		local combopoints = _user.getSkills().getSkillByID("effects.combopoint");
		if (combopoints != null)
		{
			combopoints.resetComboPoint();
		}
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local damage_min = getTotalMinDamage();
			local damage_max = getTotalMaxDamage();

			_properties.DamageRegularMin = damage_min;
			_properties.DamageRegularMax = damage_max;
			_properties.DamageArmorMult *= 0.0;
			_properties.IsIgnoringArmorOnAttack = true;
			_properties.HitChanceMult[this.Const.BodyPart.Head] = 1.0;
			_properties.HitChanceMult[this.Const.BodyPart.Body] = 1.0;
		}
	}
});
