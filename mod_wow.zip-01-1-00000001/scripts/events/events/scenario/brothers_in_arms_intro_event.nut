/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.brothers_in_arms_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.brothers_in_arms_intro_event";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_wow_battle_in_brothers.png[/img]Not so long ago the war was end. The Dark Portal let monsters into our world. They brought demonic magic and the undead began to rise from the graves. Stormwind Fortress fell under the onslaught of the orcs. King Llane is killed, and the Guardian of Tirisfal is gone ... or perished.\n\nThese brave warriors sailed from overseas. Many enemies fell from their sword. While %bro2% chopped enemies left and right, %bro1% became a protection master, reflecting the blows again and again. Now they have joined your brotherhood and you are their commander now, the leader of the %companyname%.\n\nAnyone will be happy to stand under the banners, side by side with glorified warriors.",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "For the Alliance!",
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
		_vars.push([
			"bro2",
			brothers[1].getName()
		]);
	}

	function onClear()
	{
	}

});

