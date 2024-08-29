extends Control

@onready var hs_score: Label = $MC/HSScore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hs_score.text = str(ScoreManager._highScore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("fly"):
		GameManager.loadGameScene()
