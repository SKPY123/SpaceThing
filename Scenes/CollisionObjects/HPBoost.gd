extends Area2D


signal HPBoost(Boost)




var colliding = false

# Declare member variables here. Examples:
export var HPUP = 25


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Kill()


func Kill():
	pass



func _on_AttackSpeedBoost_body_entered(body):
	if "Player" in body.name and !colliding:
		Player_Found(body)


func Player_Found(body):
	if !is_connected("HPBoost", body.get_parent() , "HPBoost" ):
		connect("HPBoost", body.get_parent() , "HPBoost" )
		emit_signal("HPBoost", HPUP)
		disconnect("HPBoost", body.get_parent() , "HPBoost")
		colliding = true
		return
	else:
		queue_free()
	
