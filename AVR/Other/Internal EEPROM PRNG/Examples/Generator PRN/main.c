

#include <util/delay.h>

#include <stdint.h>

#include "uart.h"
#include "eeprom_rand.h"


int main(void)
{
	UART_Initialize(9600, true, false);
	
	while (1)
	{
		// ����������� 8-�� ������� ���������������� �������� � ��������������
		// ��������� ������� ������� �� 0x00 �� 0x20. �������� ������ - 0x00
		// -------------------------------------------------------------------------------
		// Generating an 8-bit pseudo-random value using a range of operating
		// addresses from 0x00 to 0x20. The main cell is 0x00
		uint8_t seed = EEPROM_RAND_Get_8Bit_Value(0x00, 0x20);
		
		UART_Byte_Transmit(seed); _delay_ms(100);
	}
}













