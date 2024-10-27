extends CharacterBody2D

const velocidade = 100
var pos_atual = "none"

func _ready():
	$AnimatedSprite2D.play("parado_frente")

# _physics_process() -> nativa godot
func _physics_process(delta):
	movimentacao_jogador(delta)
#direita,esquerda,baixo,cima -> deve seguir essa ordem
func movimentacao_jogador(delta):
	if Input.is_action_pressed("ui_right"):
		pos_atual = "right"
		rodar_animacao(1)
		velocity.x = velocidade
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		pos_atual = "left"
		rodar_animacao(2)
		velocity.x = -velocidade
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		pos_atual = "down"
		rodar_animacao(3)
		velocity.x = 0
		velocity.y = velocidade
	elif Input.is_action_pressed("ui_up"):
		pos_atual = "up"
		rodar_animacao(4)
		velocity.x = 0
		velocity.y = -velocidade
	else:
		velocity.x = 0
		velocity.y =  0
	
	#move_and_slide() -> nativa godot
	move_and_slide()

func rodar_animacao(movimento):
	var dir = pos_atual
	var animacao = $AnimatedSprite2D
	
	if dir == "right":
		animacao.flip_h = false
		if movimento == 1:
			animacao.play("andando_lado")
		elif movimento == 0:
			animacao.play("parado_lado")
	
	elif dir == "left":
		animacao.flip_h = true
		if movimento == 2:
			animacao.play("andando_lado")
		elif movimento == 0:
			animacao.play("parado_lado")
			
	elif dir == "down":
		animacao.flip_h = false
		if movimento == 3:
			animacao.play("andando_frente")
		elif movimento == 0:
			animacao.play("parado_frente")
	
	elif dir == "up":
		animacao.flip_h = false
		if movimento == 4:
			animacao.play("andando_costas")
		elif movimento == 0:
			animacao.play("parado_costas")
