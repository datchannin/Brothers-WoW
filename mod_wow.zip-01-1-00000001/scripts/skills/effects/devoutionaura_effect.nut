/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.41*/
this.devoutionaura_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.devoutionaura";
		this.m.Name = "Devoution Aura";
		this.m.Description = "You is under paladin Devoution Aura now. Your Melee Defence is increased by Paladin\'s Aura. Keep closer.";
		this.m.Icon = "ui/perks/perk_paladin_devoutionaura.png";
		this.m.IconMini = "effect_mini_devoutionaura";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 + "[/color] Melee Defense"
			}
		];
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
		{
			return 0;
		}

		local myTile = actor.getTile();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local isBonusShouldApply = 0;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			if (ally.getTile().getDistanceTo(myTile) > 4)
			{
				continue;
			}

			if (ally.getSkills().hasSkill("perk.wow.paladin.devoutionaura"))
			{
				if (ally.getCurrentProperties().IsDevoutionAuraActive)
				{
					isBonusShouldApply = 1;
				}
			}
		}

		return isBonusShouldApply;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = true;
	}
	
	function onAfterUpdate( _properties )
	{
		local bonus = this.getBonus();
		local actor = this.getContainer().getActor();
		if (bonus == 1)
		{
			this.m.IsHidden = false;
			_properties.MeleeDefense += 10;
			if (actor.hasSprite("aura"))
			{
				actor.getSprite("aura").setBrush("anim_paladin_devoutionaura");
				actor.getSprite("aura").Visible = true;
			}
		}
		else
		{
			this.m.IsHidden = true;
			if (actor.hasSprite("aura"))
			{
				actor.getSprite("aura").Visible = false;
			}
		}
	}
});