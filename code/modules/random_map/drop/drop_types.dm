var/global/list/datum/supply_drop_loot/supply_drop

/proc/supply_drop_random_loot_types()
	if(!supply_drop)
		supply_drop = init_subtypes(/datum/supply_drop_loot)
		supply_drop = dd_sortedObjectList(supply_drop)
	return supply_drop

/datum/supply_drop_loot
	var/name = ""
	var/container = null
	var/list/contents = null

/datum/supply_drop_loot/proc/contents()
	return contents

/datum/supply_drop_loot/proc/drop(turf/T)
	var/C = container ? new container(T) : T
	for(var/content in contents())
		new content(C)

/datum/supply_drop_loot/dd_SortValue()
	return name

/datum/supply_drop_loot/lasers
	name = "Lasers"
	container = /obj/structure/largecrate

/datum/supply_drop_loot/lasers/New()
	..()
	contents = list(
		/obj/item/gun/energy/laser,
		/obj/item/gun/energy/laser,
		/obj/item/gun/energy/sniperrifle,
		/obj/item/gun/energy/ionrifle)

/datum/supply_drop_loot/ballistics
	name = "Ballistics"
	container = /obj/structure/largecrate

/datum/supply_drop_loot/ballistics/New()
	..()
	contents = list(
		/obj/item/gun/projectile/mk58,
		/obj/item/gun/projectile/shotgun/doublebarrel,
		/obj/item/gun/projectile/shotgun/pump/combat,
		/obj/item/gun/projectile/automatic/texan)

/datum/supply_drop_loot/seeds
	name = "Seeds"
	container = /obj/structure/closet/crate

/datum/supply_drop_loot/seeds/New()
	..()
	contents = list(
		/obj/item/seeds/chili,
		/obj/item/seeds/berry,
		/obj/item/seeds/corn,
		/obj/item/seeds/eggplant,
		/obj/item/seeds/tomato,
		/obj/item/seeds/apple,
		/obj/item/seeds/soya,
		/obj/item/seeds/wheat,
		/obj/item/seeds/carrot,
		/obj/item/seeds/lemon,
		/obj/item/seeds/orange,
		/obj/item/seeds/grass,
		/obj/item/seeds/sunflower,
		/obj/item/seeds/chantr,
		/obj/item/seeds/potato,
		/obj/item/seeds/sugarcane)

/datum/supply_drop_loot/food
	name = "Food"
	container = /obj/structure/largecrate

/datum/supply_drop_loot/food/New()
	..()
	contents = list(
		/obj/item/reagent_containers/food/condiment/flour,
		/obj/item/reagent_containers/food/condiment/flour,
		/obj/item/reagent_containers/food/condiment/flour,
		/obj/item/reagent_containers/food/drinks/milk,
		/obj/item/reagent_containers/food/drinks/milk,
		/obj/item/storage/fancy/egg_box,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat)

/datum/supply_drop_loot/armour
	name = "Armour"
	container = /obj/structure/largecrate

/datum/supply_drop_loot/armour/New()
	..()
	contents = list(
		/obj/item/clothing/head/helmet/faceshield/riot,
		/obj/item/clothing/suit/armor/heavy/riot,
		/obj/item/clothing/head/helmet/faceshield/riot,
		/obj/item/clothing/suit/armor/heavy/riot,
		/obj/item/clothing/head/helmet/faceshield/riot,
		/obj/item/clothing/suit/armor/heavy/riot,
		/obj/item/clothing/suit/armor/vest,
		/obj/item/clothing/suit/armor/vest,
		/obj/item/clothing/suit/storage/vest,
		/obj/item/clothing/suit/storage/vest,
		/obj/item/clothing/suit/armor/laserproof,
		/obj/item/clothing/suit/armor/bulletproof)

/datum/supply_drop_loot/materials
	name = "Materials"
	container = /obj/structure/largecrate

/datum/supply_drop_loot/materials/New()
	..()
	contents = list(
		/obj/item/stack/material/steel/full,
		/obj/item/stack/material/steel/full,
		/obj/item/stack/material/steel/full,
		/obj/item/stack/material/glass/full,
		/obj/item/stack/material/glass/full,
		/obj/item/stack/material/wood/full,
		/obj/item/stack/material/plastic/full,
		/obj/item/stack/material/plasteel/full)

/datum/supply_drop_loot/medical
	name = "Medical"
	container = /obj/structure/closet/crate/medical

/datum/supply_drop_loot/medical/New()
	..()
	contents = list(
		/obj/item/storage/firstaid/regular,
		/obj/item/storage/firstaid/fire,
		/obj/item/storage/firstaid/toxin,
		/obj/item/storage/firstaid/o2,
		/obj/item/reagent_containers/glass/bottle/antitoxin,
		/obj/item/reagent_containers/glass/bottle/inaprovaline,
		/obj/item/reagent_containers/glass/bottle/stoxin,
		/obj/item/storage/box/syringes,
		/obj/item/storage/box/autoinjectors)

/*
/datum/supply_drop_loot/hydroponics
	name = "Hydroponics"
	container = /obj/structure/largecrate

/datum/supply_drop_loot/hydroponics/New()
	..()
	contents = list(
		/obj/machinery/hydroponics,
		/obj/machinery/hydroponics,
		/obj/machinery/hydroponics)

/datum/supply_drop_loot/power
	name = "Power"
	container = /obj/structure/largecrate

/datum/supply_drop_loot/power/New()
	..()
	contents = list(
		/obj/machinery/power/port_gen/pacman,
		/obj/machinery/power/port_gen/pacman/super,
		/obj/machinery/power/port_gen/pacman/mrs)
*/

/datum/supply_drop_loot/power/contents()
	return list(pick(contents))

