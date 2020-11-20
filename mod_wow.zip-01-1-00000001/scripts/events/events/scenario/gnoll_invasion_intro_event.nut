/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.gnoll_invasion_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.gnoll_invasion_intro_event";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_wow_gnoll_invasion.png[/img]Tribes of gnolls are said to have sprung up in the north of these lands. Time by time they unite and every day their power grows. As soon as someone strong enough destroys their village, after a while a new one appears.\n\nYou have found strong enough companions in your squad. Many of them have met gnolls before, and know how to behave in battle against these opponents. \n\nStrong warriors, brave paladins, cunning rogues. Also spellcasters such as mages, warlock, and priests. Hunters and even druids are ready to follow you and engage in a long battle!",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Forward to the victory!",
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
	}

	function onClear()
	{
	}

});

