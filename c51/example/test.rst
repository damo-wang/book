                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.3.0 #8604 (Dec 30 2013) (Linux)
                              4 ; This file was generated Wed Dec 13 19:28:30 2017
                              5 ;--------------------------------------------------------
                              6 	.module test
                              7 	.optsdcc -mmcs51 --model-small
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _Delay
                             14 	.globl _CY
                             15 	.globl _AC
                             16 	.globl _F0
                             17 	.globl _RS1
                             18 	.globl _RS0
                             19 	.globl _OV
                             20 	.globl _F1
                             21 	.globl _P
                             22 	.globl _PS
                             23 	.globl _PT1
                             24 	.globl _PX1
                             25 	.globl _PT0
                             26 	.globl _PX0
                             27 	.globl _RD
                             28 	.globl _WR
                             29 	.globl _T1
                             30 	.globl _T0
                             31 	.globl _INT1
                             32 	.globl _INT0
                             33 	.globl _TXD
                             34 	.globl _RXD
                             35 	.globl _P3_7
                             36 	.globl _P3_6
                             37 	.globl _P3_5
                             38 	.globl _P3_4
                             39 	.globl _P3_3
                             40 	.globl _P3_2
                             41 	.globl _P3_1
                             42 	.globl _P3_0
                             43 	.globl _EA
                             44 	.globl _ES
                             45 	.globl _ET1
                             46 	.globl _EX1
                             47 	.globl _ET0
                             48 	.globl _EX0
                             49 	.globl _P2_7
                             50 	.globl _P2_6
                             51 	.globl _P2_5
                             52 	.globl _P2_4
                             53 	.globl _P2_3
                             54 	.globl _P2_2
                             55 	.globl _P2_1
                             56 	.globl _P2_0
                             57 	.globl _SM0
                             58 	.globl _SM1
                             59 	.globl _SM2
                             60 	.globl _REN
                             61 	.globl _TB8
                             62 	.globl _RB8
                             63 	.globl _TI
                             64 	.globl _RI
                             65 	.globl _P1_7
                             66 	.globl _P1_6
                             67 	.globl _P1_5
                             68 	.globl _P1_4
                             69 	.globl _P1_3
                             70 	.globl _P1_2
                             71 	.globl _P1_1
                             72 	.globl _P1_0
                             73 	.globl _TF1
                             74 	.globl _TR1
                             75 	.globl _TF0
                             76 	.globl _TR0
                             77 	.globl _IE1
                             78 	.globl _IT1
                             79 	.globl _IE0
                             80 	.globl _IT0
                             81 	.globl _P0_7
                             82 	.globl _P0_6
                             83 	.globl _P0_5
                             84 	.globl _P0_4
                             85 	.globl _P0_3
                             86 	.globl _P0_2
                             87 	.globl _P0_1
                             88 	.globl _P0_0
                             89 	.globl _B
                             90 	.globl _ACC
                             91 	.globl _PSW
                             92 	.globl _IP
                             93 	.globl _P3
                             94 	.globl _IE
                             95 	.globl _P2
                             96 	.globl _SBUF
                             97 	.globl _SCON
                             98 	.globl _P1
                             99 	.globl _TH1
                            100 	.globl _TH0
                            101 	.globl _TL1
                            102 	.globl _TL0
                            103 	.globl _TMOD
                            104 	.globl _TCON
                            105 	.globl _PCON
                            106 	.globl _DPH
                            107 	.globl _DPL
                            108 	.globl _SP
                            109 	.globl _P0
                            110 	.globl _tab
                            111 ;--------------------------------------------------------
                            112 ; special function registers
                            113 ;--------------------------------------------------------
                            114 	.area RSEG    (ABS,DATA)
   0000                     115 	.org 0x0000
                     0080   116 _P0	=	0x0080
                     0081   117 _SP	=	0x0081
                     0082   118 _DPL	=	0x0082
                     0083   119 _DPH	=	0x0083
                     0087   120 _PCON	=	0x0087
                     0088   121 _TCON	=	0x0088
                     0089   122 _TMOD	=	0x0089
                     008A   123 _TL0	=	0x008a
                     008B   124 _TL1	=	0x008b
                     008C   125 _TH0	=	0x008c
                     008D   126 _TH1	=	0x008d
                     0090   127 _P1	=	0x0090
                     0098   128 _SCON	=	0x0098
                     0099   129 _SBUF	=	0x0099
                     00A0   130 _P2	=	0x00a0
                     00A8   131 _IE	=	0x00a8
                     00B0   132 _P3	=	0x00b0
                     00B8   133 _IP	=	0x00b8
                     00D0   134 _PSW	=	0x00d0
                     00E0   135 _ACC	=	0x00e0
                     00F0   136 _B	=	0x00f0
                            137 ;--------------------------------------------------------
                            138 ; special function bits
                            139 ;--------------------------------------------------------
                            140 	.area RSEG    (ABS,DATA)
   0000                     141 	.org 0x0000
                     0080   142 _P0_0	=	0x0080
                     0081   143 _P0_1	=	0x0081
                     0082   144 _P0_2	=	0x0082
                     0083   145 _P0_3	=	0x0083
                     0084   146 _P0_4	=	0x0084
                     0085   147 _P0_5	=	0x0085
                     0086   148 _P0_6	=	0x0086
                     0087   149 _P0_7	=	0x0087
                     0088   150 _IT0	=	0x0088
                     0089   151 _IE0	=	0x0089
                     008A   152 _IT1	=	0x008a
                     008B   153 _IE1	=	0x008b
                     008C   154 _TR0	=	0x008c
                     008D   155 _TF0	=	0x008d
                     008E   156 _TR1	=	0x008e
                     008F   157 _TF1	=	0x008f
                     0090   158 _P1_0	=	0x0090
                     0091   159 _P1_1	=	0x0091
                     0092   160 _P1_2	=	0x0092
                     0093   161 _P1_3	=	0x0093
                     0094   162 _P1_4	=	0x0094
                     0095   163 _P1_5	=	0x0095
                     0096   164 _P1_6	=	0x0096
                     0097   165 _P1_7	=	0x0097
                     0098   166 _RI	=	0x0098
                     0099   167 _TI	=	0x0099
                     009A   168 _RB8	=	0x009a
                     009B   169 _TB8	=	0x009b
                     009C   170 _REN	=	0x009c
                     009D   171 _SM2	=	0x009d
                     009E   172 _SM1	=	0x009e
                     009F   173 _SM0	=	0x009f
                     00A0   174 _P2_0	=	0x00a0
                     00A1   175 _P2_1	=	0x00a1
                     00A2   176 _P2_2	=	0x00a2
                     00A3   177 _P2_3	=	0x00a3
                     00A4   178 _P2_4	=	0x00a4
                     00A5   179 _P2_5	=	0x00a5
                     00A6   180 _P2_6	=	0x00a6
                     00A7   181 _P2_7	=	0x00a7
                     00A8   182 _EX0	=	0x00a8
                     00A9   183 _ET0	=	0x00a9
                     00AA   184 _EX1	=	0x00aa
                     00AB   185 _ET1	=	0x00ab
                     00AC   186 _ES	=	0x00ac
                     00AF   187 _EA	=	0x00af
                     00B0   188 _P3_0	=	0x00b0
                     00B1   189 _P3_1	=	0x00b1
                     00B2   190 _P3_2	=	0x00b2
                     00B3   191 _P3_3	=	0x00b3
                     00B4   192 _P3_4	=	0x00b4
                     00B5   193 _P3_5	=	0x00b5
                     00B6   194 _P3_6	=	0x00b6
                     00B7   195 _P3_7	=	0x00b7
                     00B0   196 _RXD	=	0x00b0
                     00B1   197 _TXD	=	0x00b1
                     00B2   198 _INT0	=	0x00b2
                     00B3   199 _INT1	=	0x00b3
                     00B4   200 _T0	=	0x00b4
                     00B5   201 _T1	=	0x00b5
                     00B6   202 _WR	=	0x00b6
                     00B7   203 _RD	=	0x00b7
                     00B8   204 _PX0	=	0x00b8
                     00B9   205 _PT0	=	0x00b9
                     00BA   206 _PX1	=	0x00ba
                     00BB   207 _PT1	=	0x00bb
                     00BC   208 _PS	=	0x00bc
                     00D0   209 _P	=	0x00d0
                     00D1   210 _F1	=	0x00d1
                     00D2   211 _OV	=	0x00d2
                     00D3   212 _RS0	=	0x00d3
                     00D4   213 _RS1	=	0x00d4
                     00D5   214 _F0	=	0x00d5
                     00D6   215 _AC	=	0x00d6
                     00D7   216 _CY	=	0x00d7
                            217 ;--------------------------------------------------------
                            218 ; overlayable register banks
                            219 ;--------------------------------------------------------
                            220 	.area REG_BANK_0	(REL,OVR,DATA)
   0000                     221 	.ds 8
                            222 ;--------------------------------------------------------
                            223 ; internal ram data
                            224 ;--------------------------------------------------------
                            225 	.area DSEG    (DATA)
   0008                     226 _tab::
   0008                     227 	.ds 8
                            228 ;--------------------------------------------------------
                            229 ; overlayable items in internal ram 
                            230 ;--------------------------------------------------------
                            231 	.area	OSEG    (OVR,DATA)
                            232 ;--------------------------------------------------------
                            233 ; Stack segment in internal ram 
                            234 ;--------------------------------------------------------
                            235 	.area	SSEG	(DATA)
   0010                     236 __start__stack:
   0010                     237 	.ds	1
                            238 
                            239 ;--------------------------------------------------------
                            240 ; indirectly addressable internal ram data
                            241 ;--------------------------------------------------------
                            242 	.area ISEG    (DATA)
                            243 ;--------------------------------------------------------
                            244 ; absolute internal ram data
                            245 ;--------------------------------------------------------
                            246 	.area IABS    (ABS,DATA)
                            247 	.area IABS    (ABS,DATA)
                            248 ;--------------------------------------------------------
                            249 ; bit data
                            250 ;--------------------------------------------------------
                            251 	.area BSEG    (BIT)
                            252 ;--------------------------------------------------------
                            253 ; paged external ram data
                            254 ;--------------------------------------------------------
                            255 	.area PSEG    (PAG,XDATA)
                            256 ;--------------------------------------------------------
                            257 ; external ram data
                            258 ;--------------------------------------------------------
                            259 	.area XSEG    (XDATA)
                            260 ;--------------------------------------------------------
                            261 ; absolute external ram data
                            262 ;--------------------------------------------------------
                            263 	.area XABS    (ABS,XDATA)
                            264 ;--------------------------------------------------------
                            265 ; external initialized ram data
                            266 ;--------------------------------------------------------
                            267 	.area XISEG   (XDATA)
                            268 	.area HOME    (CODE)
                            269 	.area GSINIT0 (CODE)
                            270 	.area GSINIT1 (CODE)
                            271 	.area GSINIT2 (CODE)
                            272 	.area GSINIT3 (CODE)
                            273 	.area GSINIT4 (CODE)
                            274 	.area GSINIT5 (CODE)
                            275 	.area GSINIT  (CODE)
                            276 	.area GSFINAL (CODE)
                            277 	.area CSEG    (CODE)
                            278 ;--------------------------------------------------------
                            279 ; interrupt vector 
                            280 ;--------------------------------------------------------
                            281 	.area HOME    (CODE)
   0000                     282 __interrupt_vect:
   0000 02 00 06      [24]  283 	ljmp	__sdcc_gsinit_startup
                            284 ;--------------------------------------------------------
                            285 ; global & static initialisations
                            286 ;--------------------------------------------------------
                            287 	.area HOME    (CODE)
                            288 	.area GSINIT  (CODE)
                            289 	.area GSFINAL (CODE)
                            290 	.area GSINIT  (CODE)
                            291 	.globl __sdcc_gsinit_startup
                            292 	.globl __sdcc_program_startup
                            293 	.globl __start__stack
                            294 	.globl __mcs51_genXINIT
                            295 	.globl __mcs51_genXRAMCLEAR
                            296 	.globl __mcs51_genRAMCLEAR
                            297 ;	test.c:7: uchar tab[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
   005F 75 08 01      [24]  298 	mov	_tab,#0x01
   0062 75 09 02      [24]  299 	mov	(_tab + 0x0001),#0x02
   0065 75 0A 04      [24]  300 	mov	(_tab + 0x0002),#0x04
   0068 75 0B 08      [24]  301 	mov	(_tab + 0x0003),#0x08
   006B 75 0C 10      [24]  302 	mov	(_tab + 0x0004),#0x10
   006E 75 0D 20      [24]  303 	mov	(_tab + 0x0005),#0x20
   0071 75 0E 40      [24]  304 	mov	(_tab + 0x0006),#0x40
   0074 75 0F 80      [24]  305 	mov	(_tab + 0x0007),#0x80
                            306 	.area GSFINAL (CODE)
   0077 02 00 03      [24]  307 	ljmp	__sdcc_program_startup
                            308 ;--------------------------------------------------------
                            309 ; Home
                            310 ;--------------------------------------------------------
                            311 	.area HOME    (CODE)
                            312 	.area HOME    (CODE)
   0003                     313 __sdcc_program_startup:
   0003 02 00 97      [24]  314 	ljmp	_main
                            315 ;	return from main will return to caller
                            316 ;--------------------------------------------------------
                            317 ; code
                            318 ;--------------------------------------------------------
                            319 	.area CSEG    (CODE)
                            320 ;------------------------------------------------------------
                            321 ;Allocation info for local variables in function 'Delay'
                            322 ;------------------------------------------------------------
                            323 ;xms                       Allocated to registers 
                            324 ;i                         Allocated to registers r6 r7 
                            325 ;j                         Allocated to registers r4 r5 
                            326 ;------------------------------------------------------------
                            327 ;	test.c:9: void Delay(uint xms)
                            328 ;	-----------------------------------------
                            329 ;	 function Delay
                            330 ;	-----------------------------------------
   007A                     331 _Delay:
                     0007   332 	ar7 = 0x07
                     0006   333 	ar6 = 0x06
                     0005   334 	ar5 = 0x05
                     0004   335 	ar4 = 0x04
                     0003   336 	ar3 = 0x03
                     0002   337 	ar2 = 0x02
                     0001   338 	ar1 = 0x01
                     0000   339 	ar0 = 0x00
   007A AE 82         [24]  340 	mov	r6,dpl
   007C AF 83         [24]  341 	mov	r7,dph
                            342 ;	test.c:15: for (i = xms; i > 0; i--)
   007E                     343 00106$:
   007E EE            [12]  344 	mov	a,r6
   007F 4F            [12]  345 	orl	a,r7
   0080 60 14         [24]  346 	jz	00108$
                            347 ;	test.c:17: for (j = 110; j > 0; j--)
   0082 7C 6E         [12]  348 	mov	r4,#0x6E
   0084 7D 00         [12]  349 	mov	r5,#0x00
   0086                     350 00104$:
   0086 1C            [12]  351 	dec	r4
   0087 BC FF 01      [24]  352 	cjne	r4,#0xFF,00129$
   008A 1D            [12]  353 	dec	r5
   008B                     354 00129$:
   008B EC            [12]  355 	mov	a,r4
   008C 4D            [12]  356 	orl	a,r5
   008D 70 F7         [24]  357 	jnz	00104$
                            358 ;	test.c:15: for (i = xms; i > 0; i--)
   008F 1E            [12]  359 	dec	r6
   0090 BE FF 01      [24]  360 	cjne	r6,#0xFF,00131$
   0093 1F            [12]  361 	dec	r7
   0094                     362 00131$:
   0094 80 E8         [24]  363 	sjmp	00106$
   0096                     364 00108$:
   0096 22            [24]  365 	ret
                            366 ;------------------------------------------------------------
                            367 ;Allocation info for local variables in function 'main'
                            368 ;------------------------------------------------------------
                            369 ;i                         Allocated to registers r7 
                            370 ;------------------------------------------------------------
                            371 ;	test.c:21: void main()
                            372 ;	-----------------------------------------
                            373 ;	 function main
                            374 ;	-----------------------------------------
   0097                     375 _main:
                            376 ;	test.c:31: for (i = 0; i < 8; i++)
   0097                     377 00109$:
   0097 7F 00         [12]  378 	mov	r7,#0x00
   0099                     379 00105$:
                            380 ;	test.c:35: P1 = tab[i];
   0099 EF            [12]  381 	mov	a,r7
   009A 24 08         [12]  382 	add	a,#_tab
   009C F9            [12]  383 	mov	r1,a
   009D 87 90         [24]  384 	mov	_P1,@r1
                            385 ;	test.c:37: Delay(100);
   009F 90 00 64      [24]  386 	mov	dptr,#0x0064
   00A2 C0 07         [24]  387 	push	ar7
   00A4 12 00 7A      [24]  388 	lcall	_Delay
   00A7 D0 07         [24]  389 	pop	ar7
                            390 ;	test.c:31: for (i = 0; i < 8; i++)
   00A9 0F            [12]  391 	inc	r7
   00AA BF 08 00      [24]  392 	cjne	r7,#0x08,00119$
   00AD                     393 00119$:
   00AD 40 EA         [24]  394 	jc	00105$
   00AF 80 E6         [24]  395 	sjmp	00109$
                            396 	.area CSEG    (CODE)
                            397 	.area CONST   (CODE)
                            398 	.area XINIT   (CODE)
                            399 	.area CABS    (ABS,CODE)
