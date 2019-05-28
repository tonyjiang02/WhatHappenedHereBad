extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal talk_muley
signal enter_house
var nextToHouse = false
var nextToMuley = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	_get_Message()
	
func _input(e):
	if Input.is_key_pressed(KEY_F):
		if nextToHouse:
			emit_signal("enter_house")
			print("enter house")
		if nextToMuley:
			emit_signal("talk_muley")
			print("talk_muley")
func _get_Message():
	var distanceToMuley = $MuleyGraves.position.distance_to($Player.position)
	var distanceToHouse = $DustBowlHouse.position.distance_to($Player.position)
	if (distanceToHouse < 100):
		$Label.text = "PRESS F TO ENTER HOUSE"
		nextToHouse = true
		nextToMuley = false
	if (distanceToMuley < 100):
		$Label.text = "PRESS F TO TALK TO MULEY"
		nextToHouse = false
		nextToMuley = true
	