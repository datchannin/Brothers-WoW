/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.mage_manaagat_skill <- this.inherit("scripts/skills/skill", {
	m = {
		BaseRestoreValue = 30,
		BaseCharges = 2,
		CurrentCharges = 2,
		CurrentLevel = 1
	},
	function create()
	{
		this.m.ID = "actives.manaagat_skill";
		this.m.Name = "Mana Agat";
		this.m.Description = "Use this gem to reduce accumulated Fatigue.";
		this.m.Icon = "ui/perks/skill_mage_manaagat.png";
		this.m.IconDisabled = "ui/perks/skill_mage_manaagat_sw.png";
		this.m.Overlay = "skill_mage_manaagat";
		this.m.SoundOnUse = [
			"sounds/combat/mage_agat.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTotalRestoreValue()
	{
		local restore_value = this.m.BaseRestoreValue;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentLevel * this.Const.MageScale.agat_restore);
		restore_value += scale;

		return restore_value;
	}

	function getTotalCharges()
	{
		local charges = this.m.BaseCharges;
		local scale = 0;

		scale = this.Math.floor(this.m.CurrentLevel/this.Const.MageScale.agat_charges);
		charges += scale;

		return charges;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local restore_value = getTotalRestoreValue();
		local base_charges = getTotalCharges();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Reduce your Fatigue by [color=" + this.Const.UI.Color.PositiveValue + "]" + restore_value + "[/color] points per usage."
		});

		if (this.Tactical.isActive())
		{
			if (this.m.CurrentCharges)
			{
				ret.push({
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "You have [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.CurrentCharges + "[/color] more charges to use gem during this combat."
				});
			}
			else
			{
				ret.push({
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "You don\'t have more gem charges."
				});
			}
		}
		else
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You can have maximum [color=" + this.Const.UI.Color.PositiveValue + "]" + base_charges + "[/color] gem charges when start the combat."
			});
		}

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
	}

	function isUsable()
	{
		if (this.skill.isUsable())
		{
			if (this.m.CurrentCharges > 0)
			{
				return true;
			}
		}

		return false;
	}

	function onCombatStarted()
	{
		local base_charges = getTotalCharges();
		this.m.CurrentCharges = base_charges;
	}

	function onUse( _user, _targetTile )
	{
		local userFatigue_current = _user.getFatigue();
		local restore_value = getTotalRestoreValue();

		_user.setFatigue(userFatigue_current - restore_value);
		this.m.CurrentCharges -= 1;

		this.spawnIcon("effect_mage_manaagat", _user.getTile());

		return true;
	}
});