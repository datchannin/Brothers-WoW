/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.08, game_version = 1.4.0.39*/
this.priest_powerwordshield_skill <- this.inherit("scripts/skills/skill", {
	m = {
		repair_base_min = 10,
		repair_base_max = 15,
		mentalstrength = false,
		mentalagility = false,
		inspiration = false,
		repairmaster = false
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
			//"sounds/combat/priest_heal_precast.wav"
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
		this.m.ActionPointCost = 1;//6;
		this.m.FatigueCost = 1;//30;
		this.m.MinRange = 0;
		this.m.MaxRange = 2;
	}

	function getTotalMinRepair()
	{
		local repair_total_min = this.m.repair_base_min;

		return repair_total_min;
	}

	function getTotalMaxRepair()
	{
		local repair_total_max = this.m.repair_base_max;

		return repair_total_max;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local repair_total_min = getTotalMinRepair();
		local repair_total_max = getTotalMaxRepair();

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/repair_item.png",
			text = "Repair target\'s Body Armor for [color=" + this.Const.UI.Color.PositiveValue + "]" + repair_total_min + "[/color] - [color=" + this.Const.UI.Color.PositiveValue + "]" + repair_total_max + "[/color] points."
		});

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
		this.m.mentalstrength = user.getSkills().hasSkill("perk.wow.priest.mentalstrength");
		this.m.mentalagility = user.getSkills().hasSkill("perk.wow.priest.mentalagility");
		this.m.inspiration = user.getSkills().hasSkill("perk.wow.priest.inspiration");
		this.m.repairmaster = user.getSkills().hasSkill("perk.wow.priest.repairmaster");
	}

	function onAfterUpdate( _properties )
	{
		if (this.m.repairmaster)
		{
			this.m.MaxRange = 3;
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

		this.Time.scheduleEvent(this.TimeUnit.Real, 200, this.onApplyEffect.bindenv(this), {
			Skill = this,
			Target = targetEntity,
			Repairnumber = repairnumber,
		});

		return true;
	}

	function onApplyEffect( _data )
	{
		local targetEntity = _data.Target;
		local repairnumber = _data.Repairnumber;
		local bodyitem = targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local headitem = targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Head);

		local currentBody = 0;
		local currentHead = 0;
		local maxBody = 0;
		local maxHead = 0;
		local missingBody = 0;
		local missingHead = 0;

		local repairBody = 0;
		local repairHead = 0;

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
			}			
			bodyitem.setArmor(currentBody + repairBody);
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " Body Armor was restored for " + repairBody + " points");
		}

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
			}
			headitem.setArmor(currentHead + repairHead);
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(targetEntity) + " Head Armor was restored for " + repairHead + " points");
		}

		targetEntity.getSkills().update();
		this.spawnIcon("skill_priest_shield", targetEntity.getTile());

		_data.Skill.getContainer().setBusy(false);
	}
});