АВС ИДЗ №2 

Создал програму на Си, затем на ассемблере. Прикрепил 2 файла с ассемблером до (programStart.s) и после (program.s) всех сокращений кода и оптимизаций.  
Проверил, что обе программы выдают правильный результат:  
![image](/static/asm.jpg)  
За счет флагов и ручного редактирования сократил код на ассемблере.  
Прокомментировал весь полученый код.  
Запустил тесты, убедился, что все работает корректно:  
![image](/static/tests.jpg)

Использовал функции с передачей данных через параметры и локальные перемнные.  
Добавить комментарии, описывающие связь между параметрами языка Си и регистрами.  

Произвел следующие оптимизации кода:  
lea	rax, -1008[rbp]
mov	rdi, rax
заменил сразу на 
lea rdi, -1008[rbp]

lea	rax, -6032[rbp]
mov	rdi, rax
заменил сразу на 
lea rdi, -6032[rbp]

Оптимизации использования регистров процессора:  
Использовал регистр r12d, вмсето стека DWORD PTR -4[rbp]  
Использовал регистр r13d, вмсето стека DWORD PTR -8[rbp]  
Использовал регистр r11d, вмсето стека DWORD PTR -12[rbp]  

Прочие оптимизации:  
Убрал ненужый код после ret  
Убрал endr64  
(Сократил код с 429 до 352 строк)  
Прогнал опять тесты, все работает коректно.  
Добавил комментарии, поясняющие использование регистров, эквивалентных коду на С  

Вроде выполнил все пункты на 6)
