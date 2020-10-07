this.paladin_ruined_chapel_event <- this.inherit("scripts/events/event", {
	m = {
		Paladin = null
	},
	function create()
	{
		this.m.ID = "event.paladin_ruined_chapel";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_paladin_ruined_chapel.png[/img]{You pass several ruined buildings. Suddenly %paladin% stops and stares in horror at one of them.%SPEECH_ON%What\'s the matter, %paladin%?%SPEECH_OFF%%SPEECH_ON%Look there. I see a chapel that was destroyed and left destroyed forever. It\'s just incredible. How can this happen?%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());

				_event.m.Paladin.worsenMood(2.0, "Saw the ruined chapel");
				if (_event.m.Paladin.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Paladin.getMoodState()],
						text = _event.m.Paladin.getName() + this.Const.MoodStateEvent[_event.m.Paladin.getMoodState()]
					});
				}

				this.Options.push({
					Text = "This world is imperfect!",
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
		local candidates_paladin = [];

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getBackground().getID() == "background.raider_paladin")
			{
				candidates_paladin.push(bro);
			}
		}

		if (candidates_paladin.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_paladin.len() - 1);
		this.m.Paladin = candidates_paladin[r];

		this.m.Score = candidates_paladin.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"paladin",
			this.m.Paladin.getName()
		]);
	}

	function onClear()
	{
		this.m.Paladin = null;
	}

});

