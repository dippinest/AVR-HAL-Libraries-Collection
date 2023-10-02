
#ifndef SYSTIMER_CONFIGURATION_H_
#define SYSTIMER_CONFIGURATION_H_


// ���� �� ������, ����� ������ ���������� ������� ��� ����� 32 ���,
// ���������������� ���� ������ (����� ��������������� ��� ��� ������� 16 ���)
// -------------------------------------------------------------------------------
// if you want the size of the system timer to be 32 bits, uncomment
// this define (otherwise comment it out for the size of 16 bits)

#define SYSTIMER_WIDE_32BIT


// ������-������� ������������� ���������� �������. �� �������
// ������������ 8-�� ������ Timer1 � ��� ������� ������������
// ���������������� � 16 ��� ������ �������� �� ����������
// �� ���������� ������ 1 ��.
//
// ��� ������-������� ���������� �������� � ���� ������������,
// ����� ��� ������������� ����� ���� �������� ��������� ���������� �������
//
// -------------------------------------------------------------------------------
// inline function initialization of the system timer. By default,
// an 8-bit Timer1 is used and with a clock frequency of the
// microcontroller at 16 MHz, the timer is configured to interrupt
// coincidentally every 1 ms.
//
// This inline function is specially placed in the configuration
// file so that, if necessary, you can change the parameters
// of the system timer

inline void SYSTIMER_Initialize()
{
	TIMSK = (1 << OCIE0);
	TCCR0 = (1 << CS01) | (1 << CS00) | (1 << WGM01);
	
	TCNT0 = 6;
	OCR0  = 249;
}


#endif


