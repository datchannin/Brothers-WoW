/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.priest_bless_peasant_event <- this.inherit("scripts/events/event", {
	m = {
		Priest = null
	},
	function create()
	{
		this.m.ID = "event.priest_bless_peasant";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_priest_bless_peasant.png[/img]{On the road you meet a peasant who is sitting next to a murdered woman. Maybe it\'s his wife or daughter.%SPEECH_ON%The whole world is dead to me!%SPEECH_OFF%When the peasant has spoken these words, %priest% approaches you:%SPEECH_ON%I can give him Light blessing, maybe it can calm this person.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "%priest%, bless him!",
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
				this.Options.push({
					Text = "Keep moving.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_priest_bless_peasant.png[/img]{%priest% prays and his hands begin to glow with a bright white light.\nSoon the same light envelops the lonely men.%SPEECH_ON%Thank you, priest. It\'s easier for me to live. Because now I know that the Light is always around me!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());

				_event.m.Priest.improveMood(1.0, "Was able to bless the peasant");
				if (_event.m.Priest.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Priest.getMoodState()],
						text = _event.m.Priest.getName() + this.Const.MoodStateEvent[_event.m.Priest.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Light is around you.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_priest_bless_peasant.png[/img]{%priest% prays and his hands begin to glow with a bright white light.\nSoon the same light envelops the lonely men. But suddenly the light disappears...%SPEECH_ON%Move away, priest. Even the Light deny me!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());

				_event.m.Priest.worsenMood(2.0, "Was not able to bless the peasant");
				if (_event.m.Priest.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Priest.getMoodState()],
						text = _event.m.Priest.getName() + this.Const.MoodStateEvent[_event.m.Priest.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Light was left you, %priest%?",
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

		this.m.Score = candidates_priest.len() * 10;
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

