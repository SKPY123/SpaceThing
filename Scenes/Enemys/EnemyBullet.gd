extends Area2D


# Declare member variables here. Examples:
var speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	$pew.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += speed


func _on_EnemyBullet_body_entered(body):
	if "Player" in body.name:
		body.hit(10)
		queue_free()
	else:
		pass


func _on_Timer_timeout():
	queue_free()
