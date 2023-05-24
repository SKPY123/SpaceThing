extends KinematicBody2D


signal dead
signal hit


# Declare member variables here. Examples:
var ShipPos = Vector2()
var velocity = Vector2.ZERO
var shielded = false
export var HP = 100
export var moveSpeed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func on_hit():
	emit_signal("hit")
	check_HP()


func shield_engage():
	shielded = true
	$Shield.show()


func check_HP():
	if HP >= 90:
		$DMG1.hide()
		$DMG2.hide()
		$DMG3.hide()
	if HP < 90 and HP > 50:
		$DMG1.show()
		$DMG2.hide()
		$DMG3.hide()
	if HP < 50 and HP > 25:
		$DMG1.show()
		$DMG2.show()
		$DMG3.hide()
	if HP < 0 and HP > 25:
		$DMG1.show()
		$DMG2.show()
		$DMG3.show()
	if HP <= 0:
		emit_signal("dead")
	else:
		pass


func hit(amount):
	if !shielded:
		HP -= amount
		on_hit()
	else:
		HP = 100
		shielded = false
		$Shield.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide(velocity * moveSpeed, Vector2.ZERO)

func move(new_velocity : Vector2):
	velocity = new_velocity
