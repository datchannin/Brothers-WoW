/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.druid_emerald_dream_event <- this.inherit("scripts/events/event", {
	m = {
		Druid = null,
		Student = null,
	},
	function create()
	{
		this.m.ID = "event.druid_emerald_dream";
		this.m.Title = "During camp...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_emerald_dream.png[/img]{%druid% speaks softly to the %student% near the fire.%SPEECH_ON%You know a lot, mortal. But there is even more that you are not aware of. The Emerald Dream - a world in which the druids have been for 10,000 years. Only our bodies remain here. Want me to show you the dream world, Emerald Dream?%SPEECH_OFF%%student% looks back at you:%SPEECH_ON%Will you let me fall asleep, boss?%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());
				this.Characters.push(_event.m.Student.getImagePath());

				this.Options.push({
					Text = "New knowledge will be useful! Start immediately.",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 20)
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
					Text = "Do it but be careful! Emerald dream can tighten you.",
					function getResult( _event )
					{
						return "C";
					}
				});
				this.Options.push({
					Text = "Never. You are not druid. Stop discussing it.",
					function getResult( _event )
					{
						return "D";
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_druid_emerald_dream.png[/img]{%student% falls into a trance, and the %druid% takes his hand... An hour later, the %student%\'s eyes begin to glow with a bright light and he wakes up. Horror is reflected in his eyes, and his hands tremble slightly:%SPEECH_ON%It was strange, the world will never be the same again%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());
				this.Characters.push(_event.m.Student.getImagePath());

				if (!Student.getSkills().hasSkill("trait.superstitious"))
				{
					_event.m.Student.getSkills().add(this.new("scripts/skills/traits/superstitious_trait"));

					this.List.push({
						id = 10,
						icon = "ui/traits/trait_icon_26.png",
						text = _event.m.Student.getName() + " now believe in anything."
					});
				}
				else
				{
					local bravery_value = Math.rand(1, 3);
					_event.m.Student.getBaseProperties().Bravery -= bravery_value;
					this.List.push({
						id = 5,
						icon = "ui/icons/bravery.png",
						text = _event.m.Student.getName() + " loses [color=" + this.Const.UI.Color.NegativeEventValue + "]-" + bravery_value + "[/color] Resolve"
					});
				}

				this.Options.push({
					Text = "You turn away and fall asleep.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_druid_emerald_dream.png[/img]{%student% falls into a trance, and the %druid% takes his hand... An hour later, the %student%\'s eyes begin to glow with a bright light and he wakes up:%SPEECH_ON%It was amazing, the world will never be the same again%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());
				this.Characters.push(_event.m.Student.getImagePath());

				_event.m.Student.getSkills().add(this.new("scripts/skills/traits/bright_trait"));

				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_11.png",
					text = _event.m.Student.getName() + " learned how to gain knowledge from new sources."
				});

				this.Options.push({
					Text = "It couldn't have been better!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/world/event_druid_emerald_dream.png[/img]{%student% falls into a trance, and the %druid% takes his hand... An hour later, the %student%\'s eyes begin to glow with a bright light and he wakes up:%SPEECH_ON%It was interesting, %druid% did not leave me and I did not have time to see even half!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());
				this.Characters.push(_event.m.Student.getImagePath());

				local bravery_value = Math.rand(2, 4);
				_event.m.Student.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Student.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});

				_event.m.Student.improveMood(1.0, "Learned something new");
				if (_event.m.Student.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Student.getMoodState()],
						text = _event.m.Student.getName() + this.Const.MoodStateEvent[_event.m.Student.getMoodState()]
					});
				}

				_event.m.Student.getSkills().update();
				
				this.Options.push({
					Text = "Not bad.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/world/event_druid_emerald_dream.png[/img]{%druid% sighs in disappointment and you see %student% smiling with visible relief.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());
				this.Characters.push(_event.m.Student.getImagePath());

				this.Options.push({
					Text = "Waste of time!",
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
		local candidates_druid = [];
		local candidates_magician = [];

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		if (this.World.getTime().Days < 30)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_mage" || bro.getBackground().getID() == "background.raider_priest" || bro.getBackground().getID() == "background.raider_warlock")
			{
				if (!bro.getSkills().hasSkill("trait.bright"))
				{
					candidates_magician.push(bro);
				}
			}
			else
			{
				if ((bro.getBackground().getID() == "background.raider_druid") && (bro.getLevel() > 6))
				{
					candidates_druid.push(bro);
				}
			}
		}

		if (candidates_druid.len() == 0)
		{
			return;
		}

		if (candidates_magician.len() == 0)
		{
			return;
		}

		this.m.Druid = candidates_druid[this.Math.rand(0, candidates_druid.len() - 1)];
		this.m.Student = candidates_magician[this.Math.rand(0, candidates_magician.len() - 1)];
		this.m.Score = candidates_druid.len() * 10;
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
		_vars.push([
			"student",
			this.m.Student.getName()
		]);
	}

	function onClear()
	{
		this.m.Druid = null;
		this.m.Student = null;
	}

});

