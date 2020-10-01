this.hunter_trap_mastery_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter = null
	},
	function create()
	{
		this.m.ID = "event.hunter_trap_mastery";
		this.m.Title = "During camp...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_trap_mastery.png[/img]{Another night in the dark forest. You can hear the wolves howling around. %hunter% turns to you:%SPEECH_ON%I also hear these critters, I think I could catch a few. I can do something else, not only shoot a bow, but also know how traps should be using.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				this.Options.push({
					Text = "Set a trap.",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 30)
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
					Text = "Go to sleep, tomorrow we will have a hard day.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_hunter_trap_mastery.png[/img]{%hunter% goes into forest. He comes back half an hour later and goes to bed.\nAnd in the morning he goes to inspect the trap.\n\nHe returns with empty hands and with wounds on his body.%SPEECH_ON%Bastard beast managed to break out.%SPEECH_OFF%...%hunter% begins to bandage his wounds}",
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

				_event.m.Hunter.worsenMood(1.0, "Was bitten by wild wolf");
				if (_event.m.Hunter.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Bad luck.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_hunter_trap_mastery.png[/img]{%hunter% goes into forest. He comes back half an hour later and goes to bed.\nAnd in the morning he goes to inspect the trap.\n\nWhen he arrives at the camp, you see several fresh thicks in his hands.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				local r = Math.rand(1, 2);

				local item = this.new("scripts/items/misc/werewolf_pelt_item");
				this.World.Assets.getStash().add(item);
				item = this.new("scripts/items/misc/werewolf_pelt_item");
				this.World.Assets.getStash().add(item);

				if (r == 1)
				{
					item = this.new("scripts/items/misc/werewolf_pelt_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}

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
					Text = "Excellent loot.",
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
		
		if (this.World.getTime().Days < 20)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local currentTile = this.World.State.getPlayer().getTile();

		if (currentTile.Type != this.Const.World.TerrainType.Forest && currentTile.Type != this.Const.World.TerrainType.LeaveForest)
		{
			return;
		}

		local myTile = this.World.State.getPlayer().getTile();

		foreach( s in this.World.EntityManager.getSettlements() )
		{
			if (s.getTile().getDistanceTo(myTile) <= 6)
			{
				return;
			}
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
				candidates_hunter.push(bro);
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

