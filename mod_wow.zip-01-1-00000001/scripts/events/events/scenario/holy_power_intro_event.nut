/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.03, game_version = 1.4.0.35*/
this.holy_power_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.holy_power_intro_event";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_wow_holy_power.png[/img]This paladin has come a long way in training the forces of Light in the Knights of the Silver Hand.\n\nAfter the defeat in the First War, only such soldiers can bring goodness power with justice. Now for him the existence of any evil is unacceptable. He gathered around him a small squad of brothers, just as he believes in kindness.\n\nAlthough it seems that some soldiers only need a handful of gold coins to believe in anything.",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "In the Name of the Light.",
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
		this.m.Title = "Holy Power";
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		_vars.push([
			"bro1",
			brothers[0].getName()
		]);
		_vars.push([
			"bro2",
			brothers[1].getName()
		]);
	}

	function onClear()
	{
	}

});

