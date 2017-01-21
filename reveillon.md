# Reveillon Superstition Simulator (Brazilian Edition)

## Ideias principais :
- Side scroller onde um personagem pula ondas no reveillon
- O jogo mostra uma sequência de teclas para o jogador pressionar a cada onda
- O jogador tem um tempo X para pressionar as teclas
- Caso o jogador consiga pressionar todas dentro do tempo e na ordem certa, o medidor de pulo é completado e o personagem pula a onda
- Quando o número de ondas pulado for múltiplo de 7, o jogador ganha um bônus
	- Esses bônus serão coisas tipo "uva da sorte", lentilha, cueca branca

## Ideias para design :
- Fogos no fundo quando fizer um combo
- "Amanhecer" quando perder o jogo ("você ficou tentando a noite inteira e não conseguiu")
- Mostrar a personagem fazendo "cálculos" na cabeça enquanto aperta as teclas


## Requerimentos
- Usar 4 teclas do teclado e + 1 p/ pulo
- Gerar uma sequência aleatória com tamanho variado de acordo com o número da onda
- Aumentar dificuldade com o tempo

## Fluxograma do Jogo 

1. iniciar contador de ondas e contador de vidas
2. mostrar "get ready"
3. enquanto tiver vidas 
	a. gerar sequência de teclas
		- tamanho da sequencia proporcional ao contador de ondas
	b. mostrar sequencia:
		- entrando por cima como guitar hero
	c. a cada tecla pressionada 
		- corretamente
			- indicar que deu certo de alguma forma
			- completar um pouco mais o medidor de pulo
			- incrementar contador de ondas
			- mudar cor da tecla para mostrar que já foi ou apagar completamente
			- se o numero de ondas for múltiplo de 7, mostrar bônus ganhado
		- errada 
			- indicar que houve um erro 
			- diminuir contador de vidas
	d. se contador de vidas = 0 , encerra loop
4. Mostrar mensagem de fim de jogo e pontuação