!---------------------------------------------------------!
!Tale funzione permette di stampare a video lo stato della!
!finestra d'osservazione (lo stack) quando viene chiamata.!
!---------------------------------------------------------!
STAMPA:
	PUSH BP						
	MOV BP, SP

	ADD BP, 4
	MOV CX, (BP)

	SUBB CL, 48
	MOVB CH, CL

	ADD BP, 2

	MOVB CL, 1

ciclo:
	CMPB CL, CH
	JG esciciclo
	MOV BX, (BP)(SI)
	PUSH BX
	PUSH numAcapo
	PUSH _PRINTF
	SYS
	ADD SP, 6
	ADD SI, 2
	INCB CL
	JMP ciclo
	

esciciclo:
	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	POP BP
	RET
