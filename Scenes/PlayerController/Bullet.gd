extends Area2D


# Declare member variables here. Examples:
var speed = 20
var dmg = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	$Pew.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= speed


func _on_Bullet_area_entered(area):
	if "meteor" in area.name:
		area.hit(dmg)
		queue_free()
	if "Enemy" in area.name:
		area.hit(dmg)


func _on_Lifetime_timeout():
	queue_free()
