/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.warlock_child_soul_event <- this.inherit("scripts/events/event", {
	m = {
		Warlock = null
	},
	function create()
	{
		this.m.ID = "event.warlock_child_soul";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warlock_child_soul.png[/img]{You are moving forward and your squad is spread out along the entire length of the road.\n\nAfter you have passed the next turn, you notice that a %warlock% is standing nearby in the clearing and holding a child\'s hand. From a distance you cannot tell whether it is a boy or a girl, but the warlock is doing something.\n\nHe drinks the soul of a child!!!\nYou are furious, but you realize that you will not have time to run over the %warlock%.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				this.Options.push({
					Text = "What are you doing!?",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 75)
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
			Text = "[img]gfx/ui/events/world/event_warlock_child_soul.png[/img]{While you run up to the %warlock%, he manages to absorb the child\'s soul. The baby\'s body lies on the ground, and the warlock seems full of strength and energy.\n\nAll the soldiers of the squad are terrified of the death of a child.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				local stamina_value = Math.rand(11, 14);
				_event.m.Warlock.getBaseProperties().Stamina += stamina_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/fatigue.png",
					text = _event.m.Warlock.getName() + " drains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina_value + "[/color] Stamina"
				});

				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					if (bro.getID() == _event.m.Warlock.getID())
					{
						continue;
					}

					bro.worsenMood(2.0, "Horrified by the child\'s soul drain");

					if (bro.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}

				_event.m.Warlock.getSkills().update();

				this.Options.push({
					Text = "This is terrible!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_warlock_child_soul.png[/img]{While you run up to the %warlock%, he continues to consume the child\'s soul.\nSuddenly the kid takes out a knife under his shirt and pierces the warlock, then runs away screaming.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				_event.m.Warlock.worsenMood(1.0, "Was not able to drain child soul");
				if (_event.m.Warlock.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warlock.getMoodState()],
						text = _event.m.Warlock.getName() + this.Const.MoodStateEvent[_event.m.Warlock.getMoodState()]
					});
				}

				local injury = _event.m.Warlock.addInjury(this.Const.Injury.PiercingBody);
				this.List.push({
					id = 10,
					icon = injury.getIcon(),
					text = _event.m.Warlock.getName() + " suffers " + injury.getNameOnly()
				});

				this.Options.push({
					Text = "You got what you deserve.",
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

		if (this.World.getTime().Days < 30)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_warlock = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 6)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_warlock")
			{
				candidates_warlock.push(bro);
			}
		}

		if (candidates_warlock.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_warlock.len() - 1);
		this.m.Warlock = candidates_warlock[r];
		
		this.m.Score = candidates_warlock.len() * 10;
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
	}

	function onClear()
	{
		this.m.Warlock = null;
	}

});

