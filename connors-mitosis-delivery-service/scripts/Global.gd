extends Node

var watermelon_upgrade_cost = 120
var kiwi_upgrade_cost = 800
var banana_upgrade_cost = 2400
var orange_upgrade_cost = 12000

var giblits: int = 0
var unlocked_fruit = ["watermelon"]
var max_watermelon = 999999999999
var max_kiwi = 8
var max_banana = 8
var request = null



func get_random_unlocked():
	if unlocked_fruit.is_empty():
		return null
	var index = randi() % unlocked_fruit.size()
	return unlocked_fruit[index]
