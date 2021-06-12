extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

func _ready():
	$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction 
	#Changes raycast2D to either right or left of the enemy

func _physics_process(delta):
	
	if is_on_wall() or not $FloorChecker.is_colliding() and is_on_floor():
		direction *= -1
		$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction 
		Timer
		
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
	
func _on_TopChecker_body_entered(body):
	speed = 0


func _on_SidesChecker_body_entered(body: Node) -> void:
	print ("g")
