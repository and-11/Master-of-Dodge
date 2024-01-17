extends Node

@onready var ht = $"How to"

func _ready():
	pass 
func _process(delta):
	$AnimatedSprite2D.play("default")
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/fight_room.tscn")
	pass 

func _on_help_pressed():
	ht.visible = !ht.visible
	$AnimatedSprite2D.visible = !$AnimatedSprite2D.visible	
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()	
	pass # Replace with function body.
