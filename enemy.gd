extends CharacterBody2D


const SPEED = 200

var target: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	target = get_parent().get_node("Player")

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * SPEED
	
	move_and_slide()
	

func make_path() -> void:
	nav_agent.target_position = target.global_position

func _on_timer_timeout():
	make_path()


func _on_area_2d_area_entered(_area):
	queue_free()
