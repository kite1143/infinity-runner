extends Control
class_name SwipeDetection

var length: int = 100
var startPos: Vector2
var curPos: Vector2
var swiping: bool = false

signal swipe_left
signal swipe_right
signal swipe_up
signal swipe_down

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed('press'):
		if !swiping:
			swiping = true
			startPos = get_global_mouse_position()
	if Input.is_action_pressed('press'):
		if swiping:
			curPos = get_global_mouse_position()
			if startPos.distance_to(curPos) > length:
				if abs(startPos.y-curPos.y) < abs(startPos.x-curPos.x):
					if startPos.x < curPos.x:
						swipe_right.emit()
					else:
						swipe_left.emit()
					swiping = false
				else:
					if startPos.y < curPos.y:
						swipe_down.emit()
					else:
						swipe_up.emit()
					swiping = false
	else:
		swiping = false
