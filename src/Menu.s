!------------------------------------------!
!Stampa del Menu visualizzabile dall'utente!
!------------------------------------------!
initMenu:
	PUSH BP
	MOV BP, SP

	PUSH msgAstMenu					!Asterischi Menu
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgMenu					!Titolo Menu
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgAstMenu
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgCarica					!Funzione CARICA
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgFiltra					!Funzione MEDIANO
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgSalva					!Funzione SALVA
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgAuto					!Automatizza l'intero processo del progetto
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgEsci					!Uscita dal programma
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgAstMenu
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH acapo
	PUSH _PRINTF
	SYS
	ADD SP, 4

	PUSH msgInsMenu					!Richiesta d'inserimento dell'opzione da eseguire
	PUSH _PRINTF
	SYS
	ADD SP, 4

	POP BP
	RET
