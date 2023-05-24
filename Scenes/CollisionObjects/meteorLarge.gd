extends Area2D


onready var Splosion = preload("res://Scenes/Effects/Splosion.tscn")


export var damage = 50
export var HP = 100

var alive = true





# Called when the node enters the scene tree for the first time.
func _ready():
	_select()


func _select():
	var selected = randi() % 5
	match selected:
		0:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorGrey_big1.png")
		1:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorGrey_big3.png")
		2:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorGrey_big4.png")
		3:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorBrown_big1.png")
		4:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorBrown_big3.png")
		5:
			$Sprite.texture = load("res://Assets/Kenney Space Shooter/PNG/Meteors/meteorBrown_big4.png")
		_:
			print("NotFound")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
		get_parent().add_child(inst)
		queue_free()


func _on_meteorTiny_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if "Player" in body.name:
		body.hit(damage)
		alive = false
		check_alive()
	else:
		alive = false
		check_alive()
