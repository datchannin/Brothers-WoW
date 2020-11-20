/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.druid_remove_ailing_event <- this.inherit("scripts/events/event", {
	m = {
		Ailing = null,
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.druid_remove_ailing";
		this.m.Title = "During camp...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_remove_ailing.png[/img]{%ailing% is sitting near the campfire, the bright light of the moon falls on the %druid% who is whispering some words in a chants.%SPEECH_ON%For the first time in a long time I actually feel quite alright. Thanks, %druid%!%SPEECH_OFF%It seems Night Elves are under Elune\'s Bless.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Your strength is the strength of Nature!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Ailing.getImagePath());
				this.Characters.push(_event.m.Druid.getImagePath());
				_event.m.Ailing.improveMood(1.5, "Feels the best he did in a long time");

				if (_event.m.Ailing.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Ailing.getMoodState()],
						text = _event.m.Ailing.getName() + this.Const.MoodStateEvent[_event.m.Ailing.getMoodState()]
					});
				}

				_event.m.Ailing.getSkills().removeByID("trait.ailing");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_59.png",
					text = _event.m.Ailing.getName() + " is no longer ailing"
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

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_ailing = [];
		local candidates_druid = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getSkills().hasSkill("trait.ailing"))
			{
				candidates_ailing.push(bro);
			}
			else if (bro.getBackground().getID() == "background.raider_druid")
			{
				candidates_druid.push(bro);
			}
		}

		if (candidates_ailing.len() == 0 || candidates_druid.len() == 0)
		{
			return;
		}

		this.m.Ailing = candidates_ailing[this.Math.rand(0, candidates_ailing.len() - 1)];
		this.m.Druid = candidates_druid[this.Math.rand(0, candidates_druid.len() - 1)];
		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"ailing",
			this.m.Ailing.getName()
		]);
		_vars.push([
			"druid",
			this.m.Druid.getName()
		]);
	}

	function onClear()
	{
		this.m.Ailing = null;
		this.m.Druid = null;
	}

});

