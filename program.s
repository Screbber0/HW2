# -4[rbp] => r12d
# -8[rbp] => r13d
# -12[rbp] => r11d

        .intel_syntax noprefix          # пишем в синаксисе intel       
        .text                           # начинаем секцию
addToPairs:                             # функция добаления пары в наш словарь 
        push  rbp                       # сохранение rbp на стек
        mov  rbp, rsp                   # rbp := rsp
        mov  QWORD PTR -24[rbp], rdi    # |
        mov  QWORD PTR -32[rbp], rsi    # |     Передача параметоров в функцию addToPairs
        mov  QWORD PTR -40[rbp], rdx    # |  
        mov  QWORD PTR -48[rbp], rcx    # |
        mov  r12d, 0                    # i = 0 
        jmp  .L2                        # go to l2
.L9:
        mov  eax, r12d                  # eax := i
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, rdx                   # rdx := rdx
        sal  rax, 4                     # побитовый сдвиг числа влево
        sub  rax, rdx                   # rax := rax - rdx
        sal  rax, 3                     # побитовый сдвиг числа влево
        mov  rdx, rax                   # rdx -= rax
        mov  rax, QWORD PTR -24[rbp]    # кладем в rax указатель QWORD PTR -24[rbp]
        add  rax, rdx                   # rax := rdx
        mov  rax, QWORD PTR [rax]       # кладем в rax указатель QWORD PTR -24[rbp]
        cmp  QWORD PTR -48[rbp], rax    # проверяем pair_array[i].len_word == temp_string_len
        jne  .L3                        # если pair_array[i].len_word != temp_string_len, то jump .L3
        mov  r13d, 0                    # j := 0
        jmp  .L4                        # go to  to .L4
.L8:
        mov  eax, r12d                  # eax := r12d
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, rdx                   # rax = rdx
        sal  rax, 4                     # побитовый сдвиг числа влево
        sub  rax, rdx                   # rax := rax - rdx
        sal  rax, 3                     # побитовый сдвиг числа влево
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # кладем в rax указатель QWORD PTR -24[rbp]
        add  rdx, rax                   # rdx := rax
        mov  eax, r13d                  # eax := r13d
        cdqe                            # преобразование в sign-extend
        movzx  edx, BYTE PTR 8[rdx+rax] # перемещаем в edx с расширением разрядности
        mov  eax, r13d                  # eax := r13d
        movsx  rcx, eax                 # перемещаем в rcx с расширением разрядности
        mov  rax, QWORD PTR -40[rbp]    # перемещаем указатель
        add  rax, rcx                   # rax := rax + rcx
        movzx  eax, BYTE PTR [rax]      # перемещаем в eax с расширением разрядности    
        cmp  dl, al                     # pair_array[i].word[j] != char_line[j]
        jne  .L12                       # если != , то jump .L12
        mov  eax, r13d                  # eax := r13d
        cdqe                            # преобразование в sign-extend
        mov  rdx, QWORD PTR -48[rbp]    # кладем в rax указатель QWORD PTR -24[rbp]
        sub  rdx, 1                     # temp_string_len - 1
        cmp  rax, rdx                   # сравнение rax, rdx
        jne  .L6                        # если не равно, то jump .L6
        mov  eax, r12d                  # eax := r12d   
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности   
        mov  rax, rdx                   # rax = rdx
        sal  rax, 4                     # |
        sub  rax, rdx                   # | побитовые сдвиги и вычитание
        sal  rax, 3                     # | 
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # перемещаем указатель
        add  rax, rdx                   # rax += rdx
        mov  rdx, QWORD PTR 112[rax]    # перемещаем указатель
        add  rdx, 1                     # ++pair_array[i].counter
        mov  QWORD PTR 112[rax], rdx    # QWORD PTR 112[rax] = rdx
        jmp  .L1                        # go to  .L1
.L6:
        add  r13d, 1                    # ++j
.L4:
        mov  eax, r13d                  # eax := r13d
        cdqe                            # преобразование в sign-extend
        cmp  QWORD PTR -48[rbp], rax    # j < temp_string_len
        ja  .L8                         # если больше, то jump .L8
        jmp  .L3                        # go to  .L3
.L12:
        nop                             # не выполняет никакой операции, занимает место в потоке команд
.L3:
        add  r12d, 1                    # ++i
.L2:
        mov  eax, r12d                  # eax :+ r12d
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности 
        mov  rax, QWORD PTR -32[rbp]    # двигаем указатель
        mov  rax, QWORD PTR [rax]       # двигаем указатель
        cmp  rdx, rax                   # i < *pairs_array_len
        jb  .L9                         # если меньше, то jump .L9
        mov  r11d, 0                    # i = 0
        jmp  .L10                       # go to .L10
.L11:
        mov  eax, r11d                  # eax := r11d
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -40[rbp]    # двигаем указатель
        lea  rsi, [rdx+rax]             #
        mov  rax, QWORD PTR -32[rbp]    # двигаем указатель
        mov  rdx, QWORD PTR [rax]       # двигаем указатель
        mov  rax, rdx                   # rax := rdx
        sal  rax, 4                     # |
        sub  rax, rdx                   # | побитовые сдвиги и вычитание
        sal  rax, 3                     # |
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # двигаем указатель
        lea  rcx, [rdx+rax]             #
        movzx  edx, BYTE PTR [rsi]      # 
        mov  eax, r11d                  # eax := r11d
        cdqe                            # преобразование в sign-extend
        mov  BYTE PTR 8[rcx+rax], dl    # pair_array[*pairs_array_len].word[i] = char_line[i]
        add  r11d, 1                    # ++i 
.L10:
        mov  eax, r11d                  # eax := r11d
        cdqe                            # преобразование в sign-extend
        cmp  QWORD PTR -48[rbp], rax    # переход если больше
        ja  .L11                        # go to .L11
        mov  rax, QWORD PTR -32[rbp]    # rax := указатель
        mov  rdx, QWORD PTR [rax]       # rdx := указатель
        mov  rax, rdx                   # rdx := rdx
        sal  rax, 4                     # |
        sub  rax, rdx                   # | побитовые сдвиги и вычитание
        sal  rax, 3                     # | 
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # rax := указатель
        add  rdx, rax                   # rdx += rax
        mov  rax, QWORD PTR -48[rbp]    # |
        mov  QWORD PTR [rdx], rax       # | pair_array[*pairs_array_len].len_word = temp_string_len
        mov  rax, QWORD PTR -32[rbp]    # rax := указатель
        mov  rdx, QWORD PTR [rax]       # rdx :=  указатель
        mov  rax, rdx                   # rax := rdx
        sal  rax, 4                     # |
        sub  rax, rdx                   # | побитовые сдвиги и вычитание
        sal  rax, 3                     # |
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # rax := указатель
        add  rax, rdx                   # rax := rdx
        mov  QWORD PTR 112[rax], 1      # pair_array[*pairs_array_len].counter = 1
        mov  rax, QWORD PTR -32[rbp]    # rax := указатель
        mov  rax, QWORD PTR [rax]       # rax := указатель
        lea  rdx, 1[rax]                # *pairs_array_len + 1
        mov  rax, QWORD PTR -32[rbp]    # |
        mov  QWORD PTR [rax], rdx       # | *pairs_array_len = *pairs_array_len + 1
.L1:
        pop  rbp                        # / завершение метода
        ret                             # |
.LC0:
        .string  "%ld \n"
        
printPairs:                             # функция печати всех наших пар: слова частота 
        push  rbp                       # сохранение rbp на стек
        mov  rbp, rsp                   # rbp := rsp
        sub  rsp, 32                    # rsp -= 32 
        mov  QWORD PTR -24[rbp], rdi    # rdi := указатель
        mov  QWORD PTR -32[rbp], rsi    # rsi := указатель
        mov  r12d, 0                    # i = 0
        jmp  .L14                       # go to .L14 
.L17:
        mov  r13d, 0                    # j = 0 
        jmp  .L15                       # go to .L15
.L16:
        mov  eax, r12d                  # eax := r12d
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, rdx                   # rax := rdx
        sal  rax, 4                     # |
        sub  rax, rdx                   # | побитовые сдвиги и вычитание
        sal  rax, 3                     # | 
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # rax := указатель
        add  rdx, rax                   # rdx := rax
        mov  eax, r13d                  # eax := r13d
        cdqe                            # преобразование в sign-extend
        movzx  eax, BYTE PTR 8[rdx+rax] # перемещаем в eax с расширением разрядности
        movsx  eax, al                  # |
        mov  edi, eax                   # | printf("%c", pairs_array[i].word[j])
        call  putchar@PLT               # |
        add  r13d, 1                    # ++j
.L15:
        mov  eax, r13d                  # eax := j
        movsx  rcx, eax                 # перемещаем в rcx с расширением разрядности
        mov  eax, r12d                  # eax := i
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, rdx                   # rax := rdx
        sal  rax, 4                     # |
        sub  rax, rdx                   # | побитовые сдвиги и вычитание
        sal  rax, 3                     # | 
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # rax := указатель
        add  rax, rdx                   # rax := rdx
        mov  rax, QWORD PTR [rax]       # rax := указатель
        cmp  rcx, rax                   # |if (j < pairs_array[i].len_word)
        jb  .L16                        # |go to .L16 
        mov  edi, 32                    # | printf("%c", ' ');
        call  putchar@PLT               # |
        mov  eax, r12d                  # eax := i 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, rdx                   # rax := rdx
        sal  rax, 4                     # |
        sub  rax, rdx                   # | побитовые сдвиги и вычитание
        sal  rax, 3                     # |
        mov  rdx, rax                   # rdx := rax
        mov  rax, QWORD PTR -24[rbp]    # rax := указатель
        add  rax, rdx                   # rax := rax + rdx
        mov  rax, QWORD PTR 112[rax]    # |
        mov  rsi, rax                   # |
        lea  rdi, .LC0[rip]             # | printf("%ld \n", pairs_array[i].counter);
        mov  eax, 0                     # |
        call  printf@PLT                # |
        add  r12d, 1                    # ++i
.L14:
        mov  eax, r12d                  # eax := r12d
        cdqe                            # преобразование в sign-extend
        cmp  QWORD PTR -32[rbp], rax    # сравниеваем QWORD PTR -32[rbp] и rax
        ja  .L17                        # если больше, то go to .L17
        nop                             # не выполняет никакой операции, занимает место в потоке команд
        nop                             # не выполняет никакой операции, занимает место в потоке команд
        leave                           # / выход из функции 
        ret                             # |

createDictionary:                       # функция которая создает словарь из пар идентификатор - частота
        push  rbp                       # сохранение rbp на стек
        mov  rbp, rsp                   # rbp := rsp
        sub  rsp, 4096                  # | вычитание
        or  QWORD PTR [rsp], 0          # | 
        sub  rsp, 2064                  # |
        mov  QWORD PTR -6152[rbp], rdi  # 
        mov  QWORD PTR -6040[rbp], 0    # size_t pairs_array_len = 0
        mov  rax, QWORD PTR -6152[rbp]  # |
        mov  rdi, rax                   # |
        call  strlen@PLT                # | вызов функции strlen()
        mov  QWORD PTR -32[rbp], rax    # |
        mov  BYTE PTR -1[rbp], 1        # is_start_with_letter = true
        mov  QWORD PTR -16[rbp], 0      # temp_string_len = 0;
        mov  r14d, 0                    # i = 0
        jmp  .L19                       # go to .L19
.L27:
        mov  eax, r14d                  # eax := i
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  # rax := указатель
        add  rax, rdx                   # rax := rdx
        movzx  eax, BYTE PTR [rax]      # перемещаем в eax с расширением разрядности
        cmp  al, 47                     # сравнить al и 47
        jle  .L20                       # jump less => .L20
        mov  eax, r14d                  # eax = i 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  # rax := указатель
        add  rax, rdx                   # rax := rdx
        movzx  eax, BYTE PTR [rax]      # перемещаем в eax с расширением разрядности
        cmp  al, 57                     # сравнить al и 57
        jle  .L21                       # jump less => go to .L21
.L20:
        mov  eax, r14d                  # eax := i 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  # rax := указатель
        add  rax, rdx                   # rax += rdx
        movzx  eax, BYTE PTR [rax]      # перемещаем в rdx с расширением разрядности 
        cmp  al, 64                     # сравнить al и 64 
        jle  .L22                       # jump less => go to .L22
        mov  eax, r14d                  # eax := 1 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  #
        add  rax, rdx                   # rax := rdx + rax
        movzx  eax, BYTE PTR [rax]      # перемещаем в eax с расширением разрядности
        cmp  al, 90                     # сравнить al и 90
        jle  .L21                       # jump less => go to .L21
.L22:
        mov  eax, r14d                  # eax := i
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  
        add  rax, rdx                   # rax += rdx
        movzx  eax, BYTE PTR [rax]      
        cmp  al, 96                     # сравниваем al и 96
        jle  .L23                       # jump less => .L23
        mov  eax, r14d                  # eax := i 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  
        add  rax, rdx                   # rax := rdx
        movzx  eax, BYTE PTR [rax]      # перемещаем в eax с расширением разрядности
        cmp  al, 122                    # сравниваем al и 122
        jle  .L21                       # jump less => .L21 
.L23:
        cmp  QWORD PTR -16[rbp], 0      # temp_string_len != 0
        je  .L24                        # jump .L24
        mov  rcx, QWORD PTR -16[rbp]    # |
        lea  rdx, -6144[rbp]            # |
        lea  rsi, -6040[rbp]            # |  вызов метода addToPairs(pairs_array, &pairs_array_len, temp_string, temp_string_len);
        lea rdi, -6032[rbp]             # |
        call  addToPairs                # |
.L24:
        mov  BYTE PTR -1[rbp], 1        # is_start_with_letter = true;
        mov  QWORD PTR -16[rbp], 0      # temp_string_len = 0;
        jmp  .L25                       # go to .L25
.L21:
        cmp  QWORD PTR -16[rbp], 0      # if (temp_string_len == 0 && (char_line[i] >= 48 && char_line[i] <= 57))
        jne  .L26                       # go to .L26
        mov  eax, r14d                  # eax := i 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  # 
        add  rax, rdx                   # rax += rdx
        movzx  eax, BYTE PTR [rax]      # перемещаем в eax с расширением разрядности
        cmp  al, 47                     # сравниваем al и 47
        jle  .L26                       # jump less => .L26
        mov  eax, r14d                  # eax := i 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности
        mov  rax, QWORD PTR -6152[rbp]  
        add  rax, rdx                   # rax += rdx
        movzx  eax, BYTE PTR [rax]
        cmp  al, 57                     # сравниваем al и 57
        jg  .L26                        # jump if greater => .L26
        mov  BYTE PTR -1[rbp], 0        # is_start_with_letter = false
        jmp  .L25                       # go to .L25
.L26:
        cmp  BYTE PTR -1[rbp], 0        # if (is_start_with_letter)
        je  .L25                        # go to .L25
        mov  eax, r14d                  # eax := i 
        movsx  rdx, eax                 # перемещаем в rdx с расширением разрядности 
        mov  rax, QWORD PTR -6152[rbp]  # rax := QWORD PTR -6152[rbp]
        lea  rcx, [rdx+rax]             # вычисляет адрес [rdx+rax] и помещаем его в rcx
        mov  rax, QWORD PTR -16[rbp]    
        lea  rdx, 1[rax]                # вычисляет адрес 1[rax] и помещаем его в rdx
        mov  QWORD PTR -16[rbp], rdx    # QWORD PTR -16[rbp] = rdx
        movzx  edx, BYTE PTR [rcx]      # перемещаем в edx с расширением разрядности        
        mov  BYTE PTR -6144[rbp+rax], dl # temp_string[temp_string_len++] = char_line[i]
.L25:
        add  r14d, 1                    # ++i 
.L19:
        mov  eax, r14d                  # eax = r14d
        cdqe                            # преобразование в sign-extend
        cmp  QWORD PTR -32[rbp], rax    # if (i < str_length)
        ja  .L27                        # go to .L27
        mov  rdx, QWORD PTR -6040[rbp]  # |
        lea  rax, -6032[rbp]            # |
        mov  rsi, rdx                   # | printPairs(pairs_array, pairs_array_len)
        mov  rdi, rax                   # |
        call  printPairs                # |
        nop                             # не выполняет никакой операции, занимает место в потоме команд                   
        leave                           # / выход из функции
        ret                             # |
        .size  createDictionary, .-createDictionary
        .globl  main
        .type  main, @function
main:
        push  rbp                 # сохраняем rbp на стек
        mov  rbp, rsp                # rbp := rsp
        sub  rsp, 1008               # rsp -= 1008 (выделяем память для фрейма)
        mov  rdx, QWORD PTR stdin[rip]
        lea  rax, -1008[rbp]         # rax := rbp -1008
        mov  esi, 1000               # esi := 1000
        mov  rdi, rax                # rdi := rax
        call  fgets@PLT           # вызов функции fgets
        lea rdi, -1008[rbp]         # rdi := rbp - 1008
        call  createDictionary    # вызов функции createDictionary
        mov  eax, 0                  # возвращение в eax 0
        leave                       # / выход из функции 
        ret                         # \
