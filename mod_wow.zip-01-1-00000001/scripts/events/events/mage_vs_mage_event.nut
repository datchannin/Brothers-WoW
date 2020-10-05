this.mage_vs_mage_event <- this.inherit("scripts/events/event", {
	m = {
		Mage1 = null,
		Mage2 = null
	},
	function create()
	{
		this.m.ID = "event.mage_vs_mage";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_mage_vs_mage.png[/img]{The two magicians got into a tough argument, each of them believes that he has made further progress on the path of studying magic.\nThey seem to be ready to grab each other\'s throats. And they are already starting a magic duel.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage1.getImagePath());
				this.Characters.push(_event.m.Mage2.getImagePath());

				this.Options.push({
					Text = "Look at the magician duel.",
					function getResult( _event )
					{
						return "B";
					}
				});

				this.Options.push({
					Text = "No one is allowed to challenge allies to a duel!",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 90)
						{
							return "C";
						}
						else
						{
							return "D";
						}
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/world/event_mage_vs_mage.png[/img]{Mages rush to each other. And for a moment, magic balls of pure flame and blue ice appear in the air.\n\nIn a minute it\'s all over. One of the magicians just vanished. Only his equipment remained on the ground as a reminder that until recently there were two masters of magic in the squad...}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage1.getImagePath());
				this.Characters.push(_event.m.Mage2.getImagePath());

				local r = this.Math.rand(1,2);

				if (r == 1)
				{
					local dead = _event.m.Mage1;
					local fallen = {
						Name = dead.getName(),
						Time = this.World.getTime().Days,
						TimeWithCompany = this.Math.max(1, dead.getDaysWithCompany()),
						Kills = dead.getLifetimeStats().Kills,
						Battles = dead.getLifetimeStats().Battles,
						KilledBy = "Diffused in a duel by " + _event.m.Mage2.getName(),
						Expendable = false
					};
					this.World.Statistics.addFallen(fallen);
					this.List.push({
						id = 13,
						icon = "ui/icons/kills.png",
						text = _event.m.Mage1.getName() + " has died"
					});
					_event.m.Mage1.getItems().transferToStash(this.World.Assets.getStash());
					this.World.getPlayerRoster().remove(_event.m.Mage1);

					_event.m.Mage2.addXP(4000, false);
					this.List.push({
						id = 7,
						icon = "ui/icons/xp_received.png",
						text = _event.m.Mage2.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4000[/color] Experience"
					});

					local initiative_value = 8;
					local stamina_value = 10;
					local hitpoints_value = 10;
					_event.m.Mage2.getBaseProperties().Initiative += initiative_value;
					_event.m.Mage2.getBaseProperties().Stamina += stamina_value;
					_event.m.Mage2.getBaseProperties().Hitpoints += hitpoints_value;
					this.List.push({
						id = 5,
						icon = "ui/icons/initiative.png",
						text = _event.m.Mage2.getName() + " loses [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + initiative_value + "[/color] Initiative"
					});
					this.List.push({
						id = 5,
						icon = "ui/icons/fatigue.png",
						text = _event.m.Mage2.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina_value + "[/color] Stamina"
					});
					this.List.push({
						id = 5,
						icon = "ui/icons/health.png",
						text = _event.m.Mage2.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + hitpoints_value + "[/color] Hitpoints"
					});
					_event.m.Mage2.getSkills().update();
				}
				else
				{
					local dead = _event.m.Mage2;
					local fallen = {
						Name = dead.getName(),
						Time = this.World.getTime().Days,
						TimeWithCompany = this.Math.max(1, dead.getDaysWithCompany()),
						Kills = dead.getLifetimeStats().Kills,
						Battles = dead.getLifetimeStats().Battles,
						KilledBy = "Diffused in a duel by " + _event.m.Mage2.getName(),
						Expendable = false
					};
					this.World.Statistics.addFallen(fallen);
					this.List.push({
						id = 13,
						icon = "ui/icons/kills.png",
						text = _event.m.Mage2.getName() + " has died"
					});
					_event.m.Mage2.getItems().transferToStash(this.World.Assets.getStash());
					this.World.getPlayerRoster().remove(_event.m.Mage2);

					_event.m.Mage1.addXP(4000, false);
					this.List.push({
						id = 7,
						icon = "ui/icons/xp_received.png",
						text = _event.m.Mage1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4000[/color] Experience"
					});

					local initiative_value = 8;
					local stamina_value = 10;
					local hitpoints_value = 10;
					_event.m.Mage1.getBaseProperties().Initiative += initiative_value;
					_event.m.Mage1.getBaseProperties().Stamina += stamina_value;
					_event.m.Mage1.getBaseProperties().Hitpoints += hitpoints_value;
					this.List.push({
						id = 5,
						icon = "ui/icons/initiative.png",
						text = _event.m.Mage1.getName() + " loses [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + initiative_value + "[/color] Initiative"
					});
					this.List.push({
						id = 5,
						icon = "ui/icons/fatigue.png",
						text = _event.m.Mage1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina_value + "[/color] Stamina"
					});
					this.List.push({
						id = 5,
						icon = "ui/icons/health.png",
						text = _event.m.Mage1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + hitpoints_value + "[/color] Hitpoints"
					});
					_event.m.Mage1.getSkills().update();
				}

				this.Options.push({
					Text = "Shit happens...",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/world/event_mage_vs_mage.png[/img]{%mage1% does not agree that he is forbidden to conduct a magic duel on pain of death.%SPEECH_ON%It\'s impossible. You have no right to give such an order!%SPEECH_OFF%However, an order is an order, and even mages in your squad are required to obey!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage1.getImagePath());
				this.Characters.push(_event.m.Mage2.getImagePath());

				_event.m.Mage1.worsenMood(2.0, "Not allowed to take part in the duel");
				_event.m.Mage2.worsenMood(2.0, "Not allowed to take part in the duel");

				if (_event.m.Mage1.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage1.getMoodState()],
						text = _event.m.Mage1.getName() + this.Const.MoodStateEvent[_event.m.Mage1.getMoodState()]
					});
				}

				if (_event.m.Mage2.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage2.getMoodState()],
						text = _event.m.Mage2.getName() + this.Const.MoodStateEvent[_event.m.Mage2.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Don\'t try to do this anymore.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/world/event_mage_vs_mage.png[/img]{%mage2% does not agree that he is forbidden to conduct a magic duel on pain of death.%SPEECH_ON%It\'s impossible. You have no right to give such an order!%SPEECH_OFF%However, an order is an order, and even mages in your squad are required to obey!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage1.getImagePath());
				this.Characters.push(_event.m.Mage2.getImagePath());

				_event.m.Mage1.worsenMood(3.0, "Not allowed to take part in the duel");
				_event.m.Mage2.worsenMood(3.0, "Not allowed to take part in the duel");

				if (_event.m.Mage1.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage1.getMoodState()],
						text = _event.m.Mage1.getName() + this.Const.MoodStateEvent[_event.m.Mage1.getMoodState()]
					});
				}

				if (_event.m.Mage2.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage2.getMoodState()],
						text = _event.m.Mage2.getName() + this.Const.MoodStateEvent[_event.m.Mage2.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Don\'t try to do this anymore.",
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

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		if (brothers.len() < 2)
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
				if (!bro.getSkills().hasSkill("trait.bright"))
				{
					candidates_mage.push(bro);
				}
			}
		}

		if (candidates_mage.len() < 2)
		{
			return;
		}

		this.m.Mage1 = candidates_mage[0];
		this.m.Mage2 = candidates_mage[this.Math.rand(1, candidates_mage.len() - 1)];
		this.m.Score = candidates_mage.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"mage1",
			this.m.Mage1.getName()
		]);
		_vars.push([
			"mage2",
			this.m.Mage2.getName()
		]);
	}

	function onClear()
	{
		this.m.Mage1 = null;
		this.m.Mage2 = null;
	}

});

