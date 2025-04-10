class_name Player
extends CharacterBody2D

@export var gravity = 100
@export var jump_speed = 100
@export var speed = 100

func _physics_process(delta: float) -> void:
	
	var direction = Input.get_axis("left", "right")
	velocity.x = speed * direction
	 
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_speed
	
	move_and_slide()
