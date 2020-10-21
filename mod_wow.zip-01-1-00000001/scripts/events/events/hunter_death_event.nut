/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.hunter_death_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.hunter_death";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_death.png[/img]{You are already falling asleep when suddenly there is a terrible scream throughout the camp.%SPEECH_ON%He is dead!\n%hunter% is dead, quickly come all to me!%SPEECH_OFF%You jump and run to %other% but you also notice from afar that the hunter\'s pet is sitting calmly and watching the event with interest. You also notice that %hunter% lies comfortably, as if prepared in advance for the fact that he will lie like this for several hours.\n\n%other% continues to wail until everyone starts laughing. %hunter% laughs with everyone.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Other.worsenMood(2.0, "Became the victim of a cruel joke");
				_event.m.Hunter.improveMood(2.0, "Pretended to be dead for fun");

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

				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					if ((bro.getID() == _event.m.Hunter.getID()) || (bro.getID() == _event.m.Other.getID()))
					{
						continue;
					}

					bro.improveMood(1.0, "Good joke about the hunter");
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
					Text = "Great joke!",
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
			else if ((bro.getBackground().getID() == "background.raider_druid") || (bro.getSkills().hasSkill("trait.bright")))
			{
				continue;
			}
			else
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
			return;
		}

		this.m.Other = candidates_other[this.Math.rand(0, candidates_other.len() - 1)];
		this.m.Hunter = candidates_hunter[this.Math.rand(0, candidates_hunter.len() - 1)];
		
		this.m.Score = 12;
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

