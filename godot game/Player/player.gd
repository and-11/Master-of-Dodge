extends CharacterBody2D


var SPEED = 50.0
var alive = 1 
#var death_animation_played = false
@onready var ap = $Animations
@onready var exp = $Explosion
var available_atack = true
var available_dodge = true 
var killable = 1

func _physics_process(delta):
	$Range/ExplosionColision.disabled  = true
	$ColorRect2.visible = false
	$ColorRect.rotation = $ColorRect.rotation+0.4
	if alive :
		$ColorRect2.visible = true	
		$ColorRect2.rotation = $ColorRect.rotation+0.1 
		#print (position)
		var directionx = Input.get_axis("move_left", "move_right")
		if directionx:
			velocity.x = directionx * SPEED
		if directionx!=0 :
			ap.flip_h = (directionx==-1)
		var directiony = Input.get_axis("move_up", "move_down")
		if directiony:
			velocity.y = directiony * SPEED
		move_and_slide()
		velocity.x=0;
		velocity.y=0;
		update_animations(directionx,directiony)
			
		if Input.is_action_pressed("atack") and available_atack :
			available_atack = false
			$Range/ExplosionColision.disabled  = false 
			$AtackTimer.start()
			ap.play("Atack")
			exp.play("Atack")
		if Input.is_action_pressed("dodge") and available_dodge :
			available_dodge = false
			$DodgeTimer.start()
			$Detectare_killZOne/CollisionShape2D.disabled = true 
			print("MUie")
			SPEED *=4
			while( ap.rotation != 3 ):
				ap.rotation = ap.rotation+1
				await get_tree(). create_timer(0.1).timeout 
			ap.rotation = 0
			SPEED/=4
			$Detectare_killZOne/CollisionShape2D.disabled = false
			
			
func update_animations(directionx,directiony):
	if directionx==0 and directiony==0:
		ap.play("Idle")
	else :
		ap.play("Run")


func _on_detectare_kill_z_one_body_entered(body):
	if killable :
		ap.play("Death")		
		alive = 0
		killable=0
		get_parent().get_node("foreground").visible = true

func _on_timer_timeout():
	available_atack = true 
	pass # Replace with function body.


func _on_dodge_timer_timeout():
	available_dodge = true 
	pass
