/datum/trade_station/fbv_hellcat
	name_pool = list(
		"FBV 'Hellcat'" = "\"Greetings. This is the Hellcat. We're currently escorting the Caduceus and we will be departing the system shortly alongside them. We are willing to part with our spare supplies while we're here.\""
	)
	icon_states = list("ihs_frigate", "ship")
	tree_x = 0.82
	tree_y = 0.9
	start_discovered = TRUE
	markup = COMMON_GOODS * 1.5
	uid = "guns_basic"
	offer_limit = 20
	base_income = 1600
	wealth = 0
	hidden_inv_threshold = 2000
	recommendation_threshold = 4000
	stations_recommended = list("fs_guns", "illegal2")
	forced_overmap_zone = list(
		list(15, 20),
		list(20, 25)
	)
	inventory = list(
		"Enforcer Equipment" = list(
			/obj/item/handcuffs,
			/obj/item/shield/riot,
			/obj/item/tool/baton,
			/obj/machinery/deployable/barrier
		),
		"Energy weapons" = list(
			/obj/item/gun/energy/gun/martin,
			/obj/item/gun/energy/laser,
			/obj/item/gun/energy/tesla_shotgun
		),
		"Projectile weapons" = list(
			/obj/item/gun/projectile/glock = good_data("Sky pistol", list(2, 6), 650),
			/obj/item/gun/projectile/giskard,
			/obj/item/gun/projectile/olivaw,
			/obj/item/gun/projectile/revolver/detective = good_data("Havelock revolver", list(2, 10), 300),
			/obj/item/gun/projectile/automatic/ak47/sa = good_data("Kalshnikov rifle", list(1, 3), 1000),
			/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless
		),
		"Flame Thrower" = list(
			/obj/item/gun/flamethrower,
			/obj/item/weldpack/canister/flamethrower
		),
		"Ammunition" = list(
			/obj/item/grenade/empgrenade/low_yield,
			/obj/item/grenade/smokebomb,
			/obj/item/grenade/chem_grenade/incendiary,
			/obj/item/grenade/flashbang,

			/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small,
			/obj/item/ammo_magazine/ammobox/rifle_75_small,
			/obj/item/ammo_magazine/ammobox/light_rifle_257_small,
			/obj/item/ammo_magazine/ammobox/shotgun,
			/obj/item/ammo_magazine/ammobox/kurtz_50,
			/obj/item/ammo_magazine/ammobox/magnum_40,
			/obj/item/ammo_magazine/ammobox/pistol_35
		),
		"Armor" = list(
			/obj/item/clothing/head/helmet/faceshield/riot,
			/obj/item/clothing/suit/armor/vest,
			/obj/item/clothing/suit/armor/vest/ironhammer,
			/obj/item/clothing/suit/storage/vest,
			/obj/item/clothing/head/armor/helmet/tanker,
			/obj/item/clothing/suit/armor/bulletproof,
			/obj/item/clothing/suit/armor/laserproof
		)
	)
	hidden_inventory = list(
		"Gun Resale Parts" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/gun_frames/resale = good_data("Blackmarket Gun Frame Disk", list(1, 1), 800),
			/obj/item/part/gun/grip/black,
			/obj/item/part/gun/barrel/srifle,
			/obj/item/part/gun/barrel/shotgun,
			/obj/item/part/gun/mechanism/shotgun,
			/obj/item/part/gun/mechanism/boltgun,
		),
		"Basic Gun Mods" = list(
			/obj/item/gun_upgrade/barrel/gauss,
			/obj/item/tool_upgrade/productivity/ergonomic_grip,
			/obj/item/tool_upgrade/refinement/laserguide,
			/obj/item/gun_upgrade/scope/killer,
			/obj/item/gun_upgrade/trigger/boom,
			/obj/item/gun_upgrade/mechanism/reverse_loader,
			/obj/item/gun_upgrade/trigger/dangerzone
		),
		"Xanorath Smugged Gear" = list(
			/obj/item/clothing/suit/space/void/merc/xanorath,
			/obj/item/melee/energy/sword/pirate,
			/obj/item/gun/projectile/gyropistol,
			/obj/item/ammo_magazine/a75,
			/obj/item/reagent_containers/hypospray/autoinjector/drugs,
			/obj/item/reagent_containers/syringe/drugs,
			/obj/item/reagent_containers/pill/zoom,
			/obj/item/reagent_containers/pill/happy,
			/obj/item/seeds/ambrosia/deus,
			/obj/item/seeds/ambrosia/vulgaris,
			/obj/item/seeds/ambrosia/deus = good_data("Ambrosia Deus", list(1, 3), 200),
			/obj/item/reagent_containers/food/snacks/grown/ambrosia/vulgaris = good_data("Ambrosia Vulgaris", list(1, 3), 400)

		)
	)
	offer_types = list(
		/obj/item/gun/energy/laser/railgun/pistol = offer_data("\"Myrmidon\" rail pistol or rifle", 5000, 2),
		/obj/item/tool/shovel/combat = offer_data("combat crovel", 500, 13),
		/obj/item/tool_upgrade/armor/melee = offer_data("melee armor plate", 500, 5),
		/obj/item/tool_upgrade/armor/bullet = offer_data("ballistic armor plate", 1200, 3),
		/obj/item/tool_upgrade/armor/bomb = offer_data("bomb proofing armor plate", 800, 3),
		/obj/item/tool_upgrade/armor/energy = offer_data("energy armor plate", 2000, 2),
		/obj/item/tool/baton/arcwelder = offer_data("arc welder", 1500, 2)
	)
