this.druid_maul_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.maul_skill";
		this.m.Name = "Maul";
		this.m.Description = "Рit the enemy with a heavy paw, causing physical damage.";
		this.m.KilledString = "Torned down";
		this.m.Icon = "ui/perks/skill_druid_maul.png";
		this.m.IconDisabled = "ui/perks/skill_druid_maul_sw.png";
		this.m.Overlay = "skill_druid_maul";
		this.m.SoundOnUse = [
			//"sounds/combat/.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsUsingActorPitch = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.1;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 12;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local ret = this.getDefaultTooltip();
		
		return ret;
	}

	function isHidden()
	{
		if (this.m.IsHidden)
		{
			return true;
		}
		else
		{
			if (!this.m.Container.hasSkill("effects.bearform"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	function onUpdate( _properties )
	{
		_properties.DamageRegularMin += 25;
		_properties.DamageRegularMax += 30;
		_properties.DamageArmorMult *= 0.8;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectClaws);
		return this.attackEntity(_user, _targetTile.getEntity());
	}
});