/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.priest_powerwordshield_skill <- this.inherit("scripts/skills/skill", {
	m = {
		repair_base_min = 10,
		repair_base_max = 15,
		SpellHolyPower = 0,
		CurrentLevel = 1,
		BaseChance = 100,
		BaseEffect = 10,
		mentalstrength = false,
		mentalpower = false,
		mentalagility = false,
		inspiration = false,
		repairmaster = false,
		unbreakablewill = false,
		T0_priest_head = false
	},
	function create()
	{
		this.m.ID = "actives.powerwordshield_skill";
		this.m.Name = "Power Word: Shield";
		this.m.Description = "Summon magic shield that can repair character armor.";
		this.m.Icon = "ui/perks/skill_priest_shield.png";
		this.m.IconDisabled = "ui/perks/skill_priest_shield_sw.png";
		this.m.Overlay = "skill_priest_shield";
		this.m.SoundOnUse = [
			"sounds/combat/priest_powerwordshield.wav"
		];
		this.m.SoundOnHit = [];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 3;
	}

	function GetTotalEffect()
	{
		local effect = this.m.BaseEffect;

		if (this.m.mentalstrength)
		{
			if (this.m.T0_priest_head)
			{
				effect += 5;
			}
		}

		if (this.m.mentalpower)
		{
			effect += 10;
		}

		return effect;
	}

	function getTotalMinRepair()
	{
		local repair_total_min = this.m.repair_base_min;
		local scale = 0;

		repair_total_min += this.m.SpellHolyPower;

		if (this.m.mentalagility)
		{
			repair_total_min += 20;
		}

		scale = this.Math.floor(repair_total_min * this.m.CurrentLevel * this.Const.PriestScale.repair_min);
		repair_total_min += scale;

		return repair_total_min;
	}

	function getTotalMaxRepair()
	{
		local repair_total_max = this.m.repair_base_max;
		local scale = 0;

		repair_total_max += this.m.SpellHolyPower;

		if (this.m.mentalagility)
		{
			repair_total_max += 20;
		}

		scale = this.Math.floor(repair_total_max * this.m.CurrentLevel * this.Const.PriestScale.repair_max);
		repair_total_max += scale;

		return repair_total_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local repair_total_min = getTotalMinRepair();
		local repair_total_max = getTotalMaxRepair();
		local effect = GetTotalEffect();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/repair.png",
			text = "Repair Body Armor for [color=" + this.Const.UI.Color.PositiveValue + "]" + repair_total_min + "[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]" + repair_total_max + "[/color] points."
		});

		if (this.m.inspiration)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/repair.png",
				text = "Head Armor can be repaired."
			});
		}

		if (this.m.repairmaster)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/repair.png",
				text = "Shield can be repaired."
			});
		}

		if (this.m.inspiration || this.m.repairmaster)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Body Armor is more priority than Head Armor, and Head Armor is more priority than Shield."
			});
		}

		if (this.m.mentalstrength)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Apply protection buff that reduces armor damage taken by [color=" + this.Const.UI.Color.PositiveValue + "]" + effect + "%[/color]."
			});
		}

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color] tiles."
		});

		return ret;
	}

	function onUpdate( _properties )
	{
		local user = this.getContainer().getActor();
		this.m.CurrentLevel = user.getLevel();
		this.m.mentalstrength = user.getSkills().hasSkill("perk.wow.priest.mentalstrength");
		this.m.mentalpower = user.getSkills().hasSkill("perk.wow.priest.mentalpower");
		this.m.mentalagility = user.getSkills().hasSkill("perk.wow.priest.mentalagility");
		this.m.inspiration = user.getSkills().hasSkill("perk.wow.priest.inspiration");
		this.m.repairmaster = user.getSkills().hasSkill("perk.wow.priest.repairmaster");
		this.m.unbreakablewill = user.getSkills().hasSkill("perk.wow.priest.unbreakablewill");
		this.m.T0_priest_head = _properties.T0_priest_head;
		this.m.SpellHolyPower = _properties.SpellHolyPower;
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.repairmaster)
		{
			this.m.ActionPointCost = 4;
		}
		
		if (this.m.unbreakablewill)
		{
			this.m.FatigueCost = 20;
		}		
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local targetEntity = _targetTile.getEntity();

		if (targetEntity.getHitpoints() <= 0)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(targetEntity))
		{
			return false;
		}

		if (!targetEntity.isAlive())
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local total_repair_min = getTotalMinRepair();
		local total_repair_max = getTotalMaxRepair();

		local repairnumber = this.Math.rand(total_repair_min, total_repair_max);

		this.getContainer().setBusy(true);

		this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, this.onApplyEffect.bindenv(this), {
			Skill = this,
			Target = targetEntity,
			User = _user,
			Repairnumber = repairnumber,
		});

		return true;
	}

	function onApplyEffect( _data )
	{
		local targetEntity = _data.Target;
		local user = _data.User;
		local repairnumber = _data.Repairnumber;
		local bodyitem = targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local headitem = targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local offhanditem = targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		local effect = GetTotalEffect();

		local currentBody = 0;
		local currentHead = 0;
		local currentShield = 0;
		local maxBody = 0;
		local maxHead = 0;
		local maxShield = 0;
		local missingBody = 0;
		local missingHead = 0;
		local missingShield = 0;

		local repairBody = 0;
		local repairHead = 0;
		local repairShield = 0;

		if (this.m.mentalstrength)
		{
			local mental = this.new("scripts/skills/effects/mentalstrength_effect");
			mental.setValue(effect);
			mental.resetTime(1);
			targetEntity.getSkills().add(mental);
			this.spawnIcon("effect_priest_mentalstrength", targetEntity.getTile());
		}

		if (bodyitem != null)
		{
			currentBody = bodyitem.getArmor();
			maxBody = bodyitem.getArmorMax();
			missingBody = maxBody - currentBody;
		}

		if (headitem != null)
		{
			currentHead = headitem.getArmor();
			maxHead = headitem.getArmorMax();
			missingHead = maxHead - currentHead;
		}

		if (offhanditem != null && offhanditem.isItemType(this.Const.Items.ItemType.Shield))
		{
			currentShield = offhanditem.getCondition();
			maxShield = offhanditem.getConditionMax();
			missingShield = maxShield - currentShield;
		}

		if (bodyitem)
		{
			if (missingBody)
			{
				if (missingBody >= repairnumber)
				{
					repairBody = repairnumber;
					repairnumber = repairnumber - repairBody;
				}
				else
				{
					repairBody = missingBody;
					repairnumber = repairnumber - repairBody;
				}
				bodyitem.setArmor(currentBody + repairBody);
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " Body Armor was restored for " + repairBody + " points");
			}			
		}

		if (this.m.inspiration)
		{
			if (headitem)
			{
				if (missingHead)
				{
					if (missingHead >= repairnumber)
					{
						repairHead = repairnumber;
						repairnumber = repairnumber - repairHead;
					}
					else
					{
						repairHead = missingHead;
						repairnumber = repairnumber - repairHead;
					}
					headitem.setArmor(currentHead + repairHead);
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " Head Armor was restored for " + repairHead + " points");
				}
			}
		}

		if (this.m.repairmaster)
		{
			if (offhanditem)
			{
				if (offhanditem.isItemType(this.Const.Items.ItemType.Shield))
				{
					if (missingShield >= repairnumber)
					{
						repairShield = repairnumber;
						repairnumber = repairnumber - repairShield;
					}
					else
					{
						repairShield = missingShield;
						repairnumber = repairnumber - repairShield;
					}
					offhanditem.setCondition(currentShield + repairShield);
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " Shield was restored for " + repairShield + " points");
				}
			}
		}

		user.addXP(repairBody + repairHead + repairShield);
		targetEntity.getSkills().update();
		this.spawnIcon("effect_priest_shield", targetEntity.getTile());

		_data.Skill.getContainer().setBusy(false);
	}
});