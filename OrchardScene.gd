extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nextToProtester = false
var nextToEntrance = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.pos2:
		$Player.position = global.pos2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	_get_message()
	global.pos2 = $Player.position
func _get_message():
	var distanceToProtester = $Sprite.position.distance_to($Player.position)
	var distanceToEntrance = $Position2D.position.distance_to($Player.position)
	if (distanceToProtester < 100):
		$Label.text = "PRESS F TO TALK TO MAN"
		nextToProtester = true
		nextToEntrance = false
	elif (distanceToEntrance < 100):
		$Label.text = "PRESS F TO ENTER THE ORCHARD"
		nextToProtester = false
		nextToEntrance = true
	else:
		$Label.text = ""
func _input(e):
	if Input.is_key_pressed(KEY_F):
		pass