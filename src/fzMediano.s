!-------------------------------------------------------------!
!Calcolo del mediano all'interno della finestra d'osservazione!
!-------------------------------------------------------------!
MEDIANO:
	PUSH BP
	MOV BP, SP
	ADD BP, 4					!Faccio in modo che BP punti a DIM, sullo stack

	MOV AX, (BP)					!Prendo DIM sullo stack e lo metto in AX

	SUBB AL, 48					!Lo trasformo in numero intero e lo sposto in AH
	MOVB AH, AL

	ADD BP, 6					!Torno al primo elemento sullo stack
	
	MOVB AL, 0					!Sono gli indici per i cicli
	MOVB BL, 0

	MOVB BH, AH
	DECB BH						!DIM-1
	MOV CX, 0
	MOV DX, 2

min1:   
	MOV SI, 0					!Sono gli indici per trovare i pixel sullo stack
	MOV DI, 2	
	INCB BL						!Ciclo esterno
	CMPB BL, BH					!Se BL e' maggiore di DIM-1 allora termina il ciclo
	JG med						

	MOVB AL, BL					

min2:	INCB AL						!Ciclo interno
	CMPB AL, AH					
	JG min1						!Se AL e' maggiore di DIM torna al ciclo esterno

	MOV DX, (BP)(SI)	 
	CMP DX, (BP)(DI)				!Se l'elemento sullo stack e' maggiore del successivo allora passo al prossimo elemento
	JG incr						!incrementando prima gli indici di BP
						
	MOV DX, (BP)(SI)				!Se no, scambio la posizione dei due elementi
	MOV CX, (BP)(DI)	
	MOV (BP)(SI), CX
	MOV (BP)(DI), DX
	
incr:	ADD SI, 2					!Incremento i contatori
	ADD DI, 2
	JMP min2					!Ripeto il ciclo interno

med:
	MOV SI, 0					!Calcolo il mediano
	MOV AX, DIM(SI)
	SUB AX, 48					!Metto in AX il contenuto di DIM
	MOVB CH, 2	 					
	DIVB CH
	CMPB AH, 0
	JNE meddispari

	MOV BX, 2					!Se DIM e' pari recupero l'elemento alla posizione DIM/2+1
	MUL BX
	SUB AX, 2
	MOV SI, AX
	MOV AX, (BP)(SI)
	JMP 1f

meddispari:
	MOV BX, 2					!Se DIM e' dispari recupero l'elemento alla posizione DIM/2
	MOVB AH, 0
	MUL BX
	MOV SI, AX
	MOV AX, (BP)(SI)


1:	MOV SI, 12
	
	PUSH AX						!Salvo il valore del mediano sullo stack

	PUSH msgFdOD					!Stampo a video il messaggio della stampa dopo il calcolo del mediano
	PUSH _PRINTF
	SYS
	ADD SP, 4
	
	PUSH (DIM)					
	CALL STAMPA					!Invoco la stampa dopo aver ordinato gli elementi

	POP (DIM)

	POP AX						!Recupero il valore del mediano sullo stack
	MOV BP, SP					
	
	CMPB CH, 8					!Se non ci sono 8 elementi sullo stack, non shiftare
	JNE esci

	MOV BX, 0					!Sistemo i contatori e gli indici per trovare gli elementi sullo stack
	MOV CX, 0	
	MOV SI, 24
	MOV DI, 22

shift:     						!Shifto i numeri sullo stack verso il basso per far spazio al nuovo pixel
	MOV BX, (BP)(DI)
	MOV (BP)(SI), BX
	SUB SI, 2
	SUB DI, 2
	INC CX

	CMP CX, 7
	JNE shift
	
esci:
	POP BP
	RET

