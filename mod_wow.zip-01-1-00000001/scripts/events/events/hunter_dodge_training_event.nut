this.hunter_dodge_training_event <- this.inherit("scripts/events/event", {
	m = {
		Hunter = null
	},
	function create()
	{
		this.m.ID = "event.hunter_dodge_training";
		this.m.Title = "On the road...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_hunter_dodge_training.png[/img]{On the way, %hunter% starts to complain that he seems to be losing his skills.%SPEECH_ON%So what's the deal? Come on, start training right here%SPEECH_OFF% one of the brothers answers him.%SPEECH_ON%Okay, I'll do that. Boss, do we have some time left?%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				this.Options.push({
					Text = "Let\'s do it. Seems you are not so nimble.",
					function getResult( _event )
					{
						return "B";
					}
				});
				this.Options.push({
					Text = "Keep moving.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/world/event_hunter_dodge_training.png[/img]{%hunter% takes off his armor, takes a sword in each hand and begins a warm-up.\n\nDo you think whether it is worth intervening and complicating it a little, or just standing and watching?}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				this.Options.push({
					Text = "Try to attack.",
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
					Text = "Stand and watch the exercises.",
					function getResult( _event )
					{
						return "C";
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_hunter_dodge_training.png[/img]{You stand and watch %hunter% move faster and faster that whirls like a whirlwind.\nYou want to make it harder, so you start throwing stones at him. One of the stones hits the target and the %hunter% falls. The workout stops but %hunter% shows no pain!}",
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

				local bravery_value = Math.rand(1, 3);
				_event.m.Hunter.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Hunter.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				_event.m.Hunter.getSkills().update();

				this.Options.push({
					Text = "You are not so good!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_hunter_dodge_training.png[/img]{You stand and watch %hunter% move faster and faster that whirls like a whirlwind.\nYou want to make it harder, so you start throwing stones at him. However, no stone can reach the goal. %hunter% dodges too well.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				_event.m.Hunter.improveMood(2.0, "Hard trained dodge skill");
				if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				local defense_melee_value = Math.rand(2, 4);
				_event.m.Hunter.getBaseProperties().MeleeDefense += defense_melee_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Hunter.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + defense_melee_value + "[/color] Melee Defense"
				});
				local defense_ranged_value = Math.rand(2, 4);
				_event.m.Hunter.getBaseProperties().RangedDefense += defense_ranged_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.Hunter.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + defense_ranged_value + "[/color] Ranged Defense"
				});
				_event.m.Hunter.getSkills().update();

				this.Options.push({
					Text = "Amaizing work!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/world/event_hunter_dodge_training.png[/img]{You stand and watch %hunter% move faster and faster that whirls like a whirlwind.\nThis training would be useful even for you!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Hunter.getImagePath());

				_event.m.Hunter.improveMood(1.0, "Trained dodge skill");
				if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				local defense_value = Math.rand(1, 3);
				_event.m.Hunter.getBaseProperties().MeleeDefense += defense_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Hunter.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + defense_value + "[/color] Melee Defense"
				});
				_event.m.Hunter.getSkills().update();

				this.Options.push({
					Text = "Good work.",
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

