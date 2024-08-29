extends Node

var _score: int = 0
var _highScore: int = 0

func getScore() -> int:
	return _score
	
func getHighScore() -> int:
	return _highScore
	
func setScore(s: int) -> void:
	_score = s
	print("set score: ", _score)
	SignalManager.onScoreUpdated.emit()
	if(_score > _highScore):
		_highScore = _score
		print("New  Highscore!!", _highScore)
		
func incrementScore() -> void:
	setScore(_score + 1)
