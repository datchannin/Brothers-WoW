/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_fade <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.fade";
		this.m.Name = this.Const.Wow_strings.PerkName.Fade;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Fade;
		this.m.Icon = "ui/perks/perk_priest_fade.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.fade_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/priest_fade_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.fade_skill");
	}
});