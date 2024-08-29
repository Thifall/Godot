extends Node2D

@export var pipes_scene: PackedScene
@onready var pipes_holder = $PipesHolder
@onready var spawn_upper = $SpawnUpper
@onready var spawn_lower = $SpawnLower
@onready var pipe_spawn_timer = $PipeSpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.onPlaneDied.connect(_on_plane_died)
	ScoreManager.setScore(0)
	spawnPipes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnPipes() -> void:
	var newPipes = pipes_scene.instantiate()
	var y_spawn_pos = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	newPipes.position = Vector2(spawn_upper.position.x, y_spawn_pos)
	pipes_holder.add_child(newPipes)

func stopPipes() -> void:
	pipe_spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_pipe_spawn_timer_timeout():
	spawnPipes()

func _on_plane_died():
	stopPipes()
