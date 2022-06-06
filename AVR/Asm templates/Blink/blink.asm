
; ��� ������ �� ����� ���������� ��������� ��������� Blink, ���� �������
; ������ ����������� � ������� ����� GPIO � ������������ ��������������.
; ���� ��� �������� �������� ������� � ������������������� �������� ��������
; ������ ���� ����������, ������� ������ ��� �����.
;
; �������: ���� ���������� ����� �����, ���� ������ �� ��� ��������� �������, ��� �� �� :)
; -------------------------------------------------------------------------------
; This example in assembly language implements the Blink program,
; the essence of which is to flash the LED using the GPIO port with a
; certain frequency. This code is a project template with commented-out lines
; is a kind of cheat sheet that is always at hand.
;
; Remember: the assembly language is very simple,
; although it is somewhat more difficult to write in it than in C :)

; ===============================================================================
; ===============================================================================


; ��������� LIST ��������� ����������� �� ������������� �������� ��������.
; ������� ������������ �� ���� ���������� ������������� ����, ������� � �����
; ��������. �� ��������� ��������� �������� ��������, ������ ������ ���������
; ������������ ��������� � ���������� NOLIST ��� ��������� ��������� ���������
; ������ �������� ������
; -------------------------------------------------------------------------------
; The LIST directive tells the compiler to create a listing. The listing is a
; combination of assembly code, addresses, and opcodes. By default, listing
; generation is enabled, but this directive is used in conjunction with the
; NOLIST directive to obtain listings of individual parts of the source files
.LIST

; � ������� ��������� .DEF ������ �������� R16 ��������� T0_OVF_Counter
; -------------------------------------------------------------------------------
; With the help of a directive .DEF we set the case R16 alias ABC
.DEF T0_OVF_Counter = R17

; ��������� DSEG ���������� ������ �������� ������. �������� ����
; ����� �������� �� ���������� ��������� ������, ������� ������������ �
; ���� ������� ��� ����������. ������� ������ ������ ������� ������ ��
; �������� BYTE � �����. �������� ������ ����� ���� ����������� ���������
; �������� ���������. ��������� ORG ����� ���� ������������ ��� ����������
; ���������� � ����������� ����� ���
; -------------------------------------------------------------------------------
; The CSEG directive defines the beginning of a data segment. The source
; file may consist of several data segments that are combined into one segment
; during compilation. A data segment usually consists only of BYTE directives
; and labels. Data segments have their own byte-by-byte position counters.
; The ORG directive can be used to place variables in the required RAM location
.DSEG

; ===============================================================================

; ������� ����. ����� ��������� CSEG ���� �������� ���� ���������
; ��� ������, ���������� �� ���� ������
; -------------------------------------------------------------------------------
; Code segment. After the CSEG directive there is a description
; of the program code or data stored in flash memory
.CSEG

; ��������� ORG ������������� ������� ��������� ������ �������� ��������,
; ������� ���������� ��� ��������. ��� �������� ������ ��� �������������
; ������� ��������� � SRAM (���), ��� �������� �������� ��� ����������� �������,
; � ��� �������� EEPROM ��� ��������� � EEPROM. ���� ��������� ������������ �����
; (� ��� �� ������) �� ����� ����������� �� ������ ���������� � ��������� ���������.
; ����� ������� ���������� ����������� ������� � ������� EEPROM ����� ����,
; � ������� ��� ����� 32 (��������� ������ 0-31 ������ ����������).
; �������� �������� ��� ��� ��� � EEPROM ������������ ��������� ��������,
; � ��� ������������ �������� - ���������
; -------------------------------------------------------------------------------
; The ORG directive sets the position counter equal to the specified value,
; which is passed as a parameter. For the data segment, it sets the position
; counter in SRAM (RAM), for the program segment it is the program counter,
; and for the EEPROM segment it is the position in the EEPROM. If the directive
; is preceded by a label (in the same line), then the label is placed at the
; address specified in the directive parameter. Before compilation begins,
; the program counter and the EEPROM counter are zero, and the RAM counter
; is 32 (since addresses 0-31 are occupied by registers). Note that byte-by-byte
; counters are used for RAM and EEPROM, and for the program segment - word-by-word
.ORG 0x0000

; ������� � �������� ����� (����� ����� � ���������)
; Transition to the main label (entry point to the program)
RJMP Main



; ======================= INTERRUPT VECTORS TABLE ==============================

; ����� ������� ������������ ������� ���������� � ������
; -------------------------------------------------------------------------------
; The interrupt vectors and addresses used are described here


; ����� ������� ���������� �� ������������ �������� T0 � ����� �� ��� ����������
; -------------------------------------------------------------------------------
; Address of the interrupt vector for the overflow of the counter T0
; and the label on it is handler
.ORG 0x009
	RJMP TIMER0_OVF

; ===============================================================================



; ========================== INTERRUPT HANDLERS =================================

; ����� ������� ������������ ������� ���������� � ������
; -------------------------------------------------------------------------------
; The handlers of the interrupts used are described here


; ���������� ���������� �� ������� TIMER0_OVF
; -------------------------------------------------------------------------------
; Interrupt handler by TIMER0_OVF vector
TIMER0_OVF:

	; ������ ��������� �������� �������� ��������
	; -------------------------------------------------------------------------------
	; Setting the initial value of the counting register
	LDI  R16,   255 - 250
	OUT  TCNT0, R16

	; ���������� ������� ���������� � ����������� ����������� ��������� � ���� ��
	; ������ ��� �����, �� ��������� �� ����� LED_SWITCH
	; -------------------------------------------------------------------------------
	; Compare the interrupt counter with the calculated constant value and
	; if it is greater than or equal to, then switch to the LED_SWITCH label
	CPI  T0_OVF_Counter, 125
	BREQ LED_SWITCH

	; ����� - �������������� ������� � ������� �� ����������
	; -------------------------------------------------------------------------------
	; Else increment the counter and exit the interrupt
	INC  T0_OVF_Counter
	RETI

	LED_SWITCH:

		; �������� �������
		; -------------------------------------------------------------------------------
		; Counter reset
		LDI T0_OVF_Counter, 0x00

		; ������ �������� �� ����� PORTD � ���������� ��� � ������� �����
		; -------------------------------------------------------------------------------
		; Read the value from the PORTD port and compare it with the target bit
		IN   R16, PORTD
		CPI  R16, (1 << PORTD7)

		; ���� ���������� ��������� ������� (���� C=0 � ������� SREG),
		; �� ��������� �� ����� LED_OFF, ����� - �� ����� LED_ON
		; -------------------------------------------------------------------------------
		; If the previous comparison is true (flag C=0 in the SREG register),
		; then switch to the LED_OFF label, otherwise to the LED_ON label
		BRSH LED_OFF
		RJMP LED_ON

		LED_OFF:
			; ������������� ������� ��� �������� R16 � 0 � ��������� �� ����� WRITE_BIT_TO_PORT
			; -------------------------------------------------------------------------------
			; Set the target bit of the R16 register to 0 and switch to the WRITE_BIT_TO_PORT label
			ANDI R16, ~(1 << PORTD7)
			RJMP WRITE_BIT_TO_PORT

		LED_ON:
			; ������������� ������� ��� �������� R16 � 1
			; -------------------------------------------------------------------------------
			; Set the target bit of the R16 register to 1
			ORI  R16, (1 << PORTD7)

		WRITE_BIT_TO_PORT:
			; ���������� �������� �������� R16 � ������� PORTD
			; -------------------------------------------------------------------------------
			; Write the value of the R16 register to the PORTD register
			OUT PORTD, R16

	; ������� �� ����������
	; -------------------------------------------------------------------------------
	; Exiting the interrupt
	RETI

; ===============================================================================



; ================================ MACROS =======================================

; ����� ������� ������������ �������
; -------------------------------------------------------------------------------
; The macros used are described here


; ������ ��� ������������� ������� �����
; -------------------------------------------------------------------------------
; Macro for initializing the top of the stack
.MACRO STACK_POINTER_INITIALIZE
	
	LDI R16, HIGH(RAMEND)
	OUT SPH, R16
	LDI R16, LOW(RAMEND)
	OUT SPL, R16

.ENDM

; ===============================================================================



; ============================== PROCEDURES =====================================

; ����� ������� ������������ ��������� � ������� (��� �� �������������
; ���������� ������������������� ����, ����� ��������� �������� ��� ������)
; -------------------------------------------------------------------------------
; The procedures and functions used are described here (to use them,
; you need to initialize the stack in order to preserve the context when calling)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ===============================================================================



; ����� ����� � ��������� (������ ������� main � ��)
; -------------------------------------------------------------------------------
; The entry point to the program (analogous to the main function in C)
Main:
	
	; � ������ ��������� ���� �� �����, ������� ���������������� ��� �� �����
	; -------------------------------------------------------------------------------
	; In this program, the stack is not needed, so we will not initialize it
	; STACK_POINTER_INITIALIZE

	; �������� ���������� ����������
	; -------------------------------------------------------------------------------
	; global interrupt enable
	SEI

	; ��������� 7 ���� ����� PORTD �� �����
	; -------------------------------------------------------------------------------
	; setting the 7 bits of the PORTD port to output
	LDI  R16,  (1 << PORTD7)
	OUT  DDRD, R16

	; ����� ����������� ��������� 1 ��� � 500 ��. ��� ����� ���������� �������� �
	; ������� �������� T0 (8 bit) � ��� ���������� �� ������������.
	; ������ ����������� ���:
	;
	; ������������ = 255
	; �������� ������������ �������� � ������� ������� = (255 - 250) = 500
	; F_CPU (16 MHz) / Prescaler (255) / 250 = 250
	;
	; �� 1 ������� ���������� 250 ���������� �� ������������ => �� 500 �� ���������� 125 ����������
	; -------------------------------------------------------------------------------
	; We will switch the LED 1 time in 500 ms. To do this, we organize the delay using the counter T0 (8 bit) and its overflow interrupts.
	;
	; The timer is configured as follows:
	; Preddelitel = 255
	; The value of the loaded value in the counting register = (255 - 250) = 500
	;
	; F_CPU (16 MHz) / Prescaler (255) / 250 = 250
	;
	; 250 overflow interrupts will occur in 1 second => 125 interrupts will occur in 500 ms
	LDI  R16,   (1 << CS02)
	OUT  TCCR0, R16
	LDI  R16,   255 - 250
	OUT  TCNT0, R16

	; ��������� ���������� �� ������������ �������� T0
	; -------------------------------------------------------------------------------
	; we allow interrupts on the overflow of the counter T0
	LDI  R16,   (1 << TOIE0)
	OUT  TIMSK, R16

	Main_Loop:

	; � ����������� ����� ������ �� ������
	; -------------------------------------------------------------------------------
	; In an infinite loop, we do nothing

    rjmp Main_Loop
