

// ===============================================================================
//
// ���������� ��� ���������� ���������� ������� � ������ � ���. ���������
// ��������� ������ ����� ����������� � ������� ������ ����������� �������
// ����������������, �� ��� ���������� �������� � ��������� ����
// ������������ systimer_configuration.h
//
// ��� ����� ������������ � ��������� ����������� - ��������, ���
// ����������� ������������ �������, ��������� ������� ������ ����,
// ����������� ������ �������� � �.�.
//
// -------------------------------------------------------------------------------
//
// A library for implementing a system timer and working with it.
// Since the system timer can be implemented using any MCU
// hardware timer, its implementation is placed in a separate
// configuration file, systimer_configuration.h
//
// It can be used in various applications - for example,
// to organize the operating system, measure the running time
// of the code, organize accurate delays, etc.
//
// ===============================================================================


#ifndef SYSTIMER_H_
#define SYSTIMER_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>


#include "systimer_configuration.h"


#ifdef SYSTIMER_WIDE_32BIT

typedef uint32_t SYSTIMER_t;

#else

typedef uint16_t SYSTIMER_t;

#endif


SYSTIMER_t SYSTIMER_Get_Value();


#endif


