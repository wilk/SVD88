!-------------------------------------------!
!Gestione dell'errore dell'apertura dei file!
!-------------------------------------------!
erroreApertura:
	MOV AX, 1

	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH erra					!Avverto dell'errore
	PUSH _PRINTF
	SYS
	ADD SP, 4

	JMP uscita

!-----------------------------------------------------!
!Gestione dell'errore della lettura del file input.txt!
!-----------------------------------------------------!
erroreLI:
	MOV AX, 1

	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH errli					!Avverto dell'errore
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH (inputfd)					!Chiudo il file input.txt
	PUSH _CLOSE
	SYS
	ADD SP, 4

	JMP uscita

!---------------------------------------------!
!Gestione dell'errore della creazione del file!
!---------------------------------------------!
erroreCreazione:
	MOV AX, 1

	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH errc					!Avverto dell'errore
	PUSH _PRINTF
	SYS
	ADD SP, 4

	JMP uscita

!------------------------------------------------------!
!Gestione dell'errore della lettura del file output.txt!
!------------------------------------------------------!
erroreLO:
	MOV AX, 1

	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH errlo					!Avverto dell'errore
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH (outputfd)					!Chiudo il file input.txt
	PUSH _CLOSE
	SYS
	ADD SP, 4

	JMP uscita

!-------------------------------------------------!
!Gestione dell'errore durante la chiusura del file!
!-------------------------------------------------!
erroreChiusura:
	MOV AX, 1

	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH errch					!Avverto dell'errore
	PUSH _PRINTF
	SYS
	ADD SP, 4

	JMP uscita

!------------------------------------------------------------!
!Gestione dell'errore durante la scelta dell'opzione del Menu!
!------------------------------------------------------------!
erroreScelta:
	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH errscelta
	PUSH _PRINTF
	SYS
	ADD SP, 4

	JMP uscita
