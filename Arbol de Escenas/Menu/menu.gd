extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hola mundo")
	$estatica.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_new_game_mouse_entered() -> void:
	$Set.show()
func _on_new_game_mouse_exited() -> void:
	$Set.hide()
func _on_continue_mouse_entered() -> void:
	$Set2.show()
func _on_continue_mouse_exited() -> void:
	$Set2.hide()




func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Arbol de Escenas/Menu/menu_carga.tscn")


func _on_tiempo_timeout() -> void:
	$Animaciones.play("movimiento")
