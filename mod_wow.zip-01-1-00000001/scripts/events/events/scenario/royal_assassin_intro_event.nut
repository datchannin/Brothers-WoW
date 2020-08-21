/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.royal_assassin_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.royal_assassin_intro_event";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_wow_royal_assassin.png[/img]{For many years you worked for the king as a hired rogue, until you finally got the position of royal assassin. Since then, you have been the bodyguard and diplomat of the Stormwind. However, you did a completely different tasks for the king. Your skill in poisons helped you solve all issues, the same way as mastery of handling a dagger. Stormwind Fortress fell now, you have no one else to serve. You decided to found a new party, with which you can earn enough gold for a comfortable old age.\n\nHire people and get to work. Even the most brutal opponents can die. You know what to do...}",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Hide in the shadow!",
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
		this.m.Title = "The Royal Assassin";
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});