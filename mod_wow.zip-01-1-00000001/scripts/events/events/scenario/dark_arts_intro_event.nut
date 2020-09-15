/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.dark_arts_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.dark_arts_intro_event";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_wow_dark_arts.png[/img]This warlock is the only one person in this band. Where are his friends? They say, warlock can drain health and stamina not only of his enemies... After body death even a soul cannot be safe if warlock is nearby. Look, seems he has strange armor, and his face is drowned in the shadow of the hood!\nAnyway, you need new people and new brothers to your squad!",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Damn you!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The " + this.World.Assets.getName();
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		_vars.push([
			"bro1",
			brothers[0].getName()
		]);
	}

	function onClear()
	{
	}

});

