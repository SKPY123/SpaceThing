extends Node2D


# Declare member variables here. Examples:
export var speed = 10
onready var ship = get_node("Ship")

var backgroundIMG = PickAnImage.select_random_blue()

# Called when the node enters the scene tree for the first time.
func _ready():
	$ParallaxBackground/ParallaxLayer/BackgroundTexture.texture = backgroundIMG


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= speed * delta
	
	
	
