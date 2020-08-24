/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.fire_punch_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.fire_punch_intro_event";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_wow_fire_punch.png[/img]{This magician was trained in Dalaran for many years, until he finally became a master of fire spells. He used the fire power as the main argument, and once during a quarrel he burned his opponent alive. After the trial, he managed to escape, but all his friends began to consider him a criminal.\n\nNow this magician is ready for changes, he is even ready to abandon his favorite fire spells. Gather a squad of strong allies and help him find a second chance.}",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Start the adventure.",
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
		this.m.Title = "Fire Punch";
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});