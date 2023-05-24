extends Node2D

signal DeathScreen(TimeN)




# Declare member variables here. Examples:
export var Level = 0


var seconds_elapsed = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn(to_spawn, location):
	pass



func _on_TimerSpawn_timeout():
	var SelectedSpawnType = randi() % 3
	match SelectedSpawnType:
		0:
			$StroidTiny.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )
		1:
			$StroidMed.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )
		2:
			$StroidLarge.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )


func _on_TimerSpawnBoosts_timeout():
	var SelectedSpawnType = randi() % 2
	match SelectedSpawnType:
		0:
			$SpeedBoost.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )
		1:
			$HPBoost.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )


func _on_TimerSpawnEnemies_timeout():
	var SelectedSpawnType = randi() % 1
	match SelectedSpawnType:
		0:
			$Enemy1.Spawn( Vector2(0, $Background.global_position.y) )


func _on_SecondsElapsed_timeout():
	seconds_elapsed += 1
	if seconds_elapsed:
		pass


func _on_PlayerControler_Death():
	emit_signal("DeathScreen", seconds_elapsed)
	$CanvasLayer/LevelUI/DeathMenu.show()
	$CanvasLayer/LevelUI/DeathMenu/CenterContainer/Panel/MarginContainer/VBoxContainer/Yes.grab_focus()






