extends Area2D

onready var Splosion = preload("res://Scenes/Effects/Splosion.tscn")
export var damage = 50
export var HP = 100



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_select()


func hit(dmg):
	HP -= dmg
	check_alive()


func check_alive():
	if HP <= 0:
		var inst = Splosion.instance()
		inst.global_position = global_position
		get_parent().add_child(inst)
		inst.get_node("Sound").pitch_scale = 2
		inst.get_node("Sound").volume_db = -12
		inst.get_node("CPUParticles2D").lifetime = .1
		inst.get_node("CPUParticles2D").amount = 3
		queue_free()
	else:
		pass


func _select():
	match randi() % 4:
		0:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorBrown_tiny1.png")
		1:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorBrown_tiny2.png")
		2:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorGrey_tiny1.png")
		3:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorGrey_tiny2.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_meteorTiny_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if "Player" in body.name:
		body.hit(damage)
		HP = 0
		check_alive()
	else:
		HP = 0
		check_alive()
