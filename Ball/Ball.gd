extends RigidBody2D

var color = "red"

func _ready():
	if color == "red":
		red()
	elif color == "yellow":
		yellow()
	elif color == "blue":
		blue()


func red():
	$Color.color = Color(1,0,0,1)
	set_collision_layer_bit(0,true)
	set_collision_layer_bit(1,false)
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,true)
	set_collision_mask_bit(1,false)
	set_collision_mask_bit(2,false)

func yellow():
	modulate = Color(1,1,0,1)
	set_collision_layer_bit(0,false)
	set_collision_layer_bit(1,true)
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,false)
	set_collision_mask_bit(1,true)
	set_collision_mask_bit(2,false)

func blue():
	modulate = Color(0,0,1,1)
	set_collision_layer_bit(0,false)
	set_collision_layer_bit(1,false)
	set_collision_layer_bit(2,true)
	set_collision_mask_bit(0,false)
	set_collision_mask_bit(1,false)
	set_collision_mask_bit(2,true)
