/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warlock_necromant_event <- this.inherit("scripts/events/event", {
	m = {
		Warlock = null
	},
	function create()
	{
		this.m.ID = "event.warlock_necromant";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warlock_necromant.png[/img]{You hear screams in the distance and rush to see what is happening there.\nA crowd of peasants grabbed the man and is already tying him to a post. Most likely they are going to burn it.\nYou cannot watch what is happening:%SPEECH_ON%What's going on here?%SPEECH_OFF%%SPEECH_ON%Sir, this man is a sorcerer. He is a necromancer.\nWe're going to execute him.%SPEECH_OFF%The sorcerer looks at you, but he is silent. The warlock approaches and whispers:%SPEECH_ON%Boss, I can feel his power. Seems it looks like mine. I cannot leave him, I need to help.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "%warlock%, try help him.",
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
					Text = "Let\'s save him.",
					function getResult( _event )
					{
						return "C1";
					}
				});
				this.Options.push({
					Text = "It\'s not our business.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_warlock_necromant.png[/img]{You send %warlock% to deal with this situation.\nThe necromancer is tied to a tree and a fire is lit under. %warlock% makes it in time. He uses the most impressive spells in his arsenal. The peasants begin to scatter in panic:%SPEECH_ON%Another sorcerer, let's get out of here!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				local bravery_value = Math.rand(2, 4);
				_event.m.Warlock.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Warlock.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				_event.m.Warlock.getSkills().update();

				_event.m.Warlock.improveMood(1.0, "Was able to save other magician");
				if (_event.m.Warlock.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warlock.getMoodState()],
						text = _event.m.Warlock.getName() + this.Const.MoodStateEvent[_event.m.Warlock.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Did an excellent job.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_warlock_necromant.png[/img]{You send %warlock% to deal with this situation.\nThe necromancer is tied to a tree and a fire is lit under... %warlock% is late. When he approaches a group of people, the sorcerer is already on fire and shouts loudly.\n\nAll that %warlock% manages to do is to drink the remnants of the necromancer\'s life force and give him an easy death.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				local hitpoints_value = Math.rand(2, 4);
				_event.m.Warlock.getBaseProperties().Hitpoints += hitpoints_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/health.png",
					text = _event.m.Warlock.getName() + " drain [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + hitpoints_value + "[/color] Hitpoints"
				});
				_event.m.Warlock.getSkills().update();

				_event.m.Warlock.worsenMood(1.0, "Failed on assignment");
				if (_event.m.Warlock.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warlock.getMoodState()],
						text = _event.m.Warlock.getName() + this.Const.MoodStateEvent[_event.m.Warlock.getMoodState()]
					});
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
			ID = "C1",
			Text = "[img]gfx/ui/events/world/event_warlock_necromant.png[/img]{You decide to save the sorcerer:%SPEECH_ON%Leave him, or my squad will kill you one by one.%SPEECH_OFF%When the peasants hear this threat, they begin to scatter in different directions.%SPEECH_ON%Light will punish you!%SPEECH_OFF%shouts one of them. The liberated sorcerer thanks you and asks to accept some money.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					bro.improveMood(1.0, "Saved necromancer from being burned");

					if (bro.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}

				local item = this.Math.rand(400, 800);
				this.World.Assets.addMoney(item);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + item + "[/color] Crowns"
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
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (this.World.getTime().Days < 40)
		{
			return;
		}

		if (brothers.len() < 3)
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
		
		this.m.Score = candidates_warlock.len() * 7;
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

