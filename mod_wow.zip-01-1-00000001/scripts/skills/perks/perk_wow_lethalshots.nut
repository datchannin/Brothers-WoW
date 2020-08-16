/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.04, game_version = 1.4.0.36*/
this.perk_wow_lethalshots <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.lethalshots";
		this.m.Name = this.Const.Wow_strings.PerkName.LethalShots;
		this.m.Description = this.Const.Wow_strings.PerkDescription.LethalShots;
		this.m.Icon = "ui/perks/perk_hunter_lethalshots.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID())
		{
			return;
		}

		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(this.getContainer().getActor()))
		{
			return;
		}

		if (!_targetEntity.isTurnStarted() && !_targetEntity.isTurnDone())
		{
			local r;
			r = this.Math.rand(0, 99);
			if (r <= 32)
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));
			}
		}
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID())
		{
			return;
		}

		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(this.getContainer().getActor()))
		{
			return;
		}

		if (!_targetEntity.isTurnStarted() && !_targetEntity.isTurnDone())
		{
			local r;
			r = this.Math.rand(0, 99);
			if (r <= 32)
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));
			}
		}
	}
});