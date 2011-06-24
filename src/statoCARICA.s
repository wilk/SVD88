!----------------------------------------------------!
!Carica in fotogramma il contenuto del file input.txt!
!leggendo un carattere alla volta e salvando nel     !
!registro CX il numero dei caratteri letti.          !
!----------------------------------------------------!
CARICA:
	PUSH BP						!Metto il BP sullo stack per ripristinare il RET della CALL
	MOV BP, SP					!Salvo lo SP nel BP

	PUSH 0						!Apro il file input.txt in modalita' di sola lettura
	PUSH input
	PUSH _OPEN
	SYS
	ADD SP, 6

	CMP AX, -1					!Controllo se ci sono errori nell'apertura del file input.txt
	JE erroreApertura				!Se ci sono, avverto ed esco dal programma

	MOV (inputfd), AX				!Aggiorno il file descriptor del file input.txt

	MOV AX, 0

	MOV DI, fotogramma				!Salvo in DI il vettore fotogramma che verra' caricato di un carattere alla volta

	MOV CX, -1					!Uso CX per contare quanti caratteri leggo dal file input.txt
							!Inizializzo CX a -2 per leggere tutti i caratteri del file senza gli spazi finali

!----------------------------------------------------------------------------!
!Leggo l'intero file input.txt, salvando il contenuto nel vettore fotogramma.!
!Leggo carattere per carattere, fino a raggiungere la fine del file.         !
!----------------------------------------------------------------------------!
leggi:
	MOV SI, buf_lettura				!Salvo in SI il buffer della lettura che occorrera' a leggere il contenuto di input.txt

	PUSH 1						!Leggo un carattere alla volta
	PUSH buf_lettura
	PUSH (inputfd)
	PUSH _READ
	SYS
	ADD SP, 8

	CMP AX, -1					!Se e' occorso un errore, ripeto la lettura con altri 2 tentativi
	JE erroreLI

	CMP AX, 0					!Se ho letto tutto il file, esco dalla lettura
	JE fineLeggi

	PUSH AX						!Salvo il contenuto di AX sullo stack

	LODSB
	STOSB						!Carico il carattere letto dal file input.txt nel vettore fotogramma

	POP AX						!Ripristino AX

	INC CX						!Incremento CX, il contatore dei caratteri letti dal file input.txt

	JMP leggi

fineLeggi:
	MOV AX, 0

	PUSH (inputfd)					!Se tutto e' andato a buon fine, chiudo il file
	PUSH _CLOSE
	SYS
	ADD SP, 4

	CMP AX, -1
	JE erroreChiusura				!Se e' occorso un errore durante la chiusura del file, lo segnalo ed esco

	MOV AX, 0

	POP BP
	RET
