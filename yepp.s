	.data

$LC0:	.ascii "\012%s\012\000"

	.text
main:
	addiu $sp,$sp,-80
	sw $31,76($sp)
	sw $fp,72($sp)
	move $fp,$sp
	addiu $2,$fp,28
	sw $2,24($fp)
	
	la $2, stdin
	lw $1, ($2)

	#lui $2, %hi(stdin)
	#lw $2, %lo(stdin)($2)
	# error here
	
	# lui at, %hi(addr)
	# addiu $2, at, %lo(addr)
	# addu $2, $2, $3

	# lui at, %hi(addr)
	# addiu $2, at, %lo(addr)
	
	# original code
	# lui     $2,%hi(stdin)
        # lw      $2,%lo(stdin)($2)	

	#lui $2,%hi(addr)
	#lw $2,%lo(addr)(at)
nop
move $6,$2
li $5,40 # 0x28
lw $4,24($fp)
jal fgets
nop

li $5,32 # 0x20
lw $4,24($fp)
jal delim
nop

lw $5,24($fp)

la $2, $LC0		#lui $2,%hi($LC0)
addiu $4, $2, $LC0  		#addiu $4,$2,%lo($LC0)

jal printf
nop

nop
move $sp,$fp
lw $31,76($sp)
lw $fp,72($sp)
addiu $sp,$sp,80
j $31
nop

delim:
addiu $sp,$sp,-208
sw $31,204($sp)
sw $fp,200($sp)
move $fp,$sp
sw $4,208($fp)
move $2,$5
sb $2,212($fp)
addiu $2,$fp,36
li $3,160 # 0xa0
move $6,$3
move $5,$0
move $4,$2
jal memset
nop

sw $0,24($fp)
lw $4,208($fp)
jal strlen
nop

sw $2,32($fp)
lw $2,24($fp)
nop
sll $2,$2,2
addiu $3,$fp,24
addu $2,$3,$2
lw $3,208($fp)
nop
sw $3,12($2)
li $2,1 # 0x1
sw $2,28($fp)
b $L4
nop

$L6:
lw $2,28($fp)
lw $3,208($fp)
nop
addu $2,$3,$2
lb $2,0($2)
lb $3,212($fp)
nop
bne $3,$2,$L5
nop

lw $2,28($fp)
nop
addiu $2,$2,1
lw $3,208($fp)
nop
addu $3,$3,$2
lw $2,24($fp)
nop
sll $2,$2,2
addiu $4,$fp,24
addu $2,$4,$2
sw $3,12($2)
lw $2,28($fp)
lw $3,208($fp)
nop
addu $2,$3,$2
sb $0,0($2)
lw $2,24($fp)
nop
addiu $2,$2,1
sw $2,24($fp)
$L5:
lw $2,28($fp)
nop
addiu $2,$2,1
sw $2,28($fp)
$L4:
lw $3,28($fp)
lw $2,32($fp)
nop
slt $2,$3,$2
bne $2,$0,$L6
nop

addiu $2,$fp,36
lw $6,24($fp)
move $5,$2
lw $4,208($fp)
jal sort
nop

nop
move $sp,$fp
lw $31,204($sp)
lw $fp,200($sp)
addiu $sp,$sp,208
j $31
nop

$LC1:
.ascii "String -1: %s\012\000"
$LC2:
.ascii "String %d:\000"
sort:
addiu $sp,$sp,-80
sw $31,76($sp)
sw $fp,72($sp)
move $fp,$sp
sw $4,80($fp)
sw $5,84($fp)
sw $6,88($fp)
li $2,167772160 # 0xa000000
sw $2,28($fp)
sw $0,32($fp)
sw $0,36($fp)
sw $0,40($fp)
sw $0,44($fp)
sw $0,48($fp)
sw $0,52($fp)
sw $0,56($fp)
sw $0,60($fp)
sw $0,64($fp)
lw $5,80($fp)
la $2,$LC1	#lui $2,%hi($LC1)
addi addiu $4,$2,%lo($LC1)
jal printf
nop

sw $0,24($fp)
b $L9
nop

$L10:
lw $5,24($fp)
lui $2,%hi($LC2)
addiu $4,$2,%lo($LC2)
jal printf
nop

lw $2,24($fp)
nop
sll $2,$2,2
lw $3,84($fp)
nop
addu $2,$3,$2
lw $2,0($2)
nop
addiu $2,$2,1
move $4,$2
jal puts
nop

lw $2,24($fp)
nop
addiu $2,$2,1
sw $2,24($fp)
$L9:
lw $3,24($fp)
lw $2,88($fp)
nop
slt $2,$3,$2
bne $2,$0,$L10
nop

addiu $2,$fp,28
move $5,$2
lw $4,80($fp)
jal strcpy
nop

nop
move $sp,$fp
lw $31,76($sp)
lw $fp,72($sp)
addiu $sp,$sp,80
j $31
nop
