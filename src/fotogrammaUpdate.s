!------------------------------------!
!Inserimento di mediani in fotogramma!
!------------------------------------!
fotogrammiUD:
	PUSH BP
	MOV BP, SP

	MOV BX, 0

	MOV SI, 0
	MOV AX, varSM(SI)

	SUBB AL, 48

	CMPB AL, 4					!Controllo se non e' stato azionata la quarta opzione del Menu Principale
	JNE aggFot

	MOVB BL, AL					!Salvo in BX il valore

aggFot:
	MOV AX, 0
	MOV CX, -1
	MOV DI, mediani

	REPNZ SCASB					!Conto di quanti caratteri e' formato mediani, ossia quanti pixel mediani contiene

	MOV SI, mediani
	MOV DI, fotogramma

	PUSH mediani					!Metto il contenuto di mediani in fotogramma
	PUSH strForm
	PUSH fotogramma
	PUSH _SPRINTF
	SYS
	ADD SP, 8

	CMPB BL, 4					!Se l'Automatizza e' stata invocata, riaggiorno la variabile varSM
	JNE fineAgg

	PUSH 4 						!Salvo l'opzione del Menu Automatizza per il controllo a fine Filtra
	PUSH numFormInt
	PUSH varSM
	PUSH _SPRINTF
	SYS
	ADD SP, 8

fineAgg:
	POP BP
	RET
