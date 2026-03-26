extends Area3D
class_name Coin


func _on_body_entered(body: Player) -> void:
	if body is not Player:
		return
	
	print('Collect coin')
	queue_free()
	
