!-----------------------------------------------------------------------!
!Salvataggio del contenuto di fotogramma all'interno del file output.txt!
!-----------------------------------------------------------------------!
SALVA:
	PUSH BP						!Metto il BP sullo stack per ripristinare il RET della CALL
	MOV BP, SP					!Salvo lo SP nel BP

	PUSH 0777					!Creo, o sovrascrivo se gia' presente, un nuovo file vuoto output.txt
	PUSH output					!Dando i privilegi per la lettura, scrittura e cancellazione del file
	PUSH _CREAT
	SYS
	ADD SP, 6

	CMP AX, -1					!Controllo se ci sono errori la creazione del file output.txt
	JE erroreCreazione				!Se ci sono, avverto ed esco dal programma

	MOV (outputfd), AX				!Aggiorno il file descriptor del file output.txt

	MOV AX, 0

	PUSH 1						!Apro il file output.txt in modalita' di sola scrittura
	PUSH output
	PUSH _OPEN
	SYS
	ADD SP, 6

	CMP AX, -1					!Controllo se ci sono errori nell'apertura del file output.txt
	JE erroreApertura				!Se ci sono, avverto ed esco dal programma

	MOV (outputfd), AX				!Aggiorno il file descriptor del file input.txt

	MOV AX, 0

!-------------------------------------------------------------!
!Salvo il contenuto del vettore fotogramma nel file output.txt!
!Se occorre un errore, faccio altri 2 tentativi		      !
!Se anche al terzo tentativo non funziona, esco dal programma !
!-------------------------------------------------------------!
scrivi:	
	PUSH CX						!Scrivo sul file output.txt i CX caratteri contati durante la lettura del file input.txt
	PUSH fotogramma
	PUSH (outputfd)
	PUSH _WRITE
	SYS
	ADD SP, 8

	CMP AX, -1					!Se e' occorso un errore, ripeto la scrittura con altri 2 tentativi
	JE erroreLO

	MOV AX, 0

	PUSH (outputfd)					!Se tutto e' andato a buon fine, chiudo il file
	PUSH _CLOSE
	SYS
	ADD SP, 4

	CMP AX, -1
	JE erroreChiusura				!Se e' occorso un errore durante la chiusura del file, lo segnalo ed esco

	MOV AX, 0

	POP BP
	RET
