extends Area2D

onready var Splosion = preload("res://Scenes/Effects/Splosion.tscn")
export var damage = 50
export var HP = 100

var alive = true




# Called when the node enters the scene tree for the first time.
func _ready():
	_select()


func hit(dmg):
	HP -= dmg
	if HP <= 0:
		alive = false
	check_alive()


func check_alive():
	if alive:
		pass
	else:
		var inst = Splosion.instance()
		inst.global_position = global_position
		inst.get_node("Sound").pitch_scale = 1.5
		inst.get_node("CPUParticles2D").lifetime = .2
		inst.get_node("CPUParticles2D").amount = 10
		get_parent().add_child(inst)
		queue_free()


func _select():
	var selected = randi() % 4
	match selected:
		0:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorBrown_med1.png")
		1:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorBrown_med3.png")
		2:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorGrey_med1.png")
		3:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorGrey_med2.png")
		_:
			print("NotFound")



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
