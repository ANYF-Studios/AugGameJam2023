extends CharacterBody2D


const SPEED = 50.0
var dir : Vector2

func _physics_process(_delta: float):
	velocity = dir * SPEED
	move_and_slide()
	
func _unhandled_input(_event: InputEvent):
	dir = Input.get_vector("Left", "Right", "", "")
	dir = dir.normalized()
