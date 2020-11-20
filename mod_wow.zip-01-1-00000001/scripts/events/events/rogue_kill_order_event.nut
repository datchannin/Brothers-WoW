/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.rogue_kill_order_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null
	},
	function create()
	{
		this.m.ID = "event.rogue_kill_order";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_rogue_kill_order.png[/img]{On the way you meet a man in a black mask. He turned out to be a longtime acquaintance of %rogue%. And they have a quiet conversation long enough. \n%rogue% approaches you with a request:%SPEECH_ON%Boss, I owe him, and I would like to repay the debt. He asks to kill one of his competitors.%SPEECH_OFF%You are pondering this situation.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				local rogue_learn_poison = _event.m.Rogue.getSkills().hasSkill("perk.wow.rogue.vilepoison");
				local rogue_learn_offdagger = _event.m.Rogue.getSkills().hasSkill("perk.wow.rogue.camouflage");

				if (rogue_learn_poison)
				{
					this.Options.push({
						Text = "You are poison master, use it!",
						function getResult( _event )
						{
							return "B";
						}
					});
				}

				if (rogue_learn_offdagger)
				{
					this.Options.push({
						Text = "You know how to use dagger!",
						function getResult( _event )
						{
							return "C";
						}
					});
				}

				this.Options.push({
					Text = "Do what you have to!",
					function getResult( _event )
					{
						return "D";
					}
				});

				this.Options.push({
					Text = "You are not assassin!",
					function getResult( _event )
					{
						return "E";
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/world/event_rogue_kill_order.png[/img]{%rogue% nods and leaves to carry out an assignment.\n\nНe returns only a few hours later in an excellent mood:%SPEECH_ON%It is done. A couple of drops of my poison will kill even an elephant, and this person even more!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				_event.m.Rogue.improveMood(2.0, "Killed using poison");
				if (_event.m.Rogue.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You are master.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/world/event_rogue_kill_order.png[/img]{%rogue% nods and leaves to carry out an assignment.\n\nНe returns only a few hours later in an excellent mood:%SPEECH_ON%It is done. My dagger is so sharp that he didn\'t even realize he was dead!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				_event.m.Rogue.improveMood(2.0, "Killed using daggers");
				if (_event.m.Rogue.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You are master.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/world/event_rogue_kill_order.png[/img]{%rogue% nods and leaves to carry out an assignment.\n\nHe returns only a few hours later, but with a serious injury:%SPEECH_ON%I did everything I could, the guards grabbed me. Lucky I ran away at all!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				_event.m.Rogue.worsenMood(2.0, "Was not able to kill the target");
				if (_event.m.Rogue.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}

				local injury = _event.m.Rogue.addInjury([
					{
						ID = "injury.missing_eye",
						Threshold = 0.0,
						Script = "injury_permanent/missing_eye_injury"
					}
				]);
				this.List.push({
					id = 10,
					icon = injury.getIcon(),
					text = _event.m.Rogue.getName() + " suffers " + injury.getNameOnly()
				});
				_event.m.Rogue.getSkills().update();
				_event.m.Rogue.updateInjuryVisuals();

				this.Options.push({
					Text = "Why did I agree?",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/world/event_rogue_kill_order.png[/img]{%rogue% and a man in a black mask argue for a long time. Finally the stranger leaves:%SPEECH_ON%I will never forgive you, my friend!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				_event.m.Rogue.worsenMood(3.0, "Refused to perform the order");
				if (_event.m.Rogue.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}

				this.Options.push({
					Text = "I know what is better!",
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
		local candidates_rogue = [];

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

