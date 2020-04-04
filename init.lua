minetest.register_node("rainbows:rainbow", {
	description = "Rainbow",
	drawtype = "normal",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rainbows_rainbow.png^[transformR90", "rainbows_rainbow.png^[transformR90", "rainbows_rainbow.png"},
	groups = {cracky = 2},
	is_ground_content = false,
	light_source = default.LIGHT_MAX,
	sounds = default.node_sound_defaults()
})

minetest.register_node("rainbows:rainbow_path", {
	description = "Rainbow Path",
	drawtype = "raillike",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"rainbows_rainbow_path_straight.png", "rainbows_rainbow_path_curved.png",
			"rainbows_rainbow_path_t_junction.png", "rainbows_rainbow_path_crossing.png"},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}
	},
	groups = {cracky = 2},
	light_source = default.LIGHT_MAX
})

minetest.register_node("rainbows:cloud", {
	description = "Cloud",
	drawtype = "glasslike",
	paramtype = "light",
	tiles = {"rainbows_cloud.png^[opacity:239"},
	use_texture_alpha = true,
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.375, 0.5}
	},
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults()
})

minetest.register_node("rainbows:rainbow_brick", {
	description = "Rainbow Brick",
	drawtype = "normal",
	tiles = {"rainbows_rainbow_brick.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("rainbows:sky_brick", {
	description = "Sky Brick",
	drawtype = "normal",
	tiles = {"rainbows_sky_brick.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("rainbows:cloud_brick", {
	description = "Cloud Brick",
	drawtype = "normal",
	tiles = {"rainbows_cloud_brick.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("rainbows:rainbow_cloud_brick", {
	description = "Rainbow Cloud Brick",
	drawtype = "normal",
	tiles = {"rainbows_sky_brick.png", "rainbows_cloud_brick.png", "rainbows_rainbow_cloud_brick.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_craft({
	output = "rainbows:rainbow_path 8",
	recipe = {{"rainbows:rainbow", "rainbows:rainbow"}}
})

minetest.register_craft({
	output = "rainbows:rainbow",
	recipe = {
		{"rainbows:rainbow_path", "rainbows:rainbow_path"},
		{"rainbows:rainbow_path", "rainbows:rainbow_path"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "rainbows:rainbow_brick",
	recipe = {"rainbows:rainbow", "default:brick"}
})

minetest.register_craft({
	type = "shapeless",
	output = "rainbows:cloud_brick",
	recipe = {"rainbows:cloud", "default:brick"}
})

minetest.register_craft({
	type = "shapeless",
	output = "rainbows:rainbow_cloud_brick 2",
	recipe = {"rainbows:rainbow_brick", "rainbows:cloud_brick"}
})

dungeon_loot.register({name = "rainbows:rainbow", chance = 0.5, count = {1, 8}, y = {-64, 32768}})
dungeon_loot.register({name = "rainbows:rainbow_path", chance = 0.5, count = {4, 32}, y = {-64, 32768}})
dungeon_loot.register({name = "rainbows:cloud", chance = 0.5, count = {1, 12}, y = {-64, 32768}})
dungeon_loot.register({name = "rainbows:rainbow_brick", chance = 0.25, count = {1, 12}, y = {-64, 32768}})
dungeon_loot.register({name = "rainbows:sky_brick", chance = 0.25, count = {1, 12}, y = {-64, 32768}})
dungeon_loot.register({name = "rainbows:cloud_brick", chance = 0.25, count = {1, 12}, y = {-64, 32768}})

walls.register("rainbows:rainbow_wall", "Rainbow Wall", "rainbows_rainbow.png",
		"rainbows:rainbow", default.node_sound_defaults())

minetest.override_item("rainbows:rainbow_wall", {
	light_source = default.LIGHT_MAX,
	groups = {cracky = 2, wall = 1}
})

stairs.register_stair_and_slab("rainbow", "rainbows:rainbow", {cracky = 2},
		{"rainbows_rainbow.png^[transformR90", "rainbows_rainbow.png^[transformR90", "rainbows_rainbow.png"},
		"Rainbow Stairs", "Rainbow Slab", default.node_sound_defaults())
stairs.register_stair_and_slab("rainbow_brick", "rainbows:rainbow_brick", {cracky = 3}, {"rainbows_rainbow_brick.png"},
		"Rainbow Brick Stairs", "Rainbow Brick Slab", default.node_sound_stone_defaults())
stairs.register_stair_and_slab("sky_brick", "rainbows:sky_brick", {cracky = 3}, {"rainbows_sky_brick.png"},
		"Sky Brick Stairs", "Sky Brick Slab", default.node_sound_stone_defaults())
stairs.register_stair_and_slab("cloud_brick", "rainbows:cloud_brick", {cracky = 3}, {"rainbows_cloud_brick.png"},
		"Cloud Brick Stairs", "Cloud Brick Slab", default.node_sound_stone_defaults())

minetest.override_item("stairs:stair_rainbow", {
	light_source = default.LIGHT_MAX
})

minetest.override_item("stairs:slab_rainbow", {
	light_source = default.LIGHT_MAX
})

if minetest.get_modpath("csh") then
	csh.from_node("rainbows:rainbow")
	csh.from_node("rainbows:rainbow_brick")
	csh.from_node("rainbows:sky_brick")
	csh.from_node("rainbows:cloud_brick")
end

if minetest.get_modpath("mcstair") then
	mcstair.add("stairs:stair_rainbow")
	mcstair.add("stairs:stair_rainbow_brick")
	mcstair.add("stairs:stair_sky_brick")
	mcstair.add("stairs:stair_cloud_brick")

	minetest.override_item("stairs:stair_rainbow_outer", {
		light_source = default.LIGHT_MAX
	})

	minetest.override_item("stairs:stair_rainbow_inner", {
		light_source = default.LIGHT_MAX
	})
end
