# Exercise-02c-Color-Maze
Exercise for MSCH-C220, 15 September 2020

This exercise is designed to explore Physics Bodies, collision layers, scenes, and signals. I am hoping this gets you a few more steps closer to your project.

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-02c-Color-Maze. *Edit the LICENSE and replace BL-MSCH-C220-F20 with your full name.* Commit your changes.

Press the green "Code" button and select "Open in GitHub Desktop". Clone the repository to a Local Path on your computer (make sure the Local Path ends with "Exercise-02c-Color-Maze").

Open Godot. In the Project Manager, tap the "Import" button. Tap "Browse" and navigate to the repository folder. Select the project.godot file and tap "Open".

In the working area, you should see a collision shape that creates a fence around the window. There is a Godot Icon in the background and a few other container nodes in the Scene Panel. If you run the project (running the Game scene), you will see a colorful array of Godot icons, those are generated procedurally (we will discuss how this is done in class).

Select the Player_Area node; in the Inspector panel, Node2D->Transform, change Position.x and .y to 96.

Right-click on the Player_Area node, and select Add Child Node. Select KinematicBody2D, and rename it to Player.

Right-click on the Player node, and select Add Child Node. Select Sprite. From the Player folder in the FileSystem panel, drag the rocket image (player.png) to the Texture field in the Inspector panel. Under Node2D-Transform, change scale.x and .y to 0.148. It should now fit comfortably inside the second major square in the gride (from the top and left).

With the Sprite node selected, go to the toolbar, and select the Sprite menu item. Select Create CollisionPolygon2D Sibling, and then accept the default values. This should create a CollisionPolygon2D node as a child of Player.

Right-click on the Player node, and select Add Child Node. Select Timer, and rename it to Reload. In the Inspector panel, check One Shot, and set the Wait Time=2.

Open the Project Settings, and go to the Input Map. Create new Actions: left, right, red, yellow, and blue. Assign left = a, right = d, red = j, yellow = k, blue = l.

Select the Player node, and in the Inspector, go to PhysicsBody2D->Collision. Make sure the fourth square from the left (on the first row) is the only one highlighted.

Right-click on the Player node, and Attach Script. Create a new script (Player.gd) in the Player folder. Replace its contents with the following:

```
extends KinematicBody2D

var rot_amount = 1.5
var ready_to_shoot = true
onready var Ball = load("res://Ball/Ball.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		rotation_degrees -= rot_amount
	if Input.is_action_pressed("right"):
		rotation_degrees += rot_amount

	if Input.is_action_pressed("red"):
		shoot("red")
	if Input.is_action_pressed("yellow"):
		shoot("yellow")
	if Input.is_action_pressed("blue"):
		shoot("blue")


func shoot(color):
		if ready_to_shoot:
			var b = Ball.instance()
			b.color = color
			b.position = position
			b.position += Vector2(0, -40).rotated(rotation)
			get_parent().add_child(b)
			b.apply_central_impulse(Vector2(0,-100).rotated(rotation))
			ready_to_shoot = false
			$Reload.start()
```

Select the Reload node. In the Node panel (tab next to the Inspector panel), Signals, double-click on the timeout() signal. Connect it to the Player script (leave the Receiver Method `_on_Reload_timeout`) and then press Connect. You should now be brought back to the Player.gd script.

In the new `func _on_Reload_timeout():` method, add the following line:
```
func _on_Reload_timeout():
	ready_to_shoot = true
```

Test the game. You should be able to shoot red, yellow, or blue bullets that destroy the red, yellow, and blue tiles (respectively).

**Extra credit: how could you make this more like a real game? Make your additions, and describe them in the resulting README.md**

Quit Godot. In GitHub desktop, you should now see the updated files listed in the left panel. In the bottom of that panel, type a Summary message (something like "Completes the game development") and press the "Commit to master" button. On the right side of the top, black panel, you should see a button labeled "Push origin". Press that now.

If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-02c-Color-Maze) on Canvas.

The final state of the file should be as follows (replacing my information with yours):
```
# Exercise-02c-Color-Maze
Exercise for MSCH-C220, 15 September 2020

A simple game exploring physics bodies, collision layers, scenes, and signals

## Implementation
Built using Godot 3.2.2

## References
None

## Future Development
None

## Created by 
Jason Francis

```
