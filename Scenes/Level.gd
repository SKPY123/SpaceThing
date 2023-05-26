extends Node2D

signal DeathScreen(TimeN)




# Declare member variables here. Examples:
export var Level = 0


var seconds_elapsed = 0
var minutes_elapsed = 0

var SpawnAmmount = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Background.speed += .001
	if $Background/PlayerControler.alive == true:
		$Background/PlayerControler/Player.moveSpeed += .001


func spawn(to_spawn, location):
	pass



#Stroids
func _on_TimerSpawn_timeout():
	var SelectedSpawnType = randi() % 3
	match SelectedSpawnType:
		0:
			$StroidTiny.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )
		1:
			$StroidMed.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )
		2:
			$StroidLarge.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )


#Boosts
func _on_TimerSpawnBoosts_timeout():
	var SelectedSpawnType = randi() % 2
	match SelectedSpawnType:
		0:
			$SpeedBoost.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )
		1:
			$HPBoost.Spawn( Vector2(rand_range(0, 600), rand_range($Background.global_position.y - 2048, $Background.global_position.y - (2048 * 2))) )


#Enemies
func _on_TimerSpawnEnemies_timeout():
	SpawnWave()



func SpawnWave():
	var SelectedSpawnType = randi() % 2
	match SelectedSpawnType:
		0:
			$Enemy1.Spawn( Vector2(0, $Background.global_position.y) )
		1:
			$Enemy2.Spawn( Vector2(0, $Background.global_position.y) )



func _on_SecondsElapsed_timeout():
	seconds_elapsed += 1


func _on_MinutesElapsed_timeout():
	minutes_elapsed += 1
	var SpawnCount = SpawnAmmount
	while SpawnCount != 0:
		SpawnWave()
		var SpawnBuffer = Timer.new()
		add_child(SpawnBuffer)
		SpawnBuffer.start(.2)
		yield(SpawnBuffer, "timeout")
		SpawnCount -= 1
	SpawnAmmount += 5


func _on_PlayerControler_Death():
	emit_signal("DeathScreen", seconds_elapsed)
	$CanvasLayer/LevelUI/DeathMenu.show()
	$CanvasLayer/LevelUI/DeathMenu/CenterContainer/Panel/MarginContainer/VBoxContainer/Yes.grab_focus()









