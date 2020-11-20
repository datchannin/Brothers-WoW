/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.hunter_constellation_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.hunter_constellation";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_constellation.png[/img]{This night is very clear, and the %hunter% invites %other% to count the stars in one bright constellation.%SPEECH_ON%Look at these stars! They said, a child\'s luck can be determined by the number of stars he is able to see.\n\nHow many stars do you see? More than me?%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				local hunter_is_eagle = _event.m.Hunter.getSkills().hasSkill("trait.eagle_eyes");
				local other_is_short = _event.m.Other.getSkills().hasSkill("trait.short_sighted");
				local other_is_eagle = _event.m.Other.getSkills().hasSkill("trait.eagle_eyes");

				if (hunter_is_eagle)
				{
					_event.m.Hunter.improveMood(2.0, "His eyes are better than the eyes of others");
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
					_event.m.Hunter.getSkills().add(this.new("scripts/skills/traits/eagle_eyes_trait"));

					this.List.push({
						id = 10,
						icon = "ui/traits/trait_icon_09.png",
						text = _event.m.Hunter.getName() + " trained his vision range!"
					});
				}

				if (other_is_eagle)
				{
					_event.m.Other.improveMood(1.0, "His vision is not the worst!");
					if (_event.m.Other.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
							text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
						});
					}
				}
				else if (other_is_short)
				{
					_event.m.Other.worsenMood(2.0, "Realized that he had poor eyesight");
					if (_event.m.Other.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
							text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
						});
					}
				}

				this.Options.push({
					Text = "I also don\'t see any stars!",
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

