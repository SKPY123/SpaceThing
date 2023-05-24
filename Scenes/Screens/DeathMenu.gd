extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Yes_pressed():
	get_tree().reload_current_scene()





func _on_No_pressed():
	pass


func _on_Level_DeathScreen(TimeN):
	$CenterContainer/Panel/MarginContainer/VBoxContainer/HBoxContainer/TimeCount.text = str(TimeN)
