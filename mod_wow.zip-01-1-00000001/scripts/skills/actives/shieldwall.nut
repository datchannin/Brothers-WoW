/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.shieldwall <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.shieldwall";
		this.m.Name = "Shieldwall";
		this.m.Description = "The shield is raised to a protective stance until next turn. Allies using Shieldwall next to each other further increase their protection by overlapping their shields.";
		this.m.Icon = "skills/active_15.png";
		this.m.IconDisabled = "skills/active_15_sw.png";
		this.m.Overlay = "active_15";
		this.m.SoundOnUse = [
			"sounds/combat/shieldwall_01.wav",
			"sounds/combat/shieldwall_02.wav",
			"sounds/combat/shieldwall_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		local mult = 1.0;

		if ((this.getContainer().getActor().getCurrentProperties().IsSpecializedInShields) || (this.getContainer().getActor().getCurrentProperties().IsMasterInShields))
		{
			if ((this.getContainer().getActor().getCurrentProperties().IsSpecializedInShields) && (this.getContainer().getActor().getCurrentProperties().IsMasterInShields))
			{
				mult = mult * 1.5;
			}
			else
			{
				mult = mult * 1.25;
			}
		}

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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Grants [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.floor(item.getMeleeDefense() * mult) + "[/color] Melee Defense for one turn"
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Grants [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.floor(item.getRangedDefense() * mult) + "[/color] Ranged Defense for one turn"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Grants an additional [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Defense against all attacks for each ally adjacent also using Shieldwall"
			}
		];
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.shieldwall");
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Container.add(this.new("scripts/skills/effects/shieldwall_effect"));

		if (!_user.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses Shieldwall");
		}

		return true;
		return false;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.shieldwall");
	}

});

