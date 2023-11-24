

// ===============================================================================
//
// ���������� ��� ������ � ���������� EEPROM ������� ����������������.
//
// ��������! ������ � ���������� EEPROM - ���������� �� �������
// (�������� ������ ������). ������� ���� ��� ���� �������� ���
// ��������� ������� ���� ������, � ����������� ������ ���
// � ������� ��������� ��������
// (���������, � �������, ���������� ������������ ����� scheduler.h)
//
// -------------------------------------------------------------------------------
//
// Library for working with the internal EEPROM memory of the microcontroller.
//
// Attention! Working with internal EEPROM is time-consuming
// (especially data recording). Therefore, if you need to write or
// read a large block of data, I recommend doing it using
// a finite state machine
// (using, for example, the task scheduler library scheduler.h)
//
// ===============================================================================


#ifndef EEPROM_H_
#define EEPROM_H_

#include <avr/io.h>
#include <avr/interrupt.h>

#include <stdint.h>


// ===============================================================================


void EEPROM_Write_Byte(uint16_t mem_addr, uint8_t byte);

uint8_t EEPROM_Read_Byte(uint16_t mem_addr);

void EEPROM_Write_Data(uint16_t mem_addr, void *data, uint16_t data_size);

void *EEPROM_Read_Data(uint16_t mem_addr, void *data, uint16_t data_size);


#endif
