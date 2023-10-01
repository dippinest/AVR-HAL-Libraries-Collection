
#ifndef HC595_LED_INDICATOR_CONFIGURATION_H_
#define HC595_LED_INDICATOR_CONFIGURATION_H_


// ���� �� ������ �������� � ����������� ����������� ������������ SPI,
// ���������������� ���� ������ (����� ��������������� ���)
// -------------------------------------------------------------------------------
// if you want to work with the device via software SPI,
// uncomment this define (otherwise comment it out)

#define HC595_LED_INDICATOR_USE_SOFTSPI


// ���� �� ������ ������������ ������-������� ��� ��������� ������
// CS (chip select) SPI ����������, ���������������� ���� ������ (����� ��������������� ���)
// -------------------------------------------------------------------------------
// if you want to use callback functions to change the CS (chip select) output of the
// device's SPI, uncomment this define (otherwise comment it out)

#define HC595_LED_INDICATOR_USE_CS_CALLBACKS

#endif


