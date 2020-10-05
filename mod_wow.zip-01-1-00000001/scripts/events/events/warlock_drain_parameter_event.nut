this.warlock_drain_parameter_event <- this.inherit("scripts/events/event", {
	m = {
		Warlock = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.warlock_drain_parameter";
		this.m.Title = "During camp...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warlock_drain_parameter.png[/img]{At a camp, %warlock% disputes with %other%. You do not listen to the conversation, but after a while you notice that the voice of only one warlock is heard.\nWhen you turn towards them, you only have time to notice a thin red line pulsing between %warlock% and %other%.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "Try to stop it.",
					function getResult( _event )
					{
						return "B1";
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_warlock_drain_parameter.png[/img]{Seems %warlock% managed to get some of the ally\'s life force!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				local hp_value = Math.rand(5, 7);

				_event.m.Warlock.getBaseProperties().Hitpoints += hp_value;
				_event.m.Other.getBaseProperties().Hitpoints -= hp_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/health.png",
					text = _event.m.Warlock.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + hp_value + "[/color] Hitpoints"
				});
				this.List.push({
					id = 5,
					icon = "ui/icons/health.png",
					text = _event.m.Other.getName() + " loses [color=" + this.Const.UI.Color.NegativeEventValue + "]-" + hp_value + "[/color] Hitpoints"
				});
				_event.m.Warlock.getSkills().update();
				_event.m.Other.getSkills().update();

				_event.m.Other.worsenMood(1.0, "Has lost part of his life power");
				if (_event.m.Other.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
						text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Terrible exchange.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (this.World.getTime().Days < 10)
		{
			return;
		}

		local candidates_warlock = [];
		local candidates_other = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.raider_warlock")
			{
				candidates_warlock.push(bro);
			}
			else
			{
				if (bro.getSkills().hasSkill("trait.player"))
				{
					continue;
				}

				if (bro.getBaseProperties().Hitpoints >= 30)
				{
					candidates_other.push(bro);
				}
			}
		}



		if (candidates_warlock.len() == 0)
		{
			return;
		}
		if (candidates_other.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_warlock.len() - 1);
		this.m.Warlock = candidates_warlock[r];
		r = this.Math.rand(0, candidates_other.len() - 1);
		this.m.Other = candidates_other[r];

		this.m.Score = 17;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"warlock",
			this.m.Warlock.getName()
		]);
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Warlock = null;
		this.m.Other = null;
	}

});

