this.mage_against_robbers_event <- this.inherit("scripts/events/event", {
	m = {
		Mage = null
	},
	function create()
	{
		this.m.ID = "event.mage_against_robbers";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_mage_against_robbers.png[/img]{On the road %mage% is captured by robbers. They are near him on all sides and mage is almost surrounded.\n\nYour squad is in a hurry to help, but you realize that you don't have time:%SPEECH_ON%%mage%! Listen to my order!%SPEECH_OFF%There is still hope that the mage will break free.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "Burn them!",
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
					Text = "Freeze them.",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 80)
						{
							return "C1";
						}
						else
						{
							return "C2";
						}
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_mage_against_robbers.png[/img]{%mage% obeys the order and begins to use the fireball. Fire scatters all the robbers at once.\n\nThey scatter, while some of them run away with very severe burns!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());

				local bravery_value = Math.rand(3, 4);
				_event.m.Mage.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Mage.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				_event.m.Mage.getSkills().update();

				_event.m.Mage.improveMood(1.0, "Was able to burn some robbers");
				if (_event.m.Mage.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage.getMoodState()],
						text = _event.m.Mage.getName() + this.Const.MoodStateEvent[_event.m.Mage.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Lot\'s ash around you.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_mage_against_robbers.png[/img]{%mage% obeys the order and begins to use the fireball. When suddenly one of the bandits growls loudly at him. %mage% was feared and stops the spell.\n\nBandits retreat only when they see your entire squad.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());

				local bravery_value = Math.rand(3, 4);
				_event.m.Mage.getBaseProperties().Bravery -= bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Mage.getName() + " lost [color=" + this.Const.UI.Color.NegativeEventValue + "]-" + bravery_value + "[/color] Resolve"
				});
				_event.m.Mage.getSkills().update();

				_event.m.Mage.worsenMood(1.0, "Scared of robbers");
				if (_event.m.Mage.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage.getMoodState()],
						text = _event.m.Mage.getName() + this.Const.MoodStateEvent[_event.m.Mage.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You\'re a coward.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C1",
			Text = "[img]gfx/ui/events/world/event_mage_against_robbers.png[/img]{%mage% obeys the order and begins to use the frostbolt. Ice scatters all the robbers at once.\n\nThey scatter, while some of them run away with very severe frostbite!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());

				local bravery_value = Math.rand(2, 5);
				_event.m.Mage.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Mage.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				_event.m.Mage.getSkills().update();

				_event.m.Mage.improveMood(1.0, "Was able to freeze some robbers");
				if (_event.m.Mage.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage.getMoodState()],
						text = _event.m.Mage.getName() + this.Const.MoodStateEvent[_event.m.Mage.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Frozen meat.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
		
		this.m.Screens.push({
			ID = "C2",
			Text = "[img]gfx/ui/events/world/event_mage_against_robbers.png[/img]{%mage% obeys the order and begins to use the frostbolt. When suddenly one of the bandits growls loudly at him. %mage% was feared and stops the spell.\n\nBandits retreat only when they see your entire squad.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());

				local bravery_value = Math.rand(2, 5);
				_event.m.Mage.getBaseProperties().Bravery -= bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Mage.getName() + " lost [color=" + this.Const.UI.Color.NegativeEventValue + "]-" + bravery_value + "[/color] Resolve"
				});
				_event.m.Mage.getSkills().update();

				_event.m.Mage.worsenMood(1.0, "Scared of robbers");
				if (_event.m.Mage.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage.getMoodState()],
						text = _event.m.Mage.getName() + this.Const.MoodStateEvent[_event.m.Mage.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You\'re a coward.",
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

		local candidates_mage = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_mage")
			{
				candidates_mage.push(bro);
			}
		}

		if (candidates_mage.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_mage.len() - 1);
		this.m.Mage = candidates_mage[r];

		this.m.Score = candidates_mage.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"mage",
			this.m.Mage.getName()
		]);
	}

	function onClear()
	{
		this.m.Mage = null;
	}

});

