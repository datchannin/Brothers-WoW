/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.03, game_version = 1.4.0.41*/
this.shining_of_the_moon_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.shining_of_the_moon_intro_event";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_wow_shining_of_the_moon.png[/img]Night Elf - Druid came to these lands and start to hire new people to his squade.\n\nDruids slept in their caves for 10,000 years. But in these times we must all fight!\n\n Now Night Elves agreed to help humans in their fight against coming evil. Will you be able to lead your squad through the battles against insidious enemies?",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "In the name of Eluna.",
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
		this.m.Title = "Shining of the Moon";
	}

	function onClear()
	{
	}

});

