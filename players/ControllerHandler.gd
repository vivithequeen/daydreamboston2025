extends Node
class_name ControllerHandlerComp

@export var deviceID: int = 0
@export var actor: CharacterBody2D = self.get_parent()
@export var interactHandler: InteractHandlerComp

@onready var inputs = {
	"up": "up_c",
	"down": "down_c", 
	"right": "right_c", 
	"left": "left_c",
	"jump": "jump_c",
	"interact": "inter_c"
}

var SPEED = 400
var JUMP_VELOCITY = -600.0
var numArms := 2
var numLegs := 2

func up():
	print("ppee")
	actor.velocity.y = -300

func _ready() -> void:
	for key in inputs.keys():
		inputs[key] += str(deviceID+1)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not actor.is_on_floor():
		actor.velocity += actor.get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed(inputs["jump"]) and actor.is_on_floor():
		actor.velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(inputs["left"], inputs["right"])
	if direction:
		actor.velocity.x = direction * SPEED
	else:
		actor.velocity.x = move_toward(actor.velocity.x, 0, SPEED)
	
	
	if Input.is_action_just_pressed(inputs["interact"]):
		interactHandler.use_interactable()
	
	actor.move_and_slide()


func change_arms(x: int) -> void:
	numArms = x

func change_legs(x: int) -> void:
	numLegs = x
	match x:
		0:
			SPEED = 10
			JUMP_VELOCITY = 0.0
		1:
			SPEED = 100
			JUMP_VELOCITY = -150.0
		2:
			SPEED = 200
			JUMP_VELOCITY = -300.0

func get_movement() -> Vector2:
	return actor.velocity
