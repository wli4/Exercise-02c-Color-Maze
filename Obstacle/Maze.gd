extends Node2D

var grid = 64
var Obstacle = preload("res://Obstacle/Obstacle.tscn")

func _ready():
	var width = floor(get_viewport().size.x / grid)
	var height = floor(get_viewport().size.y / grid)
	for x in range(width):
		for y in range(height):
			if (x != 0 or y != 0) and (x < width-1 or y < height-1):
				var o = Obstacle.instance()
				o.position.x = x*grid
				o.position.y = y*grid
				add_child(o)
