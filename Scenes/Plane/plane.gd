extends CharacterBody2D

const GRAVITY: float = 1500.0
const POWER: float = -500.0
@onready var plane_sprite: AnimatedSprite2D = $PlaneSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var engine_sound: AudioStreamPlayer2D = $EngineSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()
		
func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")

func die() -> void:
	engine_sound.stop()
	plane_sprite.stop()
	set_physics_process(false)
	SignalManager.onPlaneDied.emit()
