extends Node2D

@onready var player_spawn_pos = $PlayerSpawnPos
@onready var bullet_container = $BulletContainer
var player = null
# Called when the node enters the scene tree for the first time.



func _ready():
	player = get_tree().get_first_node_in_group("player")
	player.bullet_shot.connect(_on_player_bullet_shot)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()



func _on_player_bullet_shot(bullet_scene, location):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = location
	bullet_container.add_child(bullet)
