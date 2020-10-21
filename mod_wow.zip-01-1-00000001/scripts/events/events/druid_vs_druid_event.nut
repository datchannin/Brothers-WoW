/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.druid_vs_druid_event <- this.inherit("scripts/events/event", {
	m = {
		Druid1 = null,
		Druid2 = null
	},
	function create()
	{
		this.m.ID = "event.druid_vs_druid";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_vs_druid.png[/img]{%druid1% is sitting near the campfire and looks on %druid2%:%SPEECH_ON%You know, 'Moonfury' abilities are useless during the hard combat! Healers are doing women\'s work. Night Elves have natural Feral power!%SPEECH_OFF%%druid2% turns his head, and his eyes light up white:%SPEECH_ON%I can prove to you that no muscle can replace intelligence!%SPEECH_OFF%They seem to be ready to grab each other\'s throats.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid1.getImagePath());
				this.Characters.push(_event.m.Druid2.getImagePath());

				this.Options.push({
					Text = "I think \'Ferocity\' is that we need the most.",
					function getResult( _event )
					{
						return "B";
					}
				});
				this.Options.push({
					Text = "Elune\'s Bless and strength on Nature! Not simple muscles.",
					function getResult( _event )
					{
						return "C";
					}
				});
				this.Options.push({
					Text = "Shut up! You are brothers now, stop this dispute!",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 30)
						{
							return "D";
						}
						else
						{
							return "E";
						}
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/world/event_druid_vs_druid.png[/img]{You look at the %druid1% and grin:%SPEECH_ON%Physical strength is exactly what we need to quickly destroy enemies. Tear them apart, and there will be no losses on the our side.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid1.getImagePath());
				this.Characters.push(_event.m.Druid2.getImagePath());

				local melee_value = Math.rand(1, 3);
				local defense_value = Math.rand(1, 3);
				local bravery_value = Math.rand(2, 4);

				_event.m.Druid1.getBaseProperties().MeleeSkill += melee_value;
				_event.m.Druid1.getBaseProperties().MeleeDefense += defense_value;
				_event.m.Druid2.getBaseProperties().Bravery -= bravery_value;

				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Druid2.getName() + " loses [color=" + this.Const.UI.Color.NegativeEventValue + "]-" + bravery_value + "[/color] Resolve"
				});
				this.List.push({
					id = 5,
					icon = "ui/icons/melee_skill.png",
					text = _event.m.Druid1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + melee_value + "[/color] Melee Skill"
				});
				this.List.push({
					id = 5,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Druid1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + defense_value + "[/color] Melee Defense"
				});

				_event.m.Druid1.getSkills().update();
				_event.m.Druid2.getSkills().update();

				this.Options.push({
					Text = "%druid1% looks happy.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/world/event_druid_vs_druid.png[/img]{You smile at the %druid2%:%SPEECH_ON%First aid to the injured is what will help us in any battle. Heal and bless your brothers and victory will be ours.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid1.getImagePath());
				this.Characters.push(_event.m.Druid2.getImagePath());

				local stamina_value = Math.rand(2, 4);
				local bravery_value = Math.rand(2, 4);

				_event.m.Druid1.getBaseProperties().Bravery -= bravery_value;
				_event.m.Druid2.getBaseProperties().Stamina += stamina_value;
				_event.m.Druid2.getBaseProperties().Bravery += bravery_value;

				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Druid2.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				this.List.push({
					id = 5,
					icon = "ui/icons/fatigue.png",
					text = _event.m.Druid2.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina_value + "[/color] Stamina"
				});
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Druid1.getName() + " loses [color=" + this.Const.UI.Color.NegativeEventValue + "]-" + bravery_value + "[/color] Resolve"
				});

				_event.m.Druid1.getSkills().update();
				_event.m.Druid2.getSkills().update();

				this.Options.push({
					Text = "%druid1% looks insulted.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/world/event_druid_vs_druid.png[/img]{It seems to you that the druids agree with your arguments, but suddenly they rush at each other and start a brawl under the joyful exclamations and ridicule of their comrades}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid1.getImagePath());
				this.Characters.push(_event.m.Druid2.getImagePath());

				_event.m.Druid1.worsenMood(1.0, "Violated the order and started a fracas");
				_event.m.Druid2.worsenMood(1.0, "Was beaten by his friend");

				if (_event.m.Druid1.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid1.getMoodState()],
						text = _event.m.Druid1.getName() + this.Const.MoodStateEvent[_event.m.Druid1.getMoodState()]
					});
				}

				if (_event.m.Druid2.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid2.getMoodState()],
						text = _event.m.Druid2.getName() + this.Const.MoodStateEvent[_event.m.Druid2.getMoodState()]
					});
				}

				this.Options.push({
					Text = "This must not happen again!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
		
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/world/event_druid_vs_druid.png[/img]{The %druid1% frowns, but holds out his hand to his partner.%SPEECH_ON%I agree, we are brothers and we are fighting under one banner. Each of us is important to the squad.%SPEECH_OFF% %druid2% nods his head}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid1.getImagePath());
				this.Characters.push(_event.m.Druid2.getImagePath());

				_event.m.Druid1.improveMood(1.0, "Night Elves must stick together");
				_event.m.Druid2.improveMood(1.0, "Believed in the power of unity");

				if (_event.m.Druid1.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid1.getMoodState()],
						text = _event.m.Druid1.getName() + this.Const.MoodStateEvent[_event.m.Druid1.getMoodState()]
					});
				}
				if (_event.m.Druid2.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid2.getMoodState()],
						text = _event.m.Druid2.getName() + this.Const.MoodStateEvent[_event.m.Druid2.getMoodState()]
					});
				}

				this.Options.push({
					Text = "This really isn\'t problem more.",
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

		if (brothers.len() < 2)
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

		if (candidates_druid.len() < 2)
		{
			return;
		}

		this.m.Druid1 = candidates_druid[0];
		this.m.Druid2 = candidates_druid[this.Math.rand(1, candidates_druid.len() - 1)];
		this.m.Score = candidates_druid.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"druid1",
			this.m.Druid1.getName()
		]);
		_vars.push([
			"druid2",
			this.m.Druid2.getName()
		]);
	}

	function onClear()
	{
		this.m.Druid1 = null;
		this.m.Druid2 = null;
	}

});

