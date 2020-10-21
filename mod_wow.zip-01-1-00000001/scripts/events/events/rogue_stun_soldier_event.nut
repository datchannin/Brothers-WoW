/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.rogue_stun_soldier_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null
	},
	function create()
	{
		this.m.ID = "event.rogue_stun_soldier";
		this.m.Title = "On the road...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_rogue_stun_soldier.png[/img]{A small group of soldiers passes by you on the road. %rogue% is clearly in a good mood:%SPEECH_ON%See what I can do! I will stun one of them!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				if (this.Math.rand(1, 100) <= 80)
				{
					_event.m.Rogue.improveMood(1.5, "Was able to stun the soldier");
					if (_event.m.Rogue.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
							text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
						});
					}
					this.Options.push({
						Text = "Good!",
						function getResult( _event )
						{
							return 0;
						}
					});
				}
				else
				{
					_event.m.Rogue.worsenMood(1.5, "Was beaten by a soldier");
					if (_event.m.Rogue.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
							text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
						});
					}

					local r = this.Math.rand(1, 10);
					if (r > 2)
					{
						_event.m.Rogue.addLightInjury();
						this.List.push({
							id = 10,
							icon = "ui/icons/days_wounded.png",
							text = _event.m.Rogue.getName() + " suffers light wounds"
						});
					}
					else
					{
						local injury = _event.m.Rogue.addInjury(this.Const.Injury.Accident2);
						this.List.push({
							id = 10,
							icon = injury.getIcon(),
							text = _event.m.Rogue.getName() + " suffers " + injury.getNameOnly()
						});
					}
					this.Options.push({
						Text = "Loser",
						function getResult( _event )
						{
							return 0;
						}
					});
				}
			}
		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_rogue = [];

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}		

			if (bro.getBackground().getID() == "background.raider_rogue")
			{
				candidates_rogue.push(bro);
			}
		}

		if (candidates_rogue.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_rogue.len() - 1);
		this.m.Rogue = candidates_rogue[r];

		this.m.Score = candidates_rogue.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"rogue",
			this.m.Rogue.getName()
		]);
	}

	function onClear()
	{
		this.m.Rogue = null;
	}

});

