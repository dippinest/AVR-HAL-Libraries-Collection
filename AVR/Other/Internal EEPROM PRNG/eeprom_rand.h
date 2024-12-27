
// ===============================================================================
//
// ���������� ���������� ��������������� ����� �� ������ ���������� EEPROM.
//
// ������� ���������� ��������� �������� ��������������� ����� � ���������
// 8, 16 � 32 ����, ��������� EEPROM ������ � �������� �� 0x00 �� max_eeprom_addr,
// ������� ������� � ���������� �������. �������� ������ ������ �����
// ������� � ���������� �������.
//
// ��������� ������ EEPROM ����� ������������ ������ �� �������� ������,
// � �������� ������ ������ ���������� ��-�� ������������ I/O �������� EEPROM
// ������ ��������, ������������� ��������� ������ ���������� ��� ���������
// ���������� ���� (������) ��� ��� ������ ����� ���� �����������
// (��������, ����������� ������� rand()).
//
// -------------------------------------------------------------------------------
//
// Library of a pseudo-random number generator based on an internal EEPROM.
//
// The library functions allow you to get pseudo-random numbers in
// the range of 8, 16, and 32 bits using the cell EEPROM with addresses
// from 0x00 to max_eeprom_addr, which is set in the function parameters.
// The main memory location is also set in the function parameters.
//
// Since EEPROM cells have a limited resource for a write operation,
// and the speed of this library is low due to the peculiarities of I/O
// operations of EEPROM memory, it is recommended to use this library
// to generate the initial seed for other types of PRNG generators
// (for example, the standard rand() function).
//
// ===============================================================================


#ifndef EEPROM_RAND_H_
#define EEPROM_RAND_H_


#include <avr/eeprom.h>

#include <stdint.h>


// ===============================================================================


uint8_t EEPROM_RAND_Get_8Bit_Value(uint8_t init_eeprom_addr, uint8_t max_eeprom_addr);

uint16_t EEPROM_RAND_Get_16Bit_Value(uint8_t init_eeprom_addr, uint8_t max_eeprom_addr);

uint32_t EEPROM_RAND_Get_32Bit_Value(uint8_t init_eeprom_addr, uint8_t max_eeprom_addr);


#endif


