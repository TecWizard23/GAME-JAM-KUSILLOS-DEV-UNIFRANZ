extends Node2D
#variables para el control
var izq:bool = false
var der:bool = false

# Called when the node enters the or the first time.scene tree f
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movCamara(izq,der)
	pass


func movCamara(izq:bool, der:bool):
	if izq && $Camara.position.x > -242:
		$Camara.position.x -= 20
	if der && $Camara.position.x < 225:
		$Camara.position.x += 20


func _on_izq_mouse_entered() -> void:
	izq = true	
	pass
	
func _on_izq_mouse_exited() -> void:
	izq = false
	pass 
	
func _on_der_mouse_entered() -> void:
	der = true
	pass 
	
func _on_der_mouse_exited() -> void:
	der = false
	pass 
	
