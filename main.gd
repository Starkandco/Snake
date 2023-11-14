extends Node2D

@export var snake_scene: PackedScene
@export var food_scene: PackedScene

var snake
var foodTick = 0

func _input(event):
	if !is_instance_valid(snake) and Input.is_action_pressed("space"):
		snake = snake_scene.instantiate()
		$OnScreenElements.add_child(snake)

func _on_timer_timeout():
	var food = food_scene.instantiate()
	var continue_loop = true
	var space_used
	var test_vector
	while continue_loop:
		test_vector = Vector2(randi_range(0, 48) * 24, randi_range(0, 27) * 24)
		space_used = false
		for c in $OnScreenElements.get_children():
			if c.is_in_group("SnakeNode"):
				for c2 in c.get_children():
					if c2.position == test_vector:
						space_used = true
			if c.position == test_vector:
				space_used = true
		if !space_used:
			continue_loop = false
	food.position = test_vector
	$OnScreenElements.add_child(food)
	
