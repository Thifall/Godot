extends Control

@onready var space_label: Label = $SpaceLabel
@onready var go_label: Label = $GOLabel
@onready var timer: Timer = $Timer
@onready var crash_sound: AudioStreamPlayer = $CrashSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.onPlaneDied.connect(_on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fly") && space_label.visible:
		GameManager.loadMainScene()
	
func _on_plane_died() -> void:
	crash_sound.play()
	show()
	timer.start()

func _on_timer_timeout() -> void:
	go_label.hide()
	space_label.show()
