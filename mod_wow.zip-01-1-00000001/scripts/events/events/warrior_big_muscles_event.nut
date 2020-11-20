/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.warrior_big_muscles_event <- this.inherit("scripts/events/event", {
	m = {
		Warrior1 = null,
		Warrior2 = null
	},
	function create()
	{
		this.m.ID = "event.warrior_big_muscles";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warrior_big_muscles.png[/img]{%warrior1% tries to impress all allies with the strength and form of his musculature.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior1.getImagePath());

				if (_event.m.Warrior2 == null)
				{
					this.Options.push({
						Text = "Look at him!",
						function getResult( _event )
						{
							return "B1";
						}
					});
				}
				else
				{
					this.Options.push({
						Text = "Look at him!",
						function getResult( _event )
						{
							return "B2";
						}
					});
				}
			}
		});
		
		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_warrior_big_muscles.png[/img]{%warrior1% begins to take various poses, straining one or the other muscle group. It seems that no one in the squad can compare with him!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior1.getImagePath());

				_event.m.Warrior1.improveMood(1.5, "Bragged about muscles");
				if (_event.m.Warrior1.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior1.getMoodState()],
						text = _event.m.Warrior1.getName() + this.Const.MoodStateEvent[_event.m.Warrior1.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Impressive.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_warrior_big_muscles.png[/img]{%warrior1% begins to take various poses, straining one or the other muscle group. Suddenly %warrior2% laughingly begins to copy the same poses:%SPEECH_ON%Look, my muscles are as good as yours!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior1.getImagePath());
				this.Characters.push(_event.m.Warrior2.getImagePath());

				_event.m.Warrior1.worsenMood(2.0, "Failed to impress the squad");
				if (_event.m.Warrior1.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior1.getMoodState()],
						text = _event.m.Warrior1.getName() + this.Const.MoodStateEvent[_event.m.Warrior1.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Not bad.",
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
		local candidates_warrior = [];

		if (this.World.getTime().Days < 20)
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getBackground().getID() == "background.raider_warrior")
			{
				candidates_warrior.push(bro);
			}
		}

		if (candidates_warrior.len() == 0)
		{
			return;
		}

		local r;
		this.m.Warrior1 = candidates_warrior[0];

		if (candidates_warrior.len() >= 2)
		{
			r = this.Math.rand(1, candidates_warrior.len() - 1);
			this.m.Warrior2 = candidates_warrior[r];
		}

		this.m.Score = candidates_warrior.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"warrior1",
			this.m.Warrior1.getName()
		]);
		_vars.push([
			"warrior2",
			this.m.Warrior2 != null ? this.m.Warrior2.getName() : ""
		]);
	}

	function onClear()
	{
		this.m.Warrior1 = null;
		this.m.Warrior2 = null;
	}

});

