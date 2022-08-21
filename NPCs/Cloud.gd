extends Node2D

var timeout = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	if not timeout:
		$Sprite/RayCast2D.add_child(load("res://NPCs/Lightning.tscn").instance()) #Casting as a string and then loading as an instance (load a scene as a copy of a node)
		$Sprite/Timer.start()
		timeout = true
			

func _on_Timer_timeout():
	timeout = false
