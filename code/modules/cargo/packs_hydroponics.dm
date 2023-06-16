//----------------------------------------------
//-----------------HYDROPONICS------------------
//----------------------------------------------

/datum/supply_pack/monkey
	name = "Monkey Crate"
	contains = list (/obj/item/storage/box/monkeycubes)
	cost = 120
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "monkey crate"
	group = "Hydroponics"

/datum/supply_pack/hydroponics // -- Skie
	name = "Hydroponics Supply Crate"
	contains = list(/obj/item/reagent_containers/spray/plantbgone,
					/obj/item/reagent_containers/spray/plantbgone,
					/obj/item/reagent_containers/glass/bottle/ammonia,
					/obj/item/reagent_containers/glass/bottle/ammonia,
					/obj/item/tool/hatchet,
					/obj/item/tool/minihoe,
					/obj/item/device/scanner/plant,
					/obj/item/clothing/gloves/botanic_leather,
					/obj/item/clothing/suit/rank/botanist) // Updated with new things
	cost = 120
	containertype = /obj/structure/closet/crate/hydroponics
	crate_name = "hydroponics supply crate"
	group = "Hydroponics"

//farm animals - useless and annoying, but potentially a good source of food

/datum/supply_pack/bees
	name = "Bee crate"
	contains = list(/obj/item/bee_pack,
					/obj/item/beehive_assembly,
					/obj/item/honey_frame,
					/obj/item/honey_frame,
					/obj/item/honey_frame,
					/obj/item/bee_smoker,
					/obj/item/circuitboard/honey_extractor)
	cost = 200
	containertype = /obj/structure/closet/crate
	crate_name = "Bee crate"
	group = "Hydroponics"

/datum/supply_pack/cow
	name = "Cow Crate"
	cost = 240
	containertype = /obj/structure/largecrate/animal/cow
	crate_name = "cow crate"
	group = "Hydroponics"

/datum/supply_pack/pig
	name = "Pig Crate"
	cost = 200
	containertype = /obj/structure/largecrate/animal/pig
	crate_name = "pig crate"
	group = "Hydroponics"

/datum/supply_pack/bear
	name = "Bear Crate"
	cost = 500
	containertype = /obj/structure/largecrate/animal/bear
	crate_name = "bear crate"
	group = "Hydroponics"

/datum/supply_pack/bear
	name = "Polar Bear Crate"
	cost = 500
	containertype = /obj/structure/largecrate/animal/p_bear
	crate_name = "polar bear crate"
	group = "Hydroponics"

/datum/supply_pack/goat
	name = "Goat Crate"
	cost = 200
	containertype = /obj/structure/largecrate/animal/goat
	crate_name = "Goat Crate"
	group = "Hydroponics"

/datum/supply_pack/chicken
	name = "Chicken Crate"
	cost = 120
	containertype = /obj/structure/largecrate/animal/chick
	crate_name = "Chicken Crate"
	group = "Hydroponics"

/datum/supply_pack/corgi
	name = "Corgi Crate"
	cost = 320
	containertype = /obj/structure/largecrate/animal/corgi
	crate_name = "corgi crate"
	group = "Hydroponics"

/datum/supply_pack/cat
	name = "Cat Crate"
	cost = 240
	containertype = /obj/structure/largecrate/animal/cat
	crate_name = "cat crate"
	group = "Hydroponics"

/datum/supply_pack/seeds
	name = "Seeds Crate"
	contains = list(/obj/item/seeds/chili,
					/obj/item/seeds/berry,
					/obj/item/seeds/corn,
					/obj/item/seeds/eggplant,
					/obj/item/seeds/tomato,
					/obj/item/seeds/apple,
					/obj/item/seeds/soya,
					/obj/item/seeds/wheat,
					/obj/item/seeds/carrot,
					/obj/item/seeds/hare,
					/obj/item/seeds/lemon,
					/obj/item/seeds/orange,
					/obj/item/seeds/grass,
					/obj/item/seeds/sunflower,
					/obj/item/seeds/chanter,
					/obj/item/seeds/potato,
					/obj/item/seeds/sugarcane)
	cost = 100
	containertype = /obj/structure/closet/crate/hydroponics
	crate_name = "seeds crate"
	group = "Hydroponics"

/datum/supply_pack/weedcontrol
	name = "Weed Control Crate"
	contains = list(/obj/item/clothing/mask/gas,
					/obj/item/grenade/chem_grenade/antiweed,
					/obj/item/grenade/chem_grenade/antiweed,
					/obj/item/grenade/chem_grenade/antiweed,
					/obj/item/grenade/chem_grenade/antiweed)
	cost = 120
	containertype = /obj/structure/closet/crate/secure/hydrosec
	crate_name = "weed control crate"
	group = "Hydroponics"

/datum/supply_pack/exoticseeds
	name = "Exotic Seeds Crate"
	contains = list(/obj/item/seeds/libertymycelium,
					/obj/item/seeds/reishimycelium,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/random,
					/obj/item/seeds/kudzuseed)
	cost = 240
	containertype = /obj/structure/closet/crate/hydroponics
	crate_name = "exotic seeds crate"
	group = "Hydroponics"

/datum/supply_pack/hydro_tray
	name = "Hydroponics Tray Crate"
	contains = list(/obj/machinery/hydroponics)
	cost = 340
	containertype = /obj/structure/largecrate
	crate_name = "hydroponics tray crate"
	group = "Hydroponics"

/datum/supply_pack/watertank
	name = "Water Tank Crate"
	contains = list(/obj/structure/reagent_dispensers/watertank)
	cost = 100
	containertype = /obj/structure/largecrate
	crate_name = "water tank crate"
	group = "Hydroponics"

/datum/supply_pack/large_watertank
	name = "Large Water Tank Crate"
	contains = list(/obj/structure/reagent_dispensers/watertank/huge)
	cost = 200
	containertype = /obj/structure/largecrate
	crate_name = "water tank crate"
	group = "Hydroponics"
