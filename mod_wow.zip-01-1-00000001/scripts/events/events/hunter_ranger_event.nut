/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.hunter_ranger_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.hunter_ranger";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_ranger.png[/img]{%hunter% and %other% recall an ancient legend about a shot at an apple on a child\'s head.\nA long dispute leads nowhere, and %other% leaves the camp in a rage. An hour later he returns, leading the crying boy.%SPEECH_ON%Well, let\'s check our skills?%SPEECH_OFF%he asks. The boy is tied to a tree and an apple is placed on his head.%SPEECH_ON%Boss, can we have some fun?%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				this.Options.push({
					Text = "Try to pierce the apple with an arrow.",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 20)
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
					Text = "It\'s dangerous, just knock the apple with a stone.",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 50)
						{
							return "C1";
						}
						else
						{
							return "C2";
						}
					}
				});
				this.Options.push({
					Text = "Let the boy go. Back to our business.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_hunter_ranger.png[/img]{%other% wants to shoot the first. He takes a long aim and shoots...\nThe arrow hits the middle of the boy\'s head. Blood flows like a stream from the wound. The boy died without even being surprised.\nAll members of the squad look around in fear and hurry to get away from this place.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Other.getImagePath());

				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					bro.worsenMood(2.0, "Horrified by the death of the boy");

					if (bro.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}

				this.Options.push({
					Text = "Get out of here.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_hunter_ranger.png[/img]{%hunter% quickly takes out his bow and shoots the apple. The arrow hits the target.\n%hunter% takes out another arrow, and it also hits the apple. After the third arrow, %other% stops waiting and says:%SPEECH_ON%You are a master with a bow, I agree to be defeat!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				local ranged_skill_value = Math.rand(3, 5);
				local bravery_value = Math.rand(2, 4);

				_event.m.Hunter.getBaseProperties().RangedSkill += ranged_skill_value;
				_event.m.Hunter.getBaseProperties().Bravery += bravery_value;

				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Hunter.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				this.List.push({
					id = 5,
					icon = "ui/icons/ranged_skill.png",
					text = _event.m.Hunter.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + ranged_skill_value + "[/color] Ranged Skill"
				});

				_event.m.Hunter.getSkills().update();

				this.Options.push({
					Text = "%hunter% looks happy.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C1",
			Text = "[img]gfx/ui/events/world/event_hunter_ranger.png[/img]{%hunter% and %other% begin to throw stones one by one, but apparently none of them know how to properly use such shells. And nobody can hit the apple. \nWhen everyone is bored with this activity, you order to stop. You leave this place, and the boy is left in tears from fear.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Hunter.worsenMood(1.0, "Was not able to win the competition");
				_event.m.Other.worsenMood(1.0, "Don\'t know how to throw stones");

				if (_event.m.Hunter.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				if (_event.m.Other.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
						text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Waste of time!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
		
		this.m.Screens.push({
			ID = "C2",
			Text = "[img]gfx/ui/events/world/event_hunter_ranger.png[/img]{%hunter% and %other% begin to throw stones again and again. Suddenly, after another throw, the boy begins to scream loudly. You come closer, and see that %other% knocked out boy\'s eye with a stone. The hunter starts laughing wildly:%SPEECH_ON%I think that the victory is mine!%SPEECH_OFF%he says laughing...}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Hunter.improveMood(1.0, "Funny from someone else\'s failure");
				_event.m.Other.worsenMood(2.0, "Сrippled the boy");

				if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}
				if (_event.m.Other.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
						text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You are both idiots.",
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

		if (this.World.getTime().Days < 20)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_hunter = [];
		local candidates_other = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_hunter")
			{
				candidates_hunter.push(bro);
			}
			else if (bro.getCurrentProperties().RangedSkill > 50)
			{
				candidates_other.push(bro);
			}
		}

		if (candidates_hunter.len() == 0)
		{
			return;
		}

		if (candidates_other.len() == 0)
		{
			if (candidates_hunter.len() < 2)
			{
				return;
			}
		}

		local r = this.Math.rand(0, candidates_hunter.len() - 1);
		this.m.Hunter = candidates_hunter[r];
		candidates_hunter.remove(r);
		
		if (candidates_other.len() > 0)
		{
			this.m.Other = candidates_other[this.Math.rand(0, candidates_other.len() - 1)];
		}
		else if (candidates_hunter.len() > 0)
		{
			this.m.Other = candidates_hunter[this.Math.rand(0, candidates_hunter.len() - 1)];
		}
		else
		{
			return;
		}
		
		this.m.Score = 14;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"hunter",
			this.m.Hunter.getName()
		]);
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Hunter = null;
		this.m.Other = null;
	}

});

