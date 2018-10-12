/var/global/list/autolathe_recipes
/var/global/list/autolathe_categories

var/const/EXTRA_COST_FACTOR = 1
// Items are more expensive to produce than they are to recycle.
// Yeah but just make recycling bad
// Extra cost factor implies you are DELETING steel (1st law of thermodynamics)

/proc/populate_lathe_recipes()

	//Create global autolathe recipe list if it hasn't been made already.
	autolathe_recipes = list()
	autolathe_categories = list()
	for(var/R in typesof(/datum/autolathe/recipe)-/datum/autolathe/recipe)
		var/datum/autolathe/recipe/recipe = new R
		autolathe_recipes += recipe
		autolathe_categories |= recipe.category

		var/obj/item/I = new recipe.path
		if(I.matter && !recipe.resources) //This can be overidden in the datums.
			recipe.resources = list()
			for(var/material in I.matter)
				recipe.resources[material] = I.matter[material] * EXTRA_COST_FACTOR
		qdel(I)

/datum/autolathe/recipe
	var/name = "object"
	var/path
	var/list/resources
	var/hidden
	var/category
	var/power_use = 0
	var/is_stack

/datum/autolathe/recipe/bucket
	name = "bucket"
	path = /obj/item/weapon/reagent_containers/glass/bucket
	category = "General"

/datum/autolathe/recipe/flashlight
	name = "flashlight"
	path = /obj/item/device/flashlight
	category = "General"

/datum/autolathe/recipe/maglight
	name = "maglight"
	path = /obj/item/device/flashlight/maglight
	category = "General"

/datum/autolathe/recipe/penlight
	name = "penlight"
	path = /obj/item/device/flashlight/pen
	category = "General"

/datum/autolathe/recipe/desklamp
	name = "desk lamp"
	path = /obj/item/device/flashlight/lamp
	category = "General"

/datum/autolathe/recipe/floor_light
	name = "floor light"
	path = /obj/machinery/floor_light
	category = "General"

/datum/autolathe/recipe/extinguisher
	name = "extinguisher"
	path = /obj/item/weapon/extinguisher
	category = "General"

/datum/autolathe/recipe/tank/proc/Fabricate()
	var/obj/item/weapon/tank/T = ..()
	T.air_contents = new /datum/gas_mixture(T.volume, T20C)  //Empty air tanks only
	return T

/datum/autolathe/recipe/tank
	name = "air tank"
	path = /obj/item/weapon/tank/oxygen/yellow
	category = "General"

/datum/autolathe/recipe/tank_double
	name = "emergency air tank"
	path = /obj/item/weapon/tank/emergency/oxygen/engi
	category = "General"

/datum/autolathe/recipe/jar
	name = "jar"
	path = /obj/item/glass_jar
	category = "General"

/datum/autolathe/recipe/crowbar
	name = "crowbar"
	path = /obj/item/weapon/crowbar
	category = "Tools"

/datum/autolathe/recipe/prybar
	name = "pry bar"
	path = /obj/item/weapon/crowbar/prybar
	category = "Tools"

/datum/autolathe/recipe/int_wirer
	name = "integrated circuit wirer"
	path = /obj/item/device/integrated_electronics/wirer
	category = "Tools"

/datum/autolathe/recipe/int_debugger
	name = "integrated circuit debugger"
	path = /obj/item/device/integrated_electronics/debugger
	category = "Tools"

/datum/autolathe/recipe/int_analyzer
	name = "integrated circuit analyzer"
	path = /obj/item/device/integrated_electronics/analyzer
	category = "Tools"

/datum/autolathe/recipe/multitool
	name = "multitool"
	path = /obj/item/device/multitool
	category = "Tools"

/datum/autolathe/recipe/t_scanner
	name = "T-ray scanner"
	path = /obj/item/device/t_scanner
	category = "Tools"

/datum/autolathe/recipe/weldertool
	name = "welding tool"
	path = /obj/item/weapon/weldingtool
	category = "Tools"

/datum/autolathe/recipe/screwdriver
	name = "screwdriver"
	path = /obj/item/weapon/screwdriver
	category = "Tools"

/datum/autolathe/recipe/wirecutters
	name = "wirecutters"
	path = /obj/item/weapon/wirecutters
	category = "Tools"

/datum/autolathe/recipe/wrench
	name = "wrench"
	path = /obj/item/weapon/wrench
	category = "Tools"

/datum/autolathe/recipe/hatchet
	name = "hatchet"
	path = /obj/item/weapon/material/hatchet
	category = "Tools"

/datum/autolathe/recipe/minihoe
	name = "mini hoe"
	path = /obj/item/weapon/material/minihoe
	category = "Tools"

/datum/autolathe/recipe/radio_headset
	name = "radio headset"
	path = /obj/item/device/radio/headset
	category = "General"

/datum/autolathe/recipe/radio_bounced
	name = "shortwave radio"
	path = /obj/item/device/radio/off
	category = "General"

/datum/autolathe/recipe/suit_cooler
	name = "suit cooling unit"
	path = /obj/item/device/suit_cooling_unit
	category = "General"

/datum/autolathe/recipe/weldermask
	name = "welding mask"
	path = /obj/item/clothing/head/welding
	category = "General"

/datum/autolathe/recipe/metal
	name = "steel sheets"
	path = /obj/item/stack/material/steel
	category = "General"
	is_stack = 1
	resources = list("steel" = SHEET_MATERIAL_AMOUNT * EXTRA_COST_FACTOR)

/datum/autolathe/recipe/glass
	name = "glass sheets"
	path = /obj/item/stack/material/glass
	category = "General"
	is_stack = 1
	resources = list("glass" = SHEET_MATERIAL_AMOUNT * EXTRA_COST_FACTOR)

/datum/autolathe/recipe/rglass
	name = "reinforced glass sheets"
	path = /obj/item/stack/material/glass/reinforced
	category = "General"
	is_stack = 1
	resources = list("glass" = (SHEET_MATERIAL_AMOUNT/2) * EXTRA_COST_FACTOR, "steel" = (SHEET_MATERIAL_AMOUNT/2) * EXTRA_COST_FACTOR)

/datum/autolathe/recipe/rods
	name = "metal rods"
	path = /obj/item/stack/rods
	category = "General"
	is_stack = 1

/datum/autolathe/recipe/knife
	name = "kitchen knife"
	path = /obj/item/weapon/material/knife
	category = "General"

/datum/autolathe/recipe/knife/butch
	name = "butcher knife"
	path = /obj/item/weapon/material/knife/butch
	category = "General"

/datum/autolathe/recipe/taperecorder
	name = "tape recorder"
	path = /obj/item/device/taperecorder/empty
	category = "General"

/datum/autolathe/recipe/tape
	name = "tape"
	path = /obj/item/device/tape
	category = "General"

/datum/autolathe/recipe/norad_airlock_controller
	name = "airlock controller (no radio)"
	path = /obj/item/frame/airlock_controller_norad
	category = "Engineering"

/datum/autolathe/recipe/norad_airlock_sensor
	name = "airlock sensor (no radio)"
	path = /obj/item/frame/airlock_sensor_norad
	category = "Engineering"

/datum/autolathe/recipe/airlockmodule
	name = "airlock electronics"
	path = /obj/item/weapon/airlock_electronics
	category = "Engineering"

/datum/autolathe/recipe/airalarm
	name = "air alarm electronics"
	path = /obj/item/weapon/airalarm_electronics
	category = "Engineering"

/datum/autolathe/recipe/firealarm
	name = "fire alarm electronics"
	path = /obj/item/weapon/firealarm_electronics
	category = "Engineering"

/datum/autolathe/recipe/powermodule
	name = "power control module"
	path = /obj/item/weapon/module/power_control
	category = "Engineering"

/datum/autolathe/recipe/rcd_ammo
	name = "matter cartridge"
	path = /obj/item/weapon/rcd_ammo
	category = "Engineering"

/datum/autolathe/recipe/rcd_ammo_large
	name = "high-capacity matter cartridge"
	path = /obj/item/weapon/rcd_ammo/large
	category = "Engineering"

/datum/autolathe/recipe/scalpel
	name = "scalpel"
	path = /obj/item/weapon/scalpel
	category = "Medical"

/datum/autolathe/recipe/circularsaw
	name = "circular saw"
	path = /obj/item/weapon/circular_saw
	category = "Medical"

/datum/autolathe/recipe/surgicaldrill
	name = "surgical drill"
	path = /obj/item/weapon/surgicaldrill
	category = "Medical"

/datum/autolathe/recipe/retractor
	name = "retractor"
	path = /obj/item/weapon/retractor
	category = "Medical"

/datum/autolathe/recipe/cautery
	name = "cautery"
	path = /obj/item/weapon/cautery
	category = "Medical"

/datum/autolathe/recipe/hemostat
	name = "hemostat"
	path = /obj/item/weapon/hemostat
	category = "Medical"

/datum/autolathe/recipe/beaker
	name = "glass beaker"
	path = /obj/item/weapon/reagent_containers/glass/beaker
	category = "Medical"

/datum/autolathe/recipe/beaker_large
	name = "large glass beaker"
	path = /obj/item/weapon/reagent_containers/glass/beaker/large
	category = "Medical"

/datum/autolathe/recipe/vial
	name = "glass vial"
	path = /obj/item/weapon/reagent_containers/glass/beaker/vial
	category = "Medical"

/datum/autolathe/recipe/pillbottle
	name = "pill bottle"
	path = /obj/item/weapon/storage/pill_bottle
	category = "Medical"

/datum/autolathe/recipe/syringe
	name = "syringe"
	path = /obj/item/weapon/reagent_containers/syringe
	category = "Medical"

/datum/autolathe/recipe/syringegun_ammo
	name = "syringe gun cartridge"
	path = /obj/item/weapon/syringe_cartridge
	category = "Arms and Ammunition"

/datum/autolathe/recipe/shotgun_blanks
	name = "ammunition (shotgun, blank)"
	path = /obj/item/ammo_casing/shotgun/blank
	category = "Arms and Ammunition"

/datum/autolathe/recipe/shotgun_beanbag
	name = "ammunition (shotgun, beanbag)"
	path = /obj/item/ammo_casing/shotgun/beanbag
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/shotgun_rubber
	name = "ammunition (shotgun, rubber)"
	path = /obj/item/ammo_casing/shotgun/rubber
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/shotgun_flash
	name = "ammunition (shotgun, flash)"
	path = /obj/item/ammo_casing/shotgun/flash
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_rubber
	name = "ammunition (.45, rubber)"
	path = /obj/item/ammo_magazine/c45m/rubber
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/speedloader_44_rubber
	name = "speed loader (.44 magnum, rubber)"
	path = /obj/item/ammo_magazine/c44/rubber
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_flash
	name = "ammunition (.45, flash)"
	path = /obj/item/ammo_magazine/c45m/flash
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_smg_rubber
	name = "ammunition (9mm rubber top mounted)"
	path = /obj/item/ammo_magazine/mc9mmt/rubber
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/consolescreen
	name = "console screen"
	path = /obj/item/weapon/stock_parts/console_screen
	category = "Devices and Components"

/datum/autolathe/recipe/igniter
	name = "igniter"
	path = /obj/item/device/assembly/igniter
	category = "Devices and Components"

/datum/autolathe/recipe/signaler
	name = "signaler"
	path = /obj/item/device/assembly/signaler
	category = "Devices and Components"

/datum/autolathe/recipe/sensor_infra
	name = "infrared sensor"
	path = /obj/item/device/assembly/infra
	category = "Devices and Components"

/datum/autolathe/recipe/timer
	name = "timer"
	path = /obj/item/device/assembly/timer
	category = "Devices and Components"

/datum/autolathe/recipe/sensor_prox
	name = "proximity sensor"
	path = /obj/item/device/assembly/prox_sensor
	category = "Devices and Components"

/datum/autolathe/recipe/cable_coil
	name = "cable coil"
	path = /obj/item/stack/cable_coil
	category = "Devices and Components"
	is_stack = 1

/datum/autolathe/recipe/tube/large
	name = "spotlight tube"
	path = /obj/item/weapon/light/tube/large
	category = "General"

/datum/autolathe/recipe/tube
	name = "light tube"
	path = /obj/item/weapon/light/tube
	category = "General"

/datum/autolathe/recipe/bulb
	name = "light bulb"
	path = /obj/item/weapon/light/bulb
	category = "General"

/datum/autolathe/recipe/ashtray_glass
	name = "glass ashtray"
	path = /obj/item/weapon/material/ashtray/glass
	category = "General"

/datum/autolathe/recipe/camera_assembly
	name = "camera assembly"
	path = /obj/item/weapon/camera_assembly
	category = "Engineering"

/datum/autolathe/recipe/weldinggoggles
	name = "welding goggles"
	path = /obj/item/clothing/glasses/welding
	category = "General"

/datum/autolathe/recipe/blackpen
	name = "black ink pen"
	path = /obj/item/weapon/pen
	category = "General"

/datum/autolathe/recipe/bluepen
	name = "blue ink pen"
	path = /obj/item/weapon/pen/blue
	category = "General"

/datum/autolathe/recipe/redpen
	name = "red ink pen"
	path = /obj/item/weapon/pen/red
	category = "General"

/datum/autolathe/recipe/clipboard
	name = "clipboard"
	path = /obj/item/weapon/clipboard
	category = "General"

/datum/autolathe/recipe/destTagger
	name = "destination tagger"
	path = /obj/item/device/destTagger
	category = "General"

/datum/autolathe/recipe/labeler
	name = "hand labeler"
	path = /obj/item/weapon/hand_labeler
	category = "General"

/datum/autolathe/recipe/flamethrower
	name = "flamethrower"
	path = /obj/item/weapon/flamethrower/full
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_revolver_1
	name = "ammunition (.357)"
	path = /obj/item/ammo_magazine/a357
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_revolver_2
	name = "ammunition (.45)"
	path = /obj/item/ammo_magazine/c45m
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/speedloader_44
	name = "speed loader (.44 magnum)"
	path = /obj/item/ammo_magazine/c44
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_revolver_3
	name = "ammunition (.38)"
	path = /obj/item/ammo_magazine/c38
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_revolver_4
	name = "ammunition (.50AE)"
	path = /obj/item/ammo_magazine/c50
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_stetchkin
	name = "ammunition (9mm)"
	path = /obj/item/ammo_magazine/mc9mm
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_stetchkin_flash
	name = "ammunition (9mm, flash)"
	path = /obj/item/ammo_magazine/mc9mm/flash
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_c20r
	name = "ammunition (10mm)"
	path = /obj/item/ammo_magazine/a10mm
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_arifle
	name = "ammunition (5.56mm)"
	path = /obj/item/ammo_magazine/c556
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_smg
	name = "ammunition (9mm top mounted)"
	path = /obj/item/ammo_magazine/mc9mmt
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_carbine
	name = "ammunition (7.62mm)"
	path = /obj/item/ammo_magazine/a762
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/shotgun
	name = "ammunition (slug, shotgun)"
	path = /obj/item/ammo_casing/shotgun
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/shotgun_pellet
	name = "ammunition (shell, shotgun)"
	path = /obj/item/ammo_casing/shotgun/pellet
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/tacknife
	name = "tactical knife"
	path = /obj/item/weapon/material/hatchet/tacknife
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/stunshell
	name = "ammunition (stun cartridge, shotgun)"
	path = /obj/item/ammo_casing/shotgun/stunshell
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_uzi
	name = "ammunition (machine.45)"
	path = /obj/item/ammo_magazine/c45uzi
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/magazine_deagle
	name = "ammunition (.50 AE)"
	path = /obj/item/ammo_magazine/a50
	hidden = 1
	category = "Arms and Ammunition"

/datum/autolathe/recipe/rcd
	name = "rapid construction device"
	path = /obj/item/weapon/rcd
	hidden = 1
	category = "Engineering"

/datum/autolathe/recipe/stasisclamp
	name = "stasis clamp"
	path = /obj/item/clamp
	category = "Engineering"

/datum/autolathe/recipe/beerkeg
	name = "beer keg"
	path = /obj/structure/reagent_dispensers/beerkeg/empty
	category = "General"

/datum/autolathe/recipe/electropack
	name = "electropack"
	path = /obj/item/device/radio/electropack
	hidden = 1
	category = "Devices and Components"

/datum/autolathe/recipe/beartrap
	name = "mechanical trap"
	path = /obj/item/weapon/beartrap
	hidden = 1
	category = "Devices and Components"

/datum/autolathe/recipe/welder_industrial
	name = "industrial welding tool"
	path = /obj/item/weapon/weldingtool/largetank
	hidden = 1
	category = "Tools"

/datum/autolathe/recipe/handcuffs
	name = "handcuffs"
	path = /obj/item/weapon/handcuffs
	hidden = 1
	category = "General"

/datum/autolathe/recipe/cell_device
	name = "device cell"
	path = /obj/item/weapon/cell/device/standard
	category = "Devices and Components"

/datum/autolathe/recipe/ecigcartridge
	name = "ecigarette cartridge"
	path = /obj/item/weapon/reagent_containers/ecig_cartridge/blank
	category = "Devices and Components"

/datum/autolathe/recipe/ecig
	// We get it, you vape
	name = "ecigarette"
	path = /obj/item/clothing/mask/smokable/ecig/lathed
	category = "Devices and Components"

/datum/autolathe/recipe/keypad
	name = "airlock keypad electronics"
	path = /obj/item/weapon/airlock_electronics/keypad_electronics
	category = "Engineering"

/datum/autolathe/recipe/business
	name = "business airlock electronics"
	path = /obj/item/weapon/airlock_electronics/business
	category = "Engineering"

/datum/autolathe/recipe/analyzer
	name = "gas analyzer"
	path = /obj/item/device/analyzer
	category = "Tools"

/datum/autolathe/recipe/healthscanner
	name = "health scanner"
	path = /obj/item/device/healthanalyzer
	category = "Medical"

/datum/autolathe/recipe/mop
	name = "mop"
	path = /obj/item/weapon/mop
	category = "General"

/datum/autolathe/recipe/spraybottle
	name = "spray bottle"
	path = /obj/item/weapon/reagent_containers/spray
	category = "General"

/datum/autolathe/recipe/glasses
	name = "prescription glasses"
	path = /obj/item/clothing/glasses/regular
	category = "Medical"

/datum/autolathe/recipe/dropper
	name = "dropper"
	path = /obj/item/weapon/reagent_containers/dropper
	category = "Medical"

/datum/autolathe/recipe/lighter
	name = "cheap lighter"
	path = /obj/item/weapon/flame/lighter
	category = "General"

/datum/autolathe/recipe/pitcher
	name = "pitcher"
	path = /obj/item/weapon/reagent_containers/food/drinks/pitcher
	category = "General"

/datum/autolathe/recipe/carafe
	name = "carafe"
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/carafe
	category = "General"

/datum/autolathe/recipe/lipstick
	name = "lipstick"
	path = /obj/item/weapon/lipstick
	category = "General"

/datum/autolathe/recipe/lipstick_purple
	name = "purple lipstick"
	path = /obj/item/weapon/lipstick/purple
	category = "General"

/datum/autolathe/recipe/lipstick_jade
	name = "jade lipstick"
	path = /obj/item/weapon/lipstick/jade
	category = "General"

/datum/autolathe/recipe/lipstick_black
	name = "black lipstick"
	path = /obj/item/weapon/lipstick/black
	category = "General"

/datum/autolathe/recipe/comb
	name = "comb"
	path = /obj/item/weapon/haircomb
	category = "General"

/datum/autolathe/recipe/red_doll
	name = "red doll"
	path = /obj/item/toy/therapy_red
	category = "General"

/datum/autolathe/recipe/purple_doll
	name = "purple doll"
	path = /obj/item/toy/therapy_purple
	category = "General"

/datum/autolathe/recipe/blue_doll
	name = "blue doll"
	path = /obj/item/toy/therapy_blue
	category = "General"

/datum/autolathe/recipe/yellow_doll
	name = "yellow doll"
	path = /obj/item/toy/therapy_yellow
	category = "General"

/datum/autolathe/recipe/green_doll
	name = "green doll"
	path = /obj/item/toy/therapy_green
	category = "General"

/datum/autolathe/recipe/water_balloon
	name = "water balloon"
	path = /obj/item/toy/water_balloon
	category = "General"

/datum/autolathe/recipe/coffeecup
	name = "coffee cup"
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup
	category = "General"
	New()
		..()
		var/obj/O = path
		name = initial(O.name) // generic recipes yay

/datum/autolathe/recipe/coffeecup/black
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/black

/datum/autolathe/recipe/coffeecup/green
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/green

/datum/autolathe/recipe/coffeecup/heart
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/heart

/datum/autolathe/recipe/coffeecup/metal
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/metal

/datum/autolathe/recipe/coffeecup/rainbow
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/rainbow

/datum/autolathe/recipe/coffeecup/NT
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/NT

/datum/autolathe/recipe/coffeecup/STC
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/STC
	hidden = 1 // We get our autolathes from a SolGov-friendly firm.

/datum/autolathe/recipe/coffeecup/SCG
	path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/SCG

/datum/autolathe/recipe/drinkingglass
	name = "drinking glass"
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/square
	category = "General"
	New()
		..()
		var/obj/O = path
		name = initial(O.name) // generic recipes yay

/datum/autolathe/recipe/drinkingglass/rocks
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/rocks

/datum/autolathe/recipe/drinkingglass/shake
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/shake

/datum/autolathe/recipe/drinkingglass/cocktail
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail

/datum/autolathe/recipe/drinkingglass/shot
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/shot

/datum/autolathe/recipe/drinkingglass/pint
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/pint

/datum/autolathe/recipe/drinkingglass/mug
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/mug

/datum/autolathe/recipe/drinkingglass/wine
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/wine
