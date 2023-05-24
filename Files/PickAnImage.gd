extends Node


# Declare member variables here. Examples:
var blue_1 = load("res://Assets/Blue Nebula/Blue Nebula 1 - 1024x1024.png")
var blue_2 = load("res://Assets/Blue Nebula/Blue Nebula 2 - 1024x1024.png")
var blue_3 = load("res://Assets/Blue Nebula/Blue Nebula 3 - 1024x1024.png")
var blue_4 = load("res://Assets/Blue Nebula/Blue Nebula 4 - 1024x1024.png")
var blue_5 = load("res://Assets/Blue Nebula/Blue Nebula 5 - 1024x1024.png")
var blue_6 = load("res://Assets/Blue Nebula/Blue Nebula 6 - 1024x1024.png")
var blue_7 = load("res://Assets/Blue Nebula/Blue Nebula 7 - 1024x1024.png")
var blue_8 = load("res://Assets/Blue Nebula/Blue Nebula 8 - 1024x1024.png")
















# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func select_random_blue():
	var randomnum = randi() % 8
	match randomnum:
		0:
			return blue_1
		1:
			return blue_2
		2:
			return blue_3
		3:
			return blue_4
		4:
			return blue_5
		5:
			return blue_6
		6:
			return blue_7
		7:
			return blue_8
