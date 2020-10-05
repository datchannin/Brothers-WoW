/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.hunter_killer_instinct_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter = null
	},
	function create()
	{
		this.m.ID = "event.hunter_killer_instinct";
		this.m.Title = "During camp...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_killer_instinct.png[/img]{On this cold night you and your brothers are going to have a drink near the campfire you have already taken out flasks and a snack, as you notice that there is a wanderer near:%SPEECH_ON%Good evening, travelers. It\'s cold tonight, let me join you around the fire.\nI have both a drink and a snack that I would share.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				this.Options.push({
					Text = "Join us, we\'re just drinking wine.",
					function getResult( _event )
					{
						return "B";
					}
				});
				this.Options.push({
					Text = "Get out of here, we have no supplies for strangers.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/world/event_hunter_killer_instinct.png[/img]{The wanderer joins to your company and you all start drinking together, telling different stories one by one.\nThe wanderer notices that  %hunter% does not drink:%SPEECH_ON%Hey, would you like to have a little drink with us?%SPEECH_OFF%Hunter frowns:%SPEECH_ON%I don\'t drink, my pet does not tolerate the smell of alcohol!%SPEECH_OFF%Everyone around starts laughing...}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				this.Options.push({
					Text = "Make the hunter to drink.",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 10)
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
					Text = "If you don't want it, don't drink.",
					function getResult( _event )
					{
						return "C";
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_hunter_killer_instinct.png[/img]{You order %hunter% to drink. And after a few hours he was completely drunk.\nSuddenly he starts hassle with the stranger and grabs the knife. It seems that his killer instinct has awakened.\n\nIt\'s all over in a couple of minutes. The wanderer\'s body remains lying near the fire.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				local injury = _event.m.Hunter.addInjury(this.Const.Injury.Accident2);
				this.List.push({
					id = 10,
					icon = injury.getIcon(),
					text = _event.m.Hunter.getName() + " suffers " + injury.getNameOnly()
				});

				_event.m.Hunter.worsenMood(3.0, "Kill the stranger");
				if (_event.m.Hunter.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				local money = this.Math.rand(1500, 2000);
				this.World.Assets.addMoney(money);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + money + "[/color] Crowns"
				});

				this.Options.push({
					Text = "Where does the hobo get so much money?",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_hunter_killer_instinct.png[/img]{You order %hunter% to drink. And after a few hours he was completely drunk.\nSuddenly he starts hassle with the stranger and grabs the knife. It seems that his killer instinct has awakened.\n\nIt\'s all over in a couple of minutes. %hunter% was completely drunk and fell like a sack. The beaten stranger escapes.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				_event.m.Hunter.improveMood(1.5, "Learned how to drink");

				if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				local hunter_is_drunk = _event.m.Hunter.getSkills().hasSkill("trait.drunkard");
				if (!hunter_is_drunk)
				{
					_event.m.Hunter.getSkills().add(this.new("scripts/skills/traits/drunkard_trait"));

					this.List.push({
						id = 10,
						icon = "ui/traits/trait_icon_29.png",
						text = _event.m.Hunter.getName() + " is drunkard now!"
					});
				}
				
				this.Options.push({
					Text = "It\'s time to go.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/world/event_hunter_killer_instinct.png[/img]{When everyone hears that %hunter% cannot drink even a little wine, they begin to laugh deafeningly. %hunter% looks ashamed}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				_event.m.Hunter.worsenMood(2.0, "Disgraced at the feast");
				if (_event.m.Hunter.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					if (bro.getID() == _event.m.Hunter.getID())
					{
						continue;
					}

					bro.improveMood(1.0, "The hunter is not able to drink wine");
					if (bro.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}

				this.Options.push({
					Text = "Young punk.",
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

		if (this.World.getTime().IsDaytime)
		{
			return;
		}
		
		if (this.World.getTime().Days < 10)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_hunter = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 6)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_hunter")
			{
				if (!bro.getSkills().hasSkill("trait.drunkard"))
				{
					candidates_hunter.push(bro);
				}
				else
				{
					continue;
				}
			}
		}

		if (candidates_hunter.len() == 0)
		{
			return;
		}

		this.m.Hunter = candidates_hunter[this.Math.rand(0, candidates_hunter.len() - 1)];
		
		this.m.Score = 10;
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
	}

	function onClear()
	{
		this.m.Hunter = null;
	}

});

