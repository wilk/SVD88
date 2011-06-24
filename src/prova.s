#include "syscalnr.h"

.SECT .TEXT

pulizia:
	PUSH BP
	MOV BP, SP

	MOV SI, null
	MOV DI, prova
	MOV CX, -1

	REP MOVSB

ripPul:
	REP MOVSB

.SECT .DATA
fmtstr:
	.ASCIZ "%s"
fmtint:
	.ASCIZ "%d"
null:
	.ASCIZ ""
acapo:
	.ASCIZ "\n"

.SECT .BSS
prova:
	.SPACE 100
sup:
	.SPACE 1
