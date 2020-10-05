/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.druid_fullmoon_event <- this.inherit("scripts/events/event", {
	m = {
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.druid_fullmoon";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_fullmoon.png[/img]{The moon shines especially brightly tonight. And the %druid% has been sitting for several hours in the same place near the campfire, as if absorbing this moonlight. Suddenly he screams and jumps up from his seat. A flash of light fills his eyes and the words of the prayer grow quieter}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());

				_event.m.Druid.getSkills().add(this.new("scripts/skills/traits/elunesgrace_trait"));

				this.List.push({
					id = 10,
					icon = "ui/traits/elunesgrace_trait.png",
					text = _event.m.Druid.getName() + " has now bless of Elune!"
				});

				this.Options.push({
					Text = "It's amazing, he was filled with the power of the Moon.",
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

		if (this.World.getTime().Days < 40)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_druid = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 6)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_druid")
			{
				if (!bro.getSkills().hasSkill("trait.elunesgrace_trait"))
				{
					candidates_druid.push(bro);
				}
			}
		}

		if (candidates_druid.len() == 0)
		{
			return;
		}

		this.m.Druid = candidates_druid[this.Math.rand(0, candidates_druid.len() - 1)];
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
	}

	function onClear()
	{
		this.m.Druid = null;
	}

});

