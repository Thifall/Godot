extends Control

@onready var score_label = $MarginContainer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.onScoreUpdated.connect(onScoreUpdated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func onScoreUpdated():
	score_label.text = str(ScoreManager.getScore())
