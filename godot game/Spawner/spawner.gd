extends AnimatedSprite2D

var enemy_scene = preload("res://Enemy/enemy_1.tscn")
var pos = position

func _ready():
	$Timer.start()
	pass 

func _on_timer_timeout():
	var ene = enemy_scene.instantiate()
	ene.position = -pos
	get_parent().add_child(ene)	
	if get_parent().get_node("Player").alive ==0 :
		$Timer.stop()
	 
	pass

func _process(delta):
	#print(position)
	play("default")
	pass
