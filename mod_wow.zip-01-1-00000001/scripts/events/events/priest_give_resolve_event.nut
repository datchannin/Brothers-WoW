this.priest_give_resolve_event <- this.inherit("scripts/events/event", {
	m = {
		Priest = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.priest_give_resolve";
		this.m.Title = "During camp...";
		this.m.Cooldown = 180.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_priest_give_resolve.png[/img]{During camp you hear %priest% talking to %other%:%SPEECH_ON%I know you are weak in spirit, brother.\nI was the same as you, but the Power of the Light illuminated me, and now it is always inside me!\nAccept the Light, and it will stay with you in any battle.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				local bravery_value = Math.rand(2, 4);
				_event.m.Other.getBaseProperties().Bravery += bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Other.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery_value + "[/color] Resolve"
				});
				_event.m.Other.getSkills().update();

				this.Options.push({
					Text = "Time to sleep",
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
		local candidates_priest = [];
		local candidates_res = [];

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_priest")
			{
				candidates_priest.push(bro);
			}
			else if (bro.getBaseProperties().Bravery < 35)
			{
				candidates_res.push(bro);
			}
		}

		if (candidates_priest.len() == 0)
		{
			return;
		}
		if (candidates_res.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_priest.len() - 1);
		this.m.Priest = candidates_priest[r];
		r = this.Math.rand(0, candidates_res.len() - 1);
		this.m.Other = candidates_res[r];

		this.m.Score = candidates_priest.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"priest",
			this.m.Priest.getName()
		]);
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Priest = null;
		this.m.Other = null;
	}

});

