/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.druid_soothe_animals_event <- this.inherit("scripts/events/event", {
	m = {
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.druid_soothe_animals";
		this.m.Title = "During camp...";
		this.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_soothe_animals.png[/img]{You can't sleep and you go for a short walk. Suddenly in the clearing you notice how %druid% is meditating. He sits in a place and sways from side to side. Animals gathered around him, they peacefully stand next to each other.\n Can you take advantage of this situation?}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());

				this.Options.push({
					Text = "Try to get closer and kill the animals.",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 50)
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
					Text = "Doing nothing.",
					function getResult( _event )
					{
						return "C";
					}
				});
			}
		});
		
		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_druid_soothe_animals.png[/img]{You quietly approach the deer and deliver a quick blow to its neck. The deer has time to jump back and the animals scatter. %druid% abruptly leaves the meditation state. He frowns.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());

				_event.m.Druid.worsenMood(1.0, "Meditation was interrupted");

				if (_event.m.Druid.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid.getMoodState()],
						text = _event.m.Druid.getName() + this.Const.MoodStateEvent[_event.m.Druid.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Sorry about that...",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
		
		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_druid_soothe_animals.png[/img]{You quietly approach the deer and deliver a quick blow to its neck. The deer falls dead, blood gushing from the severed body. %druid% leaves the state of meditation and looks at you with horror:%SPEECH_ON%Why did you do that? Don\'t you know that in this state animals are like children?%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());

				_event.m.Druid.worsenMood(2.0, "Defenseless animals were killed");

				if (_event.m.Druid.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid.getMoodState()],
						text = _event.m.Druid.getName() + this.Const.MoodStateEvent[_event.m.Druid.getMoodState()]
					});
				}

				local item = this.new("scripts/items/supplies/strange_meat_item");
				this.World.Assets.getStash().add(item);
				item = this.new("scripts/items/supplies/strange_meat_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});

				this.Options.push({
					Text = "I did what I have to...",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
		
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/world/event_druid_soothe_animals.png[/img]{%druid% finishes his meditating and slowly opens eyes. Animals move away carefully.%SPEECH_ON%I love peace and tranquility%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());

				_event.m.Druid.improveMood(2.0, "Just finished meditation");
				if (_event.m.Druid.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid.getMoodState()],
						text = _event.m.Druid.getName() + this.Const.MoodStateEvent[_event.m.Druid.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Уou are silent.",
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

		if (brothers.len() < 1)
		{
			return;
		}

		local candidates_druid = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_druid")
			{
				candidates_druid.push(bro);
			}
		}

		if (candidates_druid.len() == 0)
		{
			return;
		}

		this.m.Druid = candidates_druid[this.Math.rand(0, candidates_druid.len() - 1)];
		this.m.Score = 10 * candidates_druid.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"druid",
			this.m.Druid.getName()
		]);
	}

	function onClear()
	{
		this.m.Druid = null;
	}

});

