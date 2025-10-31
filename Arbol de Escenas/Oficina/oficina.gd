extends Node2D
#variables para el control
var izq:bool = false
var der:bool = false
var puertaizq:bool = false
var puertader:bool = false
#lucces
var luzIzq:bool = false
var luzDer:bool = false

# Called when the node enters the or the first time.scene tree f
func _ready() -> void:
	$Animaciones/Ventilador.play("default")
	$Audios/llamada.play()
	$Audios/ambiente.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movCamara(izq,der)
	print($Camara/Camera2D.position)
	puertas()
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
	



func _on_botonizq_pressed() -> void:
	$Audios/puerta.play()
	if not puertaizq:
		$botones/btnizq.play("puerta")
		$Animaciones/puertaIzq.play("default")
		puertaizq=true
	else:
		$botones/btnizq.play("apagado")
		$Animaciones/puertaIzq.play_backwards("default")
		puertaizq=false
	
	pass 

func _on_botonder_pressed() -> void:
	$Audios/puerta.play()
	if not puertader:
		$botones/btnder.play("puerta")
		$Animaciones/purtaDer.play("default")
		puertader=true
	else:
		$botones/btnder.play("apagado")
		$Animaciones/purtaDer.play_backwards("default")
		puertader=false
		
	pass 


func _on_luz_izq_pressed() -> void:
	if not luzIzq:
		luzIzq = true
	else:
		luzIzq = false
		$Animaciones/Oficina.play("oficina")
	pass 

func _on_luz_der_pressed() -> void:
	if not luzDer:
		luzDer = true 
	else:
		luzDer = false
		$Animaciones/Oficina.play("oficina")
	pass
	
func puertas() -> void:
	#izquierda
	if luzIzq and puertaizq:
		$botones/btnizq.play("ambos")
		$Animaciones/Oficina.play("luzIzq")
		await get_tree().create_timer(.5).timeout 
		$Animaciones/Oficina.stop()
	elif luzIzq:
		$botones/btnizq.play("luz")
		$Animaciones/Oficina.play("luzIzq")
		await get_tree().create_timer(.5).timeout 
		$Animaciones/Oficina.stop()
	elif puertaizq:
		$botones/btnizq.play("puerta")
		
	#der
	if luzDer and puertader:
		$botones/btnder.play("ambos")
		$Animaciones/Oficina.play("luzDer")
		await get_tree().create_timer(.5).timeout
		$Animaciones/Oficina.stop()
	elif luzDer:
		$botones/btnder.play("luz")
		$Animaciones/Oficina.play("luzDer")
		await get_tree().create_timer(.5).timeout
		$Animaciones/Oficina.stop()
	elif puertader:
		$botones/btnder.play("puerta")
