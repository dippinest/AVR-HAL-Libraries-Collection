
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

		; �������� ���������� 32000 ������ => F_CPU (16000000) / 32000 = 500 ��
		; (2 ��) �� ���� ������������ ���������� ��� 250 �� (4 ��) �� ���� ���� �������
		; -------------------------------------------------------------------------------
		; The delay is 32000 clock cycles => F_CPU (16000000) / 32000 = 500 Hz (2 ms)
		; for one LED switching or 250 Hz (4 ms) for one flashing cycle
		DELAY_CLK16 32000

		IN  R16,   PORTD
		LDI R17,   (1 << 7)
		EOR R16,   R17
		OUT PORTD, R16

    RJMP Main_Loop
