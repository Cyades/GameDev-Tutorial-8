extends CharacterBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 400.0
const DECELERATION = 400.0

@export var speed: float = 400.0
@export var gravity: int = 1400
@export var jump_speed: int = -600

@onready var animator = self.get_node("Animator")
@onready var sprite = self.get_node("Sprite2D")
@onready var particle = $GPUParticles2D


func get_input():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if Input.is_action_pressed("right"):
		sprite.flip_h = false
		velocity.x = lerp(velocity.x, speed, ACCELERATION / speed)  ## naik perlahan (kanan)
	elif Input.is_action_pressed("left"):
		sprite.flip_h = true
		velocity.x = lerp(velocity.x, -speed, ACCELERATION / speed)  ## naik perlahan (kiri)
	else:
		velocity.x = lerp(velocity.x, 0.0, DECELERATION / speed)  ## turun perlahan


func _physics_process(delta):
	velocity.y += delta * gravity
	get_input()
	set_particles()
	set_velocity(velocity)
	set_up_direction(UP)
	move_and_slide()
	velocity = velocity


func _process(_delta):
	if velocity.y != 0:
		animator.play("Jump")
	elif velocity.x != 0:
		animator.play("Walk")
	else:
		animator.play("Idle")

func set_particles():
	if abs(velocity.x) == speed and is_on_floor():
		particle.set_emitting(true)
	else:
		particle.set_emitting(false)
