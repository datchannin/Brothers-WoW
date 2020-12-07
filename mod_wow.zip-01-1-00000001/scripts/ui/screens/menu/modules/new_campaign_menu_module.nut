this.new_campaign_menu_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnStartButtonPressedListener = null,
		OnCancelButtonPressedListener = null
	},
	function setOnStartButtonPressedListener( _listener )
	{
		this.m.OnStartButtonPressedListener = _listener;
	}

	function setOnCancelButtonPressedListener( _listener )
	{
		this.m.OnCancelButtonPressedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnStartButtonPressedListener = null;
		this.m.OnCancelButtonPressedListener = null;
	}

	function create()
	{
		this.m.ID = "NewCampaignModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function show()
	{
		if (!this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("show", null);
		}
	}

	function hide()
	{
		if (this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function setBanners( _banners )
	{
		this.m.JSHandle.asyncCall("setBanners", _banners);
	}

	function setStartingScenarios( _scenarios )
	{
		this.m.JSHandle.asyncCall("setStartingScenarios", _scenarios);
	}

	function setCrusadeCampaignAvailable( _available )
	{
		this.m.JSHandle.asyncCall("setCrusadeCampaignVisible", _available);
	}

	function onStartButtonPressed( _settings )
	{
		local settings = {
			Name = _settings[0],
			Banner = _settings[1],
			Difficulty = _settings[2],
			EconomicDifficulty = _settings[3],
			BudgetDifficulty = _settings[4],
			Ironman = _settings[5],
			ExplorationMode = _settings[6],
			GreaterEvil = _settings[7],
			PermanentDestruction = _settings[8],
			Seed = _settings[9],
			StartingScenario = _settings[10],
			WoWClassic = _settings[11]
		};

		if (this.m.OnStartButtonPressedListener != null)
		{
			this.m.OnStartButtonPressedListener(settings);
		}
	}

	function onCancelButtonPressed()
	{
		if (this.m.OnCancelButtonPressedListener != null)
		{
			this.m.OnCancelButtonPressedListener();
		}
	}

});

