this.camouflage_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.camouflage";
		this.m.Name = "Camouflage";
		this.m.Icon = "ui/perks/perk_rogue_camouflage.png";
		this.m.IconMini = "perk_30_mini";
		this.m.Overlay = "perk_30";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character sneaked around for this turn.";
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
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Defense increased by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color]"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Ignores hostile zone of control"
			},
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 20;
		_properties.IsImmuneToZoneOfControl = true;
	}

	function onTurnStart()
	{
		this.removeSelf();
	}

});

