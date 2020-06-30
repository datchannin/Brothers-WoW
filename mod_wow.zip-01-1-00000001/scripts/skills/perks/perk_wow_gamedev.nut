this.perk_wow_gamedev <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.gamedev.gamedev";
		this.m.Name = this.Const.Wow_strings.PerkName.GameDev;
		this.m.Description = this.Const.Wow_strings.PerkDescription.GameDev;
		this.m.Icon = "ui/perks/perk_gamedev1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.fireball_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/fireball_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.fireball_skill");
	}
});