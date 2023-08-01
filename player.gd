extends CharacterBody2D

func _ready():
	pass
@export var speed = 400


signal  bullet_shot(bullet_scene, location)
var bullet_scene = preload("res://scenes/bullet.tscn")

@onready var muzzle = $Muzzle

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	rotation = get_global_mouse_position().angle_to_point(position)

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func shoot():
	bullet_shot.emit(bullet_scene, muzzle.global_position)
