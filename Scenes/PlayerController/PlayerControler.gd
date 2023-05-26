extends Node2D


onready var bullet = preload("res://Scenes/PlayerController/Bullet.tscn")
onready var splosion = preload("res://Scenes/Effects/PlayerSplosion.tscn")

var alive = true
var shielded = false

signal Death
signal moveGivenDir(velocity)


# Declare member variables here. Examples:
var moveVector = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	input_control()
	get_HP_value()
	$CanvasLayer/PlayerUI/BoostBar.value = $SpeedBoost.time_left



func _physics_process(delta):
	pass



func get_HP_value():
	if alive:
		$CanvasLayer/PlayerUI/TextureProgress_HP.value = $Player.HP
	else:
		$CanvasLayer/PlayerUI/TextureProgress_HP.value = 0


func HPBoost(HPUP):
	if $Player.HP < 100:
		$Player/HPUP.play(0.0)
		$Player.HP += HPUP
		$Player.check_HP()
	else:
		$Player/ShieldSound.play()
		$Player.shield_engage()
		$Player.check_HP()
	print("PICKUPHP")



func input_control():
	var velocity
	moveVector.x = -Input.get_action_strength("moveLeft") + Input.get_action_strength("moveRight")
	moveVector.y = -Input.get_action_strength("moveUp") + Input.get_action_strength("moveDown")
	emit_signal("moveGivenDir", moveVector)




func SpeedBoost():
	$Player/SpeedBoostSound.play(0.0)
	$SpeedBoost.start($SpeedBoost.wait_time)
	$AttackTimer.wait_time = .1


func _on_AttackTimer_timeout():
	if alive:
		var instBullet = bullet.instance()
		instBullet.global_position = $Player/Barrel_1.global_position
		get_tree().root.get_node("Level").add_child(instBullet)
	else:
		pass


func _on_SpeedBoost_timeout():
	$AttackTimer.wait_time = .25


func _on_Player_dead():
	$DeathTimer.start()
	var inst = splosion.instance()
	inst.position = $Player.position
	add_child(inst)
	$Player.queue_free()
	alive = false


func _on_Player_hit():
	$Player/HitSound.play(0.0)
	$AnimationPlayer.play("Hit")


func _on_DeathTimer_timeout():
	emit_signal("Death")
