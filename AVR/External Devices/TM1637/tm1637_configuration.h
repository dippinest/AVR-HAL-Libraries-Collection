
#ifndef TM1637_CONFIGURATION_H_
#define TM1637_CONFIGURATION_H_


// ���� �� ������ �������� � ����������� ������������ TM1637, ����������������
// ���� ������ (����� ��������������� ���)
// -------------------------------------------------------------------------------
// if you want to work with multiple TM1637 indicators, uncomment this define
// (otherwise comment it out)

#define TM1637_USE_MULTIPLE_INTERFACE




#ifndef TM1637_USE_MULTIPLE_INTERFACE

// ����������� GPIO ��� CLK TM1637
// -------------------------------------------------------------------------------
// GPIO definitions for CLK TM1637

#define TM1637_CLK_DDR	 DDRC
#define TM1637_CLK_PORT  PORTC
#define TM1637_CLK_PIN   0


// ����������� GPIO ��� DIO TM1637
// -------------------------------------------------------------------------------
// GPIO definitions for DIO TM1637

#define TM1637_DIO_DDR	 DDRC
#define TM1637_DIO_PINX  PINC
#define TM1637_DIO_PORT  PORTC
#define TM1637_DIO_PIN   1

#endif


#endif




