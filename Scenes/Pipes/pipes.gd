extends Node2D

const SCROLL_SPEED: float = 120.0
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SCROLL_SPEED * delta
	
func _onScreenExited():
	queue_free()

func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.PlayerGroup): 
		score_sound.play()
		ScoreManager.incrementScore()
