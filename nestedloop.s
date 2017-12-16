.data
prompt1:
        .asciz "Enter a number:\n"
prompt2:
        .asciz "%d"
prompt3:
	.asciz "\n"
format:
        .asciz "%d"
number:
        .word 0
i:
	.word 1
j:
	.word 1
return:
	.word 0


.text
.global main
main:
        ldr r1, address_of_return
        str lr, [r1]

        ldr r0, address_of_prompt1
        bl printf

        ldr r0, address_of_format
        ldr r1, address_of_number
        bl scanf

        ldr r1, address_of_number
        ldr r4, [r1]

        ldr r5, address_of_i
        ldr r5, [r5]
	ldr r6, address_of_j
        ldr r6, [r6]
        
 
	b check_loop
	ldr r0, address_of_prompt3
	bl printf

loop:

	ldr r0, address_of_prompt3
	bl printf
	add r5, r5, #1
	mov r6, #1
	b check_loop2

loop2:
        ldr r0, address_of_prompt2
        mov r1, r6
        bl printf
	add r6, r6, #1

check_loop2:
	cmp r6, r5
	blt loop2

check_loop:
        cmp r5, r4
	ble loop
end:
	mov r0,  r1

        ldr r1, address_of_return
        ldr lr, [r1]
        bx lr


address_of_prompt1: .word prompt1
address_of_prompt2: .word prompt2
address_of_prompt3: .word prompt3
address_of_format: .word format
address_of_number: .word number
address_of_i: .word i
address_of_j: .word j
address_of_return: .word return
.global printf
.global scanf

