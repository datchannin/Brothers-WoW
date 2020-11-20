/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_heal_beggar_event <- this.inherit("scripts/events/event", {
	m = {
		Paladin = null
	},
	function create()
	{
		this.m.ID = "event.paladin_heal_beggar";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_paladin_heal_beggar.png[/img]{Near the road you meet a beggar who cannot even move by himself.%SPEECH_ON%Kind people, help me. I have nothing to eat and nowhere to sleep. Give at least some money...%SPEECH_OFF%You see that %paladin% would like to do more for this person.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "Heal him, %paladin%.",
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
					Text = "Move on.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
		
		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_paladin_heal_beggar.png[/img]{Bright light surrounded %paladin% and the same light appers near beggar.\nYou are happy to see that a sick person become healthy again!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());

				_event.m.Paladin.improveMood(1.5, "Cured a beggar");
				if (_event.m.Paladin.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Paladin.getMoodState()],
						text = _event.m.Paladin.getName() + this.Const.MoodStateEvent[_event.m.Paladin.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You did everything right.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_paladin_heal_beggar.png[/img]{Bright light surrounded %paladin% and the same light appers near beggar.\nSuddenly the beggar jumps up and runs away with a loud cry. It seems he was an ordinary crook!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());

				_event.m.Paladin.worsenMood(2.0, "Did not recognize the fraud");
				if (_event.m.Paladin.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Paladin.getMoodState()],
						text = _event.m.Paladin.getName() + this.Const.MoodStateEvent[_event.m.Paladin.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You are too naive.",
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
		local candidates_paladin = [];

		if (this.World.getTime().Days < 10)
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getBackground().getID() == "background.raider_paladin")
			{
				candidates_paladin.push(bro);
			}
		}

		if (candidates_paladin.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_paladin.len() - 1);
		this.m.Paladin = candidates_paladin[r];

		this.m.Score = candidates_paladin.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"paladin",
			this.m.Paladin.getName()
		]);
	}

	function onClear()
	{
		this.m.Paladin = null;
	}

});

