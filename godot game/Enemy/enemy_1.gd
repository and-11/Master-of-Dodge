extends CharacterBody2D


const SPEED = 5.0
var player_position 
var target_position
var alive =1
@onready var player= get_parent().get_node("Player")
@onready var ap = $AnimatedSprite2D

func _physics_process(delta):
	#print(position)
	if alive :
		ap.play("Idle")
		player_position=player.position
		target_position = (player_position-position).normalized()*SPEED
		velocity=Vector2(target_position*SPEED)
		move_and_slide()
		

func _on_detection_area_body_entered(body):
	pass

func _on_detection_area_body_exited(body):
	pass

func _on_kill_detect_body_entered(body):
	Global.Score += 1
	alive=0
	# await ap.play("dth").animation_finished
	self.queue_free()
	#test.visible = true
