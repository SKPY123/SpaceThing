extends Node2D


onready var StroidMed = preload("res://Scenes/CollisionObjects/meteorMedium.tscn")

# Declare member variables here. Examples:
export var SelectedSpawnAmount = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func Spawn(Here : Vector2):
	var amount = SelectedSpawnAmount
	while amount > 0:
		print("SpawnGroup1")
		var stroid = StroidMed.instance()
		stroid.global_position = Here
		get_node(".").add_child(stroid)
		amount -= 1
