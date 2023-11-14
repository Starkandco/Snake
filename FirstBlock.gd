extends CharacterBody2D

var movement = Vector2(24, 0)

var movementValue = 24

var tick = 0

func _input(event):
	if Input.is_action_pressed("left") and movement.x == 0:
		movement = Vector2(-movementValue, 0)
	elif Input.is_action_pressed("right") and movement.x == 0:
		movement = Vector2(movementValue, 0)
	if Input.is_action_pressed("up") and movement.y == 0:
		movement = Vector2(0, -movementValue)
	if Input.is_action_pressed("down") and movement.y == 0:
		movement = Vector2(0, movementValue)

func _process(_delta):
	tick += 1
	if tick % 10 == 0:
		var last_pos
		for b in range($"..".get_children().size() - 1, -1, -1):
			if b != 0:
				$"..".get_children()[b].position = $"..".get_children()[b - 1].position
			else:
				var test_okay = false
				var collision = $"..".get_children()[b].move_and_collide(movement)
				if collision:
					if collision.get_collider().is_in_group("Food"):
						eat(collision.get_collider())
					elif collision.get_collider().is_in_group("Wall"):
						get_parent().queue_free()

func eat(body):
	for c in $"..".get_children():
		if c.is_in_group("LastBlock"):
			var newBlock = c.duplicate()
			c.remove_from_group("LastBlock")
			newBlock.add_to_group("LastBlock")
			$"..".add_child(newBlock)
			body.queue_free()

