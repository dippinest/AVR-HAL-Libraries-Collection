

#include "uart.h"
#include "nec_decoder.h"


void NEC_Decoder_Callback()
{
	NEC_Protocol_Data_t nec = NEC_Decoder_Get_Data();
	
	UART_StringFmt_Transmit("ADDR = %X, CMD = %X\r\n", nec.addr, nec.commmand);
}

void NEC_Decoder_Repeat_Callback()
{
	UART_StringLn_Transmit("REPEAT");
}


int main(void)
{
	UART_Initialize(19200, true, false);
	
	
	// ������ ������������ ������� ����������� ��� ������ ��������
	// ������ NEC ���������; ������ - ��� ��������� ��������� ������
	// -------------------------------------------------------------------------------
	// first transmitted function is triggered when the NEC protocol
	// packet is received for the first time; the second is triggered
	// when the packet is received again.
	
	NEC_Decoder_Initialize(NEC_Decoder_Callback, NEC_Decoder_Repeat_Callback);
	
	
	
	// ������������� ����������, ����������� ��� ������ �������� NEC
	// -------------------------------------------------------------------------------
	// initializing interrupts necessary for NEC decoder operation
	
	NEC_Decoder_FSM_Timer_Initialize();
	NEC_Decoder_EXINT_Interrupt_Initialize();
	
	
	sei();
	
	while (1)
	{
	}
}


