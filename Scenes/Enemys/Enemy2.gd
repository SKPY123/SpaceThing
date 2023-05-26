extends Node2D

onready var splosion = preload("res://Scenes/Effects/EnemySplosion.tscn")
onready var bullet = preload("res://Scenes/Enemys/EnemyBullet.tscn")

# Declare member variables here. Examples:
var HP = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var randanim = randi() % 2
	match randanim:
		0:
			$AnimationPlayer.play("Inst")
		1:
			$AnimationPlayer.play("Inst 2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func hit(DMG):
	HP -= DMG
	check_HP()


func befree():
	queue_free()


func check_HP():
	if HP <= 0:
		var inst = splosion.instance()
		inst.global_position = $EnemySprite.global_position
		get_parent().add_child(inst)
		queue_free()


func _on_Enemy_body_entered(body):
	if "Player" in body.name:
		body.hit(20)


func _on_Timer_timeout():
	var inst = bullet.instance()
	inst.global_position = $EnemySprite/Barrel.global_position
	get_parent().add_child(inst)


func _on_Enemy_hit(dmg):
	hit(dmg)
