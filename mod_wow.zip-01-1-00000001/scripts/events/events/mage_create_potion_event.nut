this.mage_create_potion_event <- this.inherit("scripts/events/event", {
	m = {
		Mage = null
	},
	function create()
	{
		this.m.ID = "event.mage_create_potion";
		this.m.Title = "During camp...";
		this.m.Cooldown = 70.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_mage_create_potion.png[/img]{Today %mage% does not stay with friends for dinner. It looks like he has his own plans.\n\n%mage% takes out flasks, and begins to cook some kind of potion. After a few hours he comes up to you and holds out a bottle:%SPEECH_ON%Boss, I created a concentrated experience. Give it to whoever needs it more.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());
				local mage_is_bright = _event.m.Mage.getSkills().hasSkill("trait.bright");

				local item = this.new("scripts/items/misc/potion_of_knowledge_item");
				this.World.Assets.getStash().add(item);

				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});

				if (mage_is_bright)
				{
					item = this.new("scripts/items/misc/potion_of_knowledge_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}

				this.Options.push({
					Text = "You have a useful skill!",
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
		local candidates_mage = [];

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

			if (bro.getBackground().getID() == "background.raider_mage")
			{
				candidates_mage.push(bro);
			}
		}

		if (candidates_mage.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_mage.len() - 1);
		this.m.Mage = candidates_mage[r];

		this.m.Score = candidates_mage.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"mage",
			this.m.Mage.getName()
		]);
	}

	function onClear()
	{
		this.m.Mage = null;
	}

});

