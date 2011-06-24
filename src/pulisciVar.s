pulizia:
	PUSH BP
	MOV BP, SP

	MOV SI, null
	MOV DI, fotogramma
	MOV CX, -1

	REP MOVSB

	POP BP
	RET
