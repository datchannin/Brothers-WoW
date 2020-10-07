this.warrior_charge_event <- this.inherit("scripts/events/event", {
	m = {
		Warrior = null
	},
	function create()
	{
		this.m.ID = "event.warrior_charge";
		this.m.Title = "During the battle...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warrior_charge.png[/img]{You are fighting against a squad of mugger. %warrior% is in the thick of the battle and strikes at enemies.\nYou notice that one of the opponents is trying to escape, and possibly call for help. %warrior% sees it too. He makes a charge, manages to catch up with the fugitive and breaks his head with one precise blow!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());

				_event.m.Warrior.improveMood(2.0, "Charged to enemy and managed to kill him");
				if (_event.m.Warrior.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior.getMoodState()],
						text = _event.m.Warrior.getName() + this.Const.MoodStateEvent[_event.m.Warrior.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Сrush everyone, %warrior%!",
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
		local candidates_warrior = [];

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getLevel() < 7)
			{
				continue;
			}

			if ((bro.getBackground().getID() == "background.raider_warrior") && (bro.getSkills().hasSkill("perk.wow.warrior.charge")))
			{
				candidates_warrior.push(bro);
			}
		}

		if (candidates_warrior.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_warrior.len() - 1);
		this.m.Warrior = candidates_warrior[r];

		this.m.Score = candidates_warrior.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"warrior",
			this.m.Warrior.getName()
		]);
	}

	function onClear()
	{
		this.m.Warrior = null;
	}

});

