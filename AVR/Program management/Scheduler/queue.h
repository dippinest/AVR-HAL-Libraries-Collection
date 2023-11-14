

// ===============================================================================
//
// ����������, ����������� ������� �����.
// ������������ ��������� � ����������� ������������ ����� scheduler.h.
// ��������� ��������� ���������������� ������� ������� ��� �� ��������
// ��� �� ����� � ������������ ������ (����).
// �������� ������� ������������� ���������� scheduler.h, ����� ������ ������
//
// -------------------------------------------------------------------------------
//
// Library that implements task queues.
// It is used in conjunction with the task scheduler library scheduler.h.
// The library allows you to initialize the queue manually or allocate
// space for it in dynamic memory (heap).
// See examples of using the scheduler.h library to learn more
//
// ===============================================================================


#ifndef QUEUE_H_
#define QUEUE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>


typedef struct
{
	void (**tasks_buffer)();
	
	uint16_t first;
	uint16_t last;
	uint16_t size;
	
	bool     is_empty;
	
} Task_Queue_t;


// ===============================================================================


Task_Queue_t Task_Queue_Create(void (**tasks_buffer)(), uint16_t buffer_size);

Task_Queue_t *Task_Queue_Create_To_Dynamic_Memory(uint16_t buffer_size);

void Task_Queue_Delete_From_Dynamic_Memory(Task_Queue_t* queue);


// ===============================================================================


void *Task_Queue_Push(Task_Queue_t* queue, void (*task)());

void *Task_Queue_Pop(Task_Queue_t* queue);

void *Task_Queue_Get_First(Task_Queue_t* queue);

bool  Task_Queue_Is_Empty(Task_Queue_t* queue);


#endif

