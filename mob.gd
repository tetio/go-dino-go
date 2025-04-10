class_name Mob
extends CharacterBody2D

@export var gravity = 100

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
