/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.hunter_vs_pet_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter = null
	},
	function create()
	{
		this.m.ID = "event.hunter_vs_pet";
		this.m.Title = "On the road...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_vs_pet.png[/img]{You notice that the hunter\'s pet begins to charge at its master. %hunter% squeezes the wolf\'s throat with his hands, and after a few minutes the wolf obeys.\nEveryone around is quietly discussing this incident}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				if (_event.m.Hunter.getCurrentProperties().Bravery > 50)
				{
					_event.m.Hunter.improveMood(2.0, "Pet is totally under control!");
					if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
							text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
						});
					}
				}
				else
				{
					local r = this.Math.rand(0,1);
					if (r == 0)
					{
						_event.m.Hunter.improveMood(1.0, "Pet is under control.");
						if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
								text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
							});
						}
					}
					else
					{
						_event.m.Hunter.worsenMood(1.0, "Almost lost his pet control");
						if (_event.m.Hunter.getMoodState() < this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
								text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
							});
						}
					}
				}

				this.Options.push({
					Text = "Keep moving.",
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

		if (!this.World.getTime().IsDaytime)
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

			if (bro.getSkills().hasSkill("perk.wow.hunter.beastmaster") && bro.getBackground().getID() == "background.raider_hunter")
			{
				candidates_hunter.push(bro);
			}
		}

		if (candidates_hunter.len() == 0)
		{
			return;
		}

		this.m.Hunter = candidates_hunter[this.Math.rand(0, candidates_hunter.len() - 1)];

		this.m.Score = candidates_hunter.len() * 10;
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

