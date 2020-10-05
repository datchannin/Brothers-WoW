/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.hunter_chasing_hare_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter1 = null,
		Hunter2 = null
	},
	function create()
	{
		this.m.ID = "event.hunter_chasing_hare";
		this.m.Title = "On the road...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_chasing_hare.png[/img]{On the way, one of your brothers notices a huge hare sitting near the road. %hunter1% looks at %hunter2% and smiles:%SPEECH_ON%I bet my pet will catch this hare faster than yours%SPEECH_OFF%%hunter2% laughs:%SPEECH_ON%I bet no!\nHey anyone, tell me when to start!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter1.getImagePath());
				this.Characters.push(_event.m.Hunter2.getImagePath());

				this.Options.push({
					Text = "Three, two, one. Go!",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 50)
						{
							return "B1";
						}
						else
						{
							return "B2";
						}
					}
				});
				this.Options.push({
					Text = "Move forward.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_hunter_chasing_hare.png[/img]{Wolves rush after the hare, and in a minute you can no longer understand whose Winter Wolf overtakes the hare and tears it apart.\nHowever, when the %hunter1% laughs happily, you understand that this is his victory. %hunter2% in a rage begins to lash the wolf in the snout, and his wolf begins to growl at him}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter1.getImagePath());
				this.Characters.push(_event.m.Hunter2.getImagePath());

				_event.m.Hunter1.improveMood(1.0, "His pet the fastest");
				_event.m.Hunter2.worsenMood(1.0, "His pet lost the race");

				if (_event.m.Hunter1.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter1.getMoodState()],
						text = _event.m.Hunter1.getName() + this.Const.MoodStateEvent[_event.m.Hunter1.getMoodState()]
					});
				}
				if (_event.m.Hunter2.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter2.getMoodState()],
						text = _event.m.Hunter2.getName() + this.Const.MoodStateEvent[_event.m.Hunter2.getMoodState()]
					});
				}

				local r = this.Math.rand(1,10);
				if (r > 6)
				{
					_event.m.Hunter2.addLightInjury();
					this.List.push({
						id = 10,
						icon = "ui/icons/days_wounded.png",
						text = _event.m.Hunter2.getName() + " receives an injury from his pet"
					});
				}

				this.Options.push({
					Text = "How do you deal with these wild pets?",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_hunter_chasing_hare.png[/img]{Wolves rush after the hare, and in a minute you can no longer understand whose Winter Wolf overtakes the hare and tears it apart.\nHowever, when the %hunter2% laughs happily, you understand that this is his victory. %hunter1% in a rage begins to lash the wolf in the snout}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter1.getImagePath());
				this.Characters.push(_event.m.Hunter2.getImagePath());

				_event.m.Hunter2.improveMood(1.0, "His pet the fastest");
				_event.m.Hunter1.worsenMood(1.0, "His pet lost the race");

				if (_event.m.Hunter2.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter2.getMoodState()],
						text = _event.m.Hunter2.getName() + this.Const.MoodStateEvent[_event.m.Hunter2.getMoodState()]
					});
				}
				if (_event.m.Hunter1.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter1.getMoodState()],
						text = _event.m.Hunter1.getName() + this.Const.MoodStateEvent[_event.m.Hunter1.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Good competitions.",
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

		if (this.World.getTime().Days < 40)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_hunter = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 4)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_hunter")
			{
				candidates_hunter.push(bro);
			}
		}

		if (candidates_hunter.len() < 2)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_hunter.len() - 1);
		this.m.Hunter1 = candidates_hunter[r];
		candidates_hunter.remove(r);
		r = this.Math.rand(0, candidates_hunter.len() - 1);
		this.m.Hunter2 = candidates_hunter[r];
		
		this.m.Score = (candidates_hunter.len() + 1) * 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"hunter1",
			this.m.Hunter1.getName()
		]);
		_vars.push([
			"hunter2",
			this.m.Hunter2.getName()
		]);
	}

	function onClear()
	{
		this.m.Hunter1 = null;
		this.m.Hunter2 = null;
	}

});

