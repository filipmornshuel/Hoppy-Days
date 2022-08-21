extends Node2D

#Speed of the falling lightning
const SPEED = 300 

func _ready():
	set_as_toplevel(true) #don't inherite the information of the parent
	global_position = get_parent().global_position #Figuring out the global position of the parent (lightning)
	
#Not using move and slide (have to use delta directly)	
func _process(delta):
	position.y += SPEED	* delta
	manage_collision()
	
func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()	 #Returns a list of physicsBody2D
	for object in collider: #Creating a new variable object and checking whatever is in collider
		if object.name == "Player": #If its a player, hurt him
			get_tree().call_group("Gamestate", "hurt") 
		queue_free() #Giving the lightning free	
			
#Func for setting the lightnings free when the screen is left
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
