extends Node

const  PlayerGroup: String = "player"
const SCROLL_SPEED: float = 120.0

var game_scene: PackedScene = preload("res://Scenes/Game/game_scene.tscn")
var main_scene: PackedScene = preload("res://Scenes/Main/main_scene.tscn")
var gameOver_scene: PackedScene = preload("res://Scenes/GameOver/game_over.tscn")

func loadGameScene() -> void:
	get_tree().change_scene_to_packed(game_scene)
		
func loadMainScene() -> void:
	get_tree().change_scene_to_packed(main_scene)	

func loadGameOverScene() -> void:
	get_tree().change_scene_to_packed(gameOver_scene)
