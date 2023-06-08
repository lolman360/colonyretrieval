/obj/item/storage/pouch
	name = "pouch"
	desc = "Can hold various things."
	icon = 'icons/inventory/pockets/icon.dmi'
	icon_state = "pouch"
	item_state = "pouch"
	price_tag = 100
	cant_hold = list(/obj/item/storage/pouch) //Pouches in pouches was a misstake

	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT //Pouches can be worn on belt
	storage_slots = 1
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_SMALL_STORAGE
	matter = list(MATERIAL_BIOMATTER = 12)
	attack_verb = list("pouched")

	var/sliding_behavior = FALSE

/obj/item/storage/pouch/verb/toggle_slide()
	set name = "Toggle Slide"
	set desc = "Toggle the behavior of last item in [src] \"sliding\" into your hand."
	set category = "Object"

	sliding_behavior = !sliding_behavior
	to_chat(usr, SPAN_NOTICE("Items will now [sliding_behavior ? "" : "not"] slide out of [src]"))

/obj/item/storage/pouch/attack_hand(mob/living/carbon/human/user)
	if(sliding_behavior && contents.len && (src in user))
		slide_out_item(user)
	else
		..()

/obj/item/storage/pouch/proc/slide_out_item(mob/living/carbon/human/user)
	var/obj/item/I = contents[contents.len]
	if(istype(I))
		hide_from(usr)
		var/turf/T = get_turf(user)
		remove_from_storage(I, T)
		usr.put_in_hands(I)
		add_fingerprint(user)

/obj/item/storage/pouch/small_generic
	name = "small generic pouch"
	desc = "Can hold nearly anything in it, but only a small amount."
	icon_state = "small_generic"
	item_state = "small_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE * 0.5
	max_w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_BIOMATTER = 5)
	level = BELOW_PLATING_LEVEL //We can hide under tiles :D

/obj/item/storage/pouch/small_generic/purple
	icon_state = "small_generic_p"
	item_state = "small_generic_p"

/obj/item/storage/pouch/small_generic/leather
	icon_state = "small_leather"
	item_state = "small_leather"
	price_tag = 250

/obj/item/storage/pouch/medium_generic
	name = "medium generic pouch"
	desc = "Can hold nearly anything in it, but only a moderate amount."
	icon_state = "medium_generic"
	item_state = "medium_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE
	max_w_class = ITEM_SIZE_NORMAL
	price_tag = 400
	level = BELOW_PLATING_LEVEL //As we can

/obj/item/storage/pouch/medium_generic/leather
	icon_state = "medium_leather"
	item_state = "medium leather"
	price_tag = 500

/obj/item/storage/pouch/medium_generic/opifex
	name = "opifex smuggle pouch"
	desc = "Can hold nearly anything in it, but only a moderate amount. Made by the opifex, for the opifex."
	icon_state = "medium_opifex"
	item_state = "medium_opifex"

/obj/item/storage/pouch/large_generic
	name = "large generic pouch"
	desc = "A mini satchel. Can hold a fair bit, but it won't fit in your pocket"
	icon_state = "large_generic"
	item_state = "large_generic"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_NORMAL_STORAGE
	max_w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_BIOMATTER = 20)
	price_tag = 800

/obj/item/storage/pouch/large_generic/leather
	desc = "A mini satchel made of leather. Can hold a fair bit, but it won't fit in your pocket"
	icon_state = "large_leather"
	item_state = "large_leather"
	price_tag = 900

/obj/item/storage/pouch/medical_supply
	name = "medical supply pouch"
	desc = "Can hold medical equipment. But only about four pieces of it."
	icon_state = "medical_supply"
	item_state = "medical_supply"

	storage_slots = 4
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare
		)

/obj/item/storage/pouch/engineering_tools
	name = "engineering tools pouch"
	desc = "Can hold small engineering tools. But only about four pieces of them."
	icon_state = "engineering_tool"
	item_state = "engineering_tool"

	storage_slots = 4
	max_w_class = ITEM_SIZE_SMALL

	can_hold = list(
		/obj/item/tool,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/device/radio/headset,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/scanner/gas,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/tool/minihoe,
		/obj/item/tool/hatchet,
		/obj/item/device/scanner/plant,
		/obj/item/extinguisher/mini,
		/obj/item/hand_labeler,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses,
		/obj/item/flame/lighter,
		/obj/item/cell/small,
		/obj/item/cell/medium,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare
		)

/obj/item/storage/pouch/engineering_supply
	name = "engineering supply pouch"
	desc = "Can hold engineering equipment. But only about three pieces of it."
	icon_state = "engineering_supply"
	item_state = "engineering_supply"

	storage_slots = 3
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/cell,
		/obj/item/circuitboard,
		/obj/item/tool,
		/obj/item/stack/material,
		/obj/item/material,
		/obj/item/stack/rods,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/scanner/gas,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/extinguisher/mini,
		/obj/item/airlock_electronics,
		/obj/item/airalarm_electronics,
		/obj/item/circuitboard/apc,
		/obj/item/ammo_casing/flare
		)

/obj/item/storage/pouch/janitor_supply
	name = "janitorial supply pouch"
	desc = "Can hold janitorial equipment, but only about four pieces of them."
	icon_state = "janitor_supply"
	item_state = "janitor_supply"

	storage_slots = 4
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/grenade/chem_grenade/cleaner,
		/obj/item/grenade/chem_grenade/antiweed,
		/obj/item/reagent_containers/spray/cleaner,
		/obj/item/device/assembly/mousetrap,
		/obj/item/device/scanner/plant,
		/obj/item/extinguisher/mini,
		/obj/item/gun/projectile/boltgun/flare_gun
		)

/obj/item/storage/pouch/ammo
	name = "ammo pouch"
	desc = "Can hold ammo magazines and bullets, not the boxes though."
	icon_state = "ammo"
	item_state = "ammo"

	storage_slots = 4
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing
		)

/obj/item/storage/pouch/tubular
	name = "tubular pouch"
	desc = "Can hold seven cylindrical and small items, including but not limiting to flares, glowsticks, syringes and even hatton tubes or rockets."
	icon_state = "flare"
	item_state = "flare"

	storage_slots = 7
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/tool/baton,
		/obj/item/device/lighting/glowstick,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/ammo_casing/rocket,
		/obj/item/ammo_magazine/smg_35,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/glass/beaker/vial,
		/obj/item/reagent_containers/hypospray,
		/obj/item/pen,
		/obj/item/storage/pill_bottle,
		/obj/item/hatton_magazine,
		/obj/item/extinguisher,
		/obj/item/implanter,
		/obj/item/grenade/chem_grenade,
		/obj/item/weldpack/canister,
		/obj/item/cell/medium,
		/obj/item/cell/small,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tank/emergency_nitgen,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/ammo_casing/flare,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_magazine/speed_loader_shotgun
		)

/obj/item/storage/pouch/tubular/vial
	name = "vial pouch"
	desc = "Can hold seven cylindrical and small items, including but not limiting to flares, glowsticks, syringes and even hatton tubes or rockets. Tho the branding on this wants you to only really use it with vial."


/obj/item/storage/pouch/tubular/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "flare_[contents.len]"))

/obj/item/storage/pouch/grow_a_gun
	name = "H&S Grow A Gun"
	desc = "A bag of dehydrated guns, just add water to grow them into a ready to use Slaught-o-Matic. There are several warnings to not eat the dehydrated guns inside, and to keep away from kids unless hydrated."
	icon_state = "grow"
	item_state = "grow"
	matter = list(MATERIAL_PLASTIC = 1)
	storage_slots = 7
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_TINY

	can_hold = list(
		/obj/item/reagent_containers/food/snacks/cube/gun,
		)

/obj/item/storage/pouch/grow_a_gun/New()
	populate_contents()

/obj/item/storage/pouch/grow_a_gun/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/food/snacks/cube/gun(src)
	update_icon()

/obj/item/storage/pouch/grow_a_gun/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "grow_[contents.len]"))


/obj/item/storage/pouch/pistol_holster
	name = "pistol holster"
	desc = "Can hold a handgun in."
	icon_state = "pistol_holster"
	item_state = "pistol_holster"

	storage_slots = 1
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/gun/projectile/makarov,
		/obj/item/gun/projectile/clarissa,
		/obj/item/gun/projectile/colt,
		/obj/item/gun/projectile/basilisk,
		/obj/item/gun/projectile/giskard,
		/obj/item/gun/projectile/gyropistol,
		/obj/item/gun/projectile/lamia,
		/obj/item/gun/projectile/mk58,
		/obj/item/gun/projectile/revolver/lemant,
		/obj/item/gun/projectile/olivaw,
		/obj/item/gun/projectile/silenced,
		/obj/item/gun/projectile/ladon,
		/obj/item/gun/projectile/glock,
		/obj/item/gun/projectile/that_gun,
		/obj/item/gun/projectile/judiciary,
		/obj/item/gun/projectile/rebar,
		/obj/item/gun/projectile/rivet,
		/obj/item/gun/projectile/silvereye,
		/obj/item/gun/projectile/spring,
		/obj/item/gun/projectile/boltgun/sawn,
		/obj/item/gun/projectile/shotgun/pump/obrez,
		/obj/item/gun/projectile/automatic/texan,
		/obj/item/gun/projectile/automatic/sts/sawn,
		/obj/item/gun/projectile/automatic/luty,
		/obj/item/gun/projectile/automatic/freedom,
		/obj/item/gun/projectile/automatic/slaught_o_matic,
		/obj/item/gun/projectile/automatic/nordwind/strelki/sawn,
		/obj/item/gun/projectile/automatic/omnirifle/solmarine/sawn,
		/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless_sawn,
		/obj/item/gun/energy/glock,
		/obj/item/gun/energy/ionpistol,
		/obj/item/gun/energy/gun,
		/obj/item/gun/energy/chameleon,
		/obj/item/gun/energy/centurio,
		/obj/item/gun/energy/stunrevolver,
		/obj/item/gun/energy/ntpistol,
		/obj/item/gun/energy/zwang,
		/obj/item/gun/energy/captain,
		/obj/item/gun/energy/floragun,
		/obj/item/gun/energy/taser,
		/obj/item/gun/energy/slimegun,
		/obj/item/gun/energy/sonic_emitter,
		/obj/item/gun/energy/crossbow,
		/obj/item/gun/energy/xray/psychic_cannon,
		/obj/item/gun/energy/laser/railgun/pistol,
		/obj/item/gun/energy/laser/makeshift,
		/obj/item/gun/energy/cog/sawn,
		/obj/item/gun/projectile/revolver,
		/obj/item/gun/projectile/revolver/sixshot/sawn,
		/obj/item/gun/projectile/shotgun/doublebarrel/sawn, //short enough to fit in
		/obj/item/gun/launcher/syringe,
		/obj/item/gun/energy/plasma/auretian,
		/obj/item/gun/energy/plasma/stranger,
		/obj/item/gun/energy/plasma/martyr,
		/obj/item/gun/projectile/boltgun/flare_gun,
		/obj/item/gun/matter/launcher/nt_sprayer
		)

	cant_hold = list(/obj/item/storage/pouch,
					 /obj/item/gun/projectile/automatic/sts/rifle/sawn/blackshield,
					 /obj/item/gun/projectile/automatic/sts/rifle/sawn,
					 /obj/item/gun/projectile/revolver/sixshot,
					 /obj/item/gun/energy/gun/nuclear,
					 /obj/item/gun/energy/crossbow/largecrossbow,
					 )


	sliding_behavior = TRUE

/obj/item/storage/pouch/pistol_holster/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "pistol_layer"))

/obj/item/storage/pouch/pistol_holster/cowboy
	name = "belt holster"
	desc = "Can hold two handguns in. Quick on the draw!"
	icon_state = "double_holster"
	item_state = "double_holster"
	price_tag = 100
	matter = list(MATERIAL_BIOMATTER = 24) // Two holsters in one!
	slot_flags = SLOT_BELT|SLOT_DENYPOCKET
	max_w_class = ITEM_SIZE_HUGE
	storage_slots = 2

/obj/item/storage/pouch/pistol_holster/cowboy/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "gun_[contents.len]"))

/obj/item/storage/pouch/kniferig
	name = "throwing knife rig"
	desc = "A rig for professionals at knife throwing."
	icon_state = "kniferig"
	item_state = "kniferig"
	price_tag = 50
	storage_slots = 4 // 12 knives total counting stacks
	can_hold = list(
		/obj/item/stack/thrown/throwing_knife
		)

/obj/item/storage/pouch/kniferig/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "knife_[contents.len]"))

/obj/item/storage/pouch/quiver
	name = "arrows quiver"
	desc = "A quiver that can hold many types of arrows for quick drawing. Ideal for the aspiring or veteran hunter."
	icon_state = "quiver"
	item_state = "quiver"
	price_tag = 50
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	matter = list(MATERIAL_BIOMATTER = 10)
	storage_slots = 4 // 12 arrows
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL
	sliding_behavior = TRUE // It is by default a quickdraw quiver

	can_hold = list(
		/obj/item/ammo_casing/arrow,
		/obj/item/ammo_casing/arrow/bulk, // Just in case...
		/obj/item/ammo_casing/arrow/hunting,
		/obj/item/ammo_casing/arrow/hunting/bulk,
		/obj/item/ammo_casing/arrow/hunting/heavy,
		/obj/item/ammo_casing/arrow/hunting/heavy/bulk,
		/obj/item/ammo_casing/arrow/broadhead,
		/obj/item/ammo_casing/arrow/serrated,
		/obj/item/ammo_casing/arrow/reagent,
		/obj/item/ammo_casing/arrow/reagent/hypo,
		/obj/item/ammo_casing/arrow/practice,
		/obj/item/ammo_casing/arrow/practice/bulk,
		/obj/item/ammo_casing/arrow/empty_payload,
		/obj/item/ammo_casing/arrow/empty_payload/bulk,
		/obj/item/ammo_casing/arrow/explosive,
		/obj/item/ammo_casing/arrow/explosive/emp,
		/obj/item/ammo_casing/arrow/explosive/flashbang,
		/obj/item/ammo_casing/arrow/explosive/heatwave,
		/obj/item/ammo_casing/arrow/explosive/smoke,
		/obj/item/ammo_casing/arrow/explosive/frag,
		/obj/item/ammo_casing/arrow/explosive/frag/sting)

/obj/item/storage/pouch/quiver/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "arrows"))

/obj/item/storage/pouch/bolts
	name = "crossbow quiver"
	desc = "A quiver that can hold many types of crossbow bolts. Quickdrawing and reloading made easier for ye olde siege enthusiast."
	icon_state = "quiver_crossbow"
	item_state = "quiver_crossbow"
	price_tag = 50
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	matter = list(MATERIAL_BIOMATTER = 15) // Can hold a full stack of rods.
	storage_slots = 4
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_BULKY // Just in case a full stack won't fit.
	sliding_behavior = TRUE // Quickdraw!

	can_hold = list(
		/obj/item/stack/rods,
		/obj/item/ammo_casing/rod_bolt, // Just in case...
		/obj/item/ammo_casing/crossbow_bolts,
		/obj/item/ammo_casing/crossbow_bolts/bulk,
		/obj/item/ammo_casing/crossbow_bolts/fragment,
		/obj/item/ammo_casing/crossbow_bolts/fragment/bulk,
		/obj/item/ammo_casing/crossbow_bolts/speed,
		/obj/item/ammo_casing/crossbow_bolts/speed/bulk)

/obj/item/storage/pouch/bolts/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "bolts"))

/obj/item/storage/pouch/baton_holster
	name = "baton sheath"
	desc = "Can hold a baton, or indeed most shafts."
	icon_state = "baton_holster"
	item_state = "baton_holster"

	storage_slots = 1
	max_w_class = ITEM_SIZE_BULKY

	can_hold = list(
		/obj/item/melee,
		/obj/item/tool/baton,
		/obj/item/tool/crowbar,
		/obj/item/hatton_magazine,
		/obj/item/weldpack/canister,
		/obj/item/cell/medium,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tank/emergency_nitgen,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/reagent_containers/food/snacks/openable/tastybread,
		/obj/item/reagent_containers/food/snacks/baguette,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/food/drinks/cans,
		/obj/item/gun/projectile/boltgun/flare_gun
		)

	sliding_behavior = TRUE

/obj/item/storage/pouch/baton_holster/telebaton

/obj/item/storage/pouch/baton_holster/telebaton/New()
	new/obj/item/melee/telebaton(src)
	update_icon()
	. = ..()

/obj/item/storage/pouch/baton_holster/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/inventory/pockets/icon.dmi', "baton_layer"))

/obj/item/storage/pouch/holding
	name = "pouch of holding"
	desc = "If your pockets are not large enough to store all your belongings, you may want to use this high-tech pouch that opens into a localized pocket of bluespace (pun intended)."
	icon_state = "holdingpouch"
	item_state = "holdingpouch"
	storage_slots = 7
	max_w_class = ITEM_SIZE_BULKY
	max_storage_space = DEFAULT_HUGE_STORAGE
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GOLD = 5, MATERIAL_DIAMOND = 2, MATERIAL_URANIUM = 2)
	origin_tech = list(TECH_BLUESPACE = 4)
	price_tag = 3000

/obj/item/storage/pouch/holding/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(3, get_turf(src))

/obj/item/storage/pouch/holding/attackby(obj/item/W as obj, mob/user as mob)
	if(W.item_flags & BLUESPACE)
		to_chat(user, SPAN_WARNING("The bluespace interfaces of the two devices conflict and malfunction, producing a loud explosion."))
		if (ishuman(user))
			var/mob/living/carbon/human/H = user
			var/held = W.get_equip_slot()
			if (held == slot_l_hand)
				var/obj/item/organ/external/E = H.get_organ(BP_L_ARM)
				E.droplimb(0, DISMEMBER_METHOD_BLUNT)
			else if (held == slot_r_hand)
				var/obj/item/organ/external/E = H.get_organ(BP_R_ARM)
				E.droplimb(0, DISMEMBER_METHOD_BLUNT)
		user.drop_item()
		return
	..()
