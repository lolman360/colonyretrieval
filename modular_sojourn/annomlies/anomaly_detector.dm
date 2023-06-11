/obj/item/device/anomaly_detector
	name = "code anomaly detector"
	desc = "This detects anomalies in the game's code. It looks like it's found one."
	icon = 'icons/obj/device.dmi'
	icon_state = "geiger_on"
	item_state = "multitool"
	w_class = ITEM_SIZE_SMALL
	suitable_cell = /obj/item/cell/small
	var/enabled = FALSE
	var/cell_use
	var/detectrange


//3 tiers, echo, osprey, svarog
//svarog is RD only, osprey is printable, echo is craftable

/obj/item/device/anomaly_detector/Initialize()
	..()

/obj/item/device/anomaly_detector/Destroy()
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/device/anomaly_detector/proc/activate()
	START_PROCESSING(SSobj, src)

/obj/item/device/anomaly_detector/proc/deactivate()
	STOP_PROCESSING(SSobj, src)
	
/obj/item/device/anomaly_detector/echo
	name = "\"Echo\" anomaly detector"
	desc = "This crude sensing device emits beeps and flashes lights in the presence of anomalous radiation. It flashes and beeps faster the closer the anomaly is."

/obj/item/device/anomaly_detector/echo/Process()
	var/obj/structure/stalker_anomaly/closest
	var/closest_range = detectrange + 3
	for(var/obj/structure/stalker_anomaly/SA in range(detectrange))
		if(get_dist(src, SA) < closest_range)
			closest = SA
			closest_range = get_dist(src, SA)
	flick("anom_detected_[closest_range]")