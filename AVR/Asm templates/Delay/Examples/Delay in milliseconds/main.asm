
.LIST
.DSEG
.CSEG

.INCLUDE "delay.inc"

.ORG 0x0000

Main:
	
	; ������������� �����
	; -------------------------------------------------------------------------------
	; Stack Initialization
	LDI  R16, Low(RAMEND)
	OUT  SPL, R16
	LDI  R16, High(RAMEND)
	OUT  SPH, R16

	SEI

	LDI  R16,  (1 << 7)
	OUT  DDRD, R16

	Main_Loop:

		; �������� ���������� 500 ����������� = 2 �� �� ���� ������������ ����������
		; ��� 1 �� (1000 ��) �� ���� ���� �������
		; -------------------------------------------------------------------------------
		; The delay is 500 milliseconds = 2 Hz for one LED switching
		; or 1 Hz (1000 ms) for one flashing cycle
		DELAY_MS 500

		IN  R16,   PORTD
		LDI R17,   (1 << 7)
		EOR R16,   R17
		OUT PORTD, R16

    RJMP Main_Loop
