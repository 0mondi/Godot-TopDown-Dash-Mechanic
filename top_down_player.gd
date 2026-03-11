extends CharacterBody2D

const BASE_SPEED = 200.0
const DASH_MULTIPLIER = 3.0
var current_speed = BASE_SPEED
var is_dashing = false

func _physics_process(_delta):
	# Get 8-way movement vector and normalize it to prevent fast diagonal movement
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction.normalized() * current_speed
	
	if Input.is_action_just_pressed("dash") and not is_dashing:
		start_dash()
		
	move_and_slide()

func start_dash():
	is_dashing = true
	current_speed = BASE_SPEED * DASH_MULTIPLIER
	await get_tree().create_timer(0.2).timeout # Dash lasts for 0.2 seconds
	current_speed = BASE_SPEED
	is_dashing = false
