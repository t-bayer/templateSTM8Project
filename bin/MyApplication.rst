                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Sat Jun  9 15:01:20 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module MyApplication
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _add
                                     14 	.globl _getBlinkDelay
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; Stack segment in internal ram 
                                     25 ;--------------------------------------------------------
                                     26 	.area	SSEG
      0080F8                         27 __start__stack:
      0080F8                         28 	.ds	1
                                     29 
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 ;--------------------------------------------------------
                                     35 ; interrupt vector 
                                     36 ;--------------------------------------------------------
                                     37 	.area HOME
      008000                         38 __interrupt_vect:
      008000 82 00 80 83             39 	int s_GSINIT ;reset
      008004 82 00 00 00             40 	int 0x0000 ;trap
      008008 82 00 00 00             41 	int 0x0000 ;int0
      00800C 82 00 00 00             42 	int 0x0000 ;int1
      008010 82 00 00 00             43 	int 0x0000 ;int2
      008014 82 00 00 00             44 	int 0x0000 ;int3
      008018 82 00 00 00             45 	int 0x0000 ;int4
      00801C 82 00 00 00             46 	int 0x0000 ;int5
      008020 82 00 00 00             47 	int 0x0000 ;int6
      008024 82 00 00 00             48 	int 0x0000 ;int7
      008028 82 00 00 00             49 	int 0x0000 ;int8
      00802C 82 00 00 00             50 	int 0x0000 ;int9
      008030 82 00 00 00             51 	int 0x0000 ;int10
      008034 82 00 00 00             52 	int 0x0000 ;int11
      008038 82 00 00 00             53 	int 0x0000 ;int12
      00803C 82 00 00 00             54 	int 0x0000 ;int13
      008040 82 00 00 00             55 	int 0x0000 ;int14
      008044 82 00 00 00             56 	int 0x0000 ;int15
      008048 82 00 00 00             57 	int 0x0000 ;int16
      00804C 82 00 00 00             58 	int 0x0000 ;int17
      008050 82 00 00 00             59 	int 0x0000 ;int18
      008054 82 00 00 00             60 	int 0x0000 ;int19
      008058 82 00 00 00             61 	int 0x0000 ;int20
      00805C 82 00 00 00             62 	int 0x0000 ;int21
      008060 82 00 00 00             63 	int 0x0000 ;int22
      008064 82 00 00 00             64 	int 0x0000 ;int23
      008068 82 00 00 00             65 	int 0x0000 ;int24
      00806C 82 00 00 00             66 	int 0x0000 ;int25
      008070 82 00 00 00             67 	int 0x0000 ;int26
      008074 82 00 00 00             68 	int 0x0000 ;int27
      008078 82 00 00 00             69 	int 0x0000 ;int28
      00807C 82 00 00 00             70 	int 0x0000 ;int29
                                     71 ;--------------------------------------------------------
                                     72 ; global & static initialisations
                                     73 ;--------------------------------------------------------
                                     74 	.area HOME
                                     75 	.area GSINIT
                                     76 	.area GSFINAL
                                     77 	.area GSINIT
      008083                         78 __sdcc_gs_init_startup:
      008083                         79 __sdcc_init_data:
                                     80 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   81 	ldw x, #l_DATA
      008086 27 07            [ 1]   82 	jreq	00002$
      008088                         83 00001$:
      008088 72 4F 00 00      [ 1]   84 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   85 	decw x
      00808D 26 F9            [ 1]   86 	jrne	00001$
      00808F                         87 00002$:
      00808F AE 00 00         [ 2]   88 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   89 	jreq	00004$
      008094                         90 00003$:
      008094 D6 80 F7         [ 1]   91 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]   92 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]   93 	decw	x
      00809B 26 F7            [ 1]   94 	jrne	00003$
      00809D                         95 00004$:
                                     96 ; stm8_genXINIT() end
                                     97 	.area GSFINAL
      00809D CC 80 80         [ 2]   98 	jp	__sdcc_program_startup
                                     99 ;--------------------------------------------------------
                                    100 ; Home
                                    101 ;--------------------------------------------------------
                                    102 	.area HOME
                                    103 	.area HOME
      008080                        104 __sdcc_program_startup:
      008080 CC 80 AC         [ 2]  105 	jp	_main
                                    106 ;	return from main will return to caller
                                    107 ;--------------------------------------------------------
                                    108 ; code
                                    109 ;--------------------------------------------------------
                                    110 	.area CODE
                                    111 ;	src/MyApplication.c: 5: int main(){
                                    112 ;	-----------------------------------------
                                    113 ;	 function main
                                    114 ;	-----------------------------------------
      0080AC                        115 _main:
      0080AC 52 04            [ 2]  116 	sub	sp, #4
                                    117 ;	src/MyApplication.c: 7: uint32_t maxDelay = getBlinkDelay();
      0080AE CD 80 A6         [ 4]  118 	call	_getBlinkDelay
      0080B1 1F 03            [ 2]  119 	ldw	(0x03, sp), x
      0080B3 17 01            [ 2]  120 	ldw	(0x01, sp), y
                                    121 ;	src/MyApplication.c: 8: add(3,5);
      0080B5 4B 05            [ 1]  122 	push	#0x05
      0080B7 4B 00            [ 1]  123 	push	#0x00
      0080B9 4B 03            [ 1]  124 	push	#0x03
      0080BB 4B 00            [ 1]  125 	push	#0x00
      0080BD CD 80 A0         [ 4]  126 	call	_add
      0080C0 5B 04            [ 2]  127 	addw	sp, #4
                                    128 ;	src/MyApplication.c: 9: GPIOB->DDR |= GPIO_PIN_5;
      0080C2 AE 50 07         [ 2]  129 	ldw	x, #0x5007
      0080C5 F6               [ 1]  130 	ld	a, (x)
      0080C6 AA 20            [ 1]  131 	or	a, #0x20
      0080C8 F7               [ 1]  132 	ld	(x), a
                                    133 ;	src/MyApplication.c: 10: GPIOB->CR1 |= GPIO_PIN_5;
      0080C9 AE 50 08         [ 2]  134 	ldw	x, #0x5008
      0080CC F6               [ 1]  135 	ld	a, (x)
      0080CD AA 20            [ 1]  136 	or	a, #0x20
      0080CF F7               [ 1]  137 	ld	(x), a
                                    138 ;	src/MyApplication.c: 13: while(1){
      0080D0                        139 00103$:
                                    140 ;	src/MyApplication.c: 14: GPIOB->ODR ^= GPIO_PIN_5;
      0080D0 AE 50 05         [ 2]  141 	ldw	x, #0x5005
      0080D3 F6               [ 1]  142 	ld	a, (x)
      0080D4 A8 20            [ 1]  143 	xor	a, #0x20
      0080D6 F7               [ 1]  144 	ld	(x), a
                                    145 ;	src/MyApplication.c: 15: for(delayCounter=0; delayCounter<maxDelay;delayCounter++);
      0080D7 5F               [ 1]  146 	clrw	x
      0080D8 90 5F            [ 1]  147 	clrw	y
      0080DA                        148 00106$:
      0080DA 13 03            [ 2]  149 	cpw	x, (0x03, sp)
      0080DC 90 9F            [ 1]  150 	ld	a, yl
      0080DE 12 02            [ 1]  151 	sbc	a, (0x02, sp)
      0080E0 90 9E            [ 1]  152 	ld	a, yh
      0080E2 12 01            [ 1]  153 	sbc	a, (0x01, sp)
      0080E4 24 EA            [ 1]  154 	jrnc	00103$
      0080E6 1C 00 01         [ 2]  155 	addw	x, #0x0001
      0080E9 90 9F            [ 1]  156 	ld	a, yl
      0080EB A9 00            [ 1]  157 	adc	a, #0x00
      0080ED 90 02            [ 1]  158 	rlwa	y
      0080EF A9 00            [ 1]  159 	adc	a, #0x00
      0080F1 90 95            [ 1]  160 	ld	yh, a
      0080F3 20 E5            [ 2]  161 	jra	00106$
      0080F5 5B 04            [ 2]  162 	addw	sp, #4
      0080F7 81               [ 4]  163 	ret
                                    164 	.area CODE
                                    165 	.area INITIALIZER
                                    166 	.area CABS (ABS)
