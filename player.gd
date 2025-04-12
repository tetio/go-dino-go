class_name Player
extends CharacterBody2D

const MAX_JUMPS = 2


@export var gravity = 10000
@export var jump_speed = 200
@export var speed = 200

@onready var sprite : Sprite2D = $Sprite2D

var jump_stage = false

func _physics_process(delta: float) -> void:
	
	var direction = Input.get_axis("left", "right")
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
		
	velocity.x = speed * direction
	 
	if not is_on_floor():
		velocity.y += gravity * delta
	elif jump_stage:
		jump_stage = false
	
	if not jump_stage && Input.is_action_just_pressed("jump"): # 
		if not is_on_floor():
			jump_stage = true
		velocity.y = -jump_speed	
	
	move_and_slide()
