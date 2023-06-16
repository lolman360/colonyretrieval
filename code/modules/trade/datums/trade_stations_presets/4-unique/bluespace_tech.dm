/datum/trade_station/bluespace_technical
	uid = "bluespace"
	tree_x = 0.26
	tree_y = 0.4
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	recommendations_needed = 1
	name_pool = list("B-42-Alpha" = "Unknown signature, bluespace traces interfere with sensors. Unable to triangulate object.")
	inventory = list(
		"#$285@$532#$@" = list(
			/obj/item/circuitboard/teleporter,
			/obj/item/hand_tele,
			/obj/item/tele_spear,
			/obj/item/seeds/tomato/bluespace,
			/obj/item/reagent_containers/glass/beaker/bluespace,
			/obj/item/circuitboard/bssilk_hub,
			/obj/item/circuitboard/bssilk_cons,
			/obj/item/clothing/accessory/bs_silk,
			/obj/item/rig_module/teleporter
		)
	)
	hidden_inventory = list(
		"25$$5325@$25@$5325323" = list(
			/obj/item/oddity/broken_necklace = custom_good_amount_range(list(-5,1)),
			/obj/item/implanter/compressed,
			/obj/item/tool_upgrade/augment/randomizer
		)
	)
	offer_types = list(
		/obj/item/bluespace_crystal = offer_data("bluespace crystal", 2000, 10),
		/obj/item/device/mmi/digital/posibrain = offer_data("positronic brain", 750, 3),
		/obj/item/reagent_containers/food/snacks/csandwich = offer_data("sandwich", 400, 1)
	)