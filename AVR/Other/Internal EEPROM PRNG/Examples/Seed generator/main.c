

#include <util/delay.h>

#include <stdint.h>
#include <stdlib.h>

#include "uart.h"
#include "eeprom_rand.h"


int main(void)
{
	UART_Initialize(9600, true, false);
	
	// ����������� 16-�� ������� ���������������� ���� (������) ��� ������������ ����
	// � �������������� ��������� ������� ������� �� 0x00 �� 0x20. �������� ������ - 0x00
	// -------------------------------------------------------------------------------
	// Generation of a 16-bit pseudorandom seed for the standard rand() PRNG using
	// the range of operating addresses from 0x00 to 0x20. The main cell is 0x00
	srand(EEPROM_RAND_Get_16Bit_Value(0x00, 0x20));
	
	while (1)
	{
		// ����������� 8-�� ������� ���������������� �������� � ��������������
		// ����������� ������� rand()
		// -------------------------------------------------------------------------------
		// Generating an 8-bit pseudorandom value using the standard rand() function
		uint8_t seed = (uint8_t)rand();
		
		UART_Byte_Transmit(seed); _delay_ms(100);
	}
}













