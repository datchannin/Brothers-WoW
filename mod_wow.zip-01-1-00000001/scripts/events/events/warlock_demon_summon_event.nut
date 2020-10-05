this.warlock_demon_summon_event <- this.inherit("scripts/events/event", {
	m = {
		Warlock = null
	},
	function create()
	{
		this.m.ID = "event.warlock_demon_summon";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warlock_demon_summon.png[/img]{At the middle of night you wake up. There are strange sounds near, sdo you decide to proceed to their source.\nYou find %warlock% moving in a dachshund with some words. His movements are happening faster and faster, when suddenly a huge demon appears beside him!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "Keep looking.",
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
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_warlock_demon_summon.png[/img]{The demon begins to grow in size and %warlock% becomes crimson. He is seen struggling to keep the demon under control.\n\nIt\'s over in a few minutes. The demon obeys. And %warlock% is slowly drinking its power.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				local initiative_value = Math.rand(3, 5);
				local bravery_value = Math.rand(3, 5);
				_event.m.Warlock.getBaseProperties().Initiative += initiative_value;
				_event.m.Warlock.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Warlock.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				this.List.push({
					id = 5,
					icon = "ui/icons/initiative.png",
					text = _event.m.Warlock.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + initiative_value + "[/color] Initiative"
				});
				_event.m.Warlock.getSkills().update();

				_event.m.Warlock.improveMood(1.0, "Was able control the Demon!");
				if (_event.m.Warlock.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warlock.getMoodState()],
						text = _event.m.Warlock.getName() + this.Const.MoodStateEvent[_event.m.Warlock.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Demon is a powerful creature.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_warlock_demon_summon.png[/img]{The demon begins to grow in size and %warlock% becomes crimson. He is seen struggling to keep the demon under control.\n\nThe demon sharply throws %warlock% aside and uses some kind of spell. However, warlock withstands the blow and with great effort de-incarnates an enemy.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				local bravery_value = Math.rand(2, 3);
				_event.m.Warlock.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Warlock.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				_event.m.Warlock.getSkills().update();

				_event.m.Warlock.worsenMood(1.0, "Was not able to control the Demon!");
				if (_event.m.Warlock.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warlock.getMoodState()],
						text = _event.m.Warlock.getName() + this.Const.MoodStateEvent[_event.m.Warlock.getMoodState()]
					});
				}

				local r = this.Math.rand(1, 10);
				if (r > 2)
				{
					_event.m.Warlock.addLightInjury();
					this.List.push({
						id = 10,
						icon = "ui/icons/days_wounded.png",
						text = _event.m.Warlock.getName() + " suffers light wounds"
					});
				}
				else
				{
					local injury = _event.m.Warlock.addInjury(this.Const.Injury.Accident2);
					this.List.push({
						id = 10,
						icon = injury.getIcon(),
						text = _event.m.Warlock.getName() + " suffers " + injury.getNameOnly()
					});
				}

				this.Options.push({
					Text = "Demon is disgusting creature.",
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

