this.priest_vs_zombie_event <- this.inherit("scripts/events/event", {
	m = {
		Priest = null
	},
	function create()
	{
		this.m.ID = "event.priest_vs_zombie";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_priest_vs_zombie.png[/img]{During the fight with a group of undead, you see that several of them surrounded %priest%.\n\nHe is holding on, and by the light of his eyes you understand that right now he is praying.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "Hold on!",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 80)
						{
							return "B1";
						}
						else
						{
							return "B2";
						}
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_priest_vs_zombie.png[/img]{Bright light surrounded %priest% and the undead backed away.\nIn a moment they all turned around and run.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());

				_event.m.Priest.improveMood(1.0, "Has Light protection against an undead");
				if (_event.m.Priest.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Priest.getMoodState()],
						text = _event.m.Priest.getName() + this.Const.MoodStateEvent[_event.m.Priest.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Undead hate Light.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_priest_vs_zombie.png[/img]{The light around %priest% becomes fainter and fainter, and it completely disappears...\n\nBy the power of other brothers, you kill the undeads and save %priest% from certain death!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());

				_event.m.Priest.worsenMood(2.0, "Was not able to drive away undead");
				if (_event.m.Priest.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Priest.getMoodState()],
						text = _event.m.Priest.getName() + this.Const.MoodStateEvent[_event.m.Priest.getMoodState()]
					});
				}

				local r = this.Math.rand(1, 10);
				if (r > 2)
				{
					_event.m.Priest.addLightInjury();
					this.List.push({
						id = 10,
						icon = "ui/icons/days_wounded.png",
						text = _event.m.Priest.getName() + " suffers light wounds"
					});
				}
				else
				{
					local injury = _event.m.Priest.addInjury(this.Const.Injury.Accident2);
					this.List.push({
						id = 10,
						icon = injury.getIcon(),
						text = _event.m.Priest.getName() + " suffers " + injury.getNameOnly()
					});
				}

				this.Options.push({
					Text = "At least heal yourself.",
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
		local candidates_priest = [];

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 5)
			{
				continue;
			}		

			if (bro.getBackground().getID() == "background.raider_priest")
			{
				candidates_priest.push(bro);
			}
		}

		if (candidates_priest.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_priest.len() - 1);
		this.m.Priest = candidates_priest[r];

		this.m.Score = candidates_priest.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"priest",
			this.m.Priest.getName()
		]);
	}

	function onClear()
	{
		this.m.Priest = null;
	}

});

