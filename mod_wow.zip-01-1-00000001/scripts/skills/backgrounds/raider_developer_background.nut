/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.raider_developer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.raider_developer";
		this.m.Name = "Developer";
		this.m.Icon = "ui/backgrounds/background_developer.png";
		this.m.BackgroundDescription = "This background was implemented for developer tasks.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 1;
		this.m.DailyCost = 1;
		this.m.Excluded = [
		];
		this.m.Titles = [
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(3, 5);
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
			}
		];
	}

	function onBuildDescription()
	{
		return "{He is bbWoW mod developer, use him wisely!}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				250,
				250
			],
			Bravery = [
				250,
				250
			],
			Stamina = [
				250,
				250
			],
			MeleeSkill = [
				250,
				250
			],
			RangedSkill = [
				250,
				250
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				250,
				250
			]
		};
		return c;
	}

	function onAddEquipment()
	{
	}

});