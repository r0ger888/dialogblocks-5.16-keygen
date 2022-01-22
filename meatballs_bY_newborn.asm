AboutProc		PROTO		:DWORD,:DWORD,:DWORD,:DWORD
AboutInit		PROTO		:DWORD

.data
AboutTitle		db "newborn's text effect",0

lpString        dd offset AboutText

AboutText 		db "     PERYFERiAH tEAM PrEsEnT",0
				db "  KeyGen for DialogBlocks 5.16",13
				db "   (C) Anthemion Software Ltd",13,13
				
				db "Cracker    : GRUiA",13
				db "Protection : MD5",13
				db "Date       : 22.o1.2o21",13
				db "Music      : <FamiCommodore>",0
				
				db "10x go 2 :",0
				
				db "   r0ger 4 CooL GFX",13
				db "   KF2015 4 Music",13
				db "   newborn 4 CooL About Template",13
				db "   Bartman 4 AhxPlayerLib",0
				
				db "Gr33tZ 2 :",0
				
				db "   Al0hA..................[PRF]",13
				db "   B@TRyNU................[PRF]",13
				db "   r0ger..................[PRF]",13
				db "   MaryNello..............[PRF]",13
				db "   s0r3l..................[PRF]",13
				db "   sabYn..................[PRF]",13
				db "   WeeGee.................[PRF]",13
				db "   zzLaTaNN...............[PRF]",0
				
				db "   NoNNy..................[PRF]",13
				db "   st3fan(C)ADR!AN........[PRF]",13
				db "   DAViiiiDDDDDDD.........[PRF]",13
				db "   ShTEFY.................[PRF]",13
				db "   QueenAntonia...........[PRF]",13
				db "   r0bica.................[PRF]",13
				db "   ShoGun.................[PRF]",13
				db "   yMRAN..................[PRF]",0
				
				db "but also :",0
				
				db "   Cachito...............[tSRh]",13
				db "   Roentgen..............[tSRh]",13
				db "   Talers................[tSRh]",13
				db "   Jowy..................[tSRh]",13
				db "   Xylitol................[RED]",13
				db "   rooster1..............[tSRh]",13
				db "   kao.........................",13
				db "   Razorblade1979........[URET]",13
				db "   Arttomov..............[URET]",0
				
				db "   Sangavi...............[tSRh]",13
				db "   de!...................[tSRh]",13
				db "   CodeFinder............[tSRh]",13
				db "   ByTESRam..............[tSRh]",13
				db "   Vinnu.................[tSRh]",13
				db "   p4r4d0x...............[tSRh]",13
				db "   EarthMan123..........[AT4RE]",13
				db "   TeRcO................[AT4RE]",0
				
				db "     ... and mainly the whole",13
				db "   tSRh , exelab , exetools and",13
				db "   revteam.online communities =)",0
				
				db "       u can contact us at :",0
				
				db "   [ insta   : @r0gerica......]",13
				db "   [           @bobo.crt......]",13
				db "   [ discord : r0gerica#2649..]",13
				db "   [ github  : r0gerica.......]",13
				db "   [ telegram: t.me/r0ger888..]",0
				
				db "       fuck da ripperz . :E",0
				
				db 0

TextLineSize	equ	9 ; <-- same as in the CERBER's aboutbox , make sure to update this line height after changing the font. [ r0ger ]
TextColor		equ	0FFFFFFh ;0000B3FFh
TextStopPos		equ	43h
TextLeft		equ	125

AboutFont       LOGFONT  <8,6,0,0,FW_DONTCARE,0,0,0,DEFAULT_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,0,'terminal'>
ModuleName 		db "user32.dll",0
ProcName 		db "SetLayeredWindowAttributes",0
m_counter       dd 271h                 
m_hDC           dd 0                    
dword_407608    dd 69069             

; array of dwords...

dword_407909    dd 0                    
dword_40790D    dd 0                    
dword_407911    dd 0                    
dword_407915    dd 0                    
dword_407919    dd 0                    
dword_40791D    dd 0                    
dword_407921    dd 0                    
dword_407925    dd 0                    

dword_407436    dd 0                    
dword_40743A    dd 0                    

; calculations of meatball render

flt_40743E      dd 600.0                
flt_407442      dd 15.0                 
flt_407446      dd 500.0                
flt_40744A      dd 20.0                
flt_40744E      dd 200.0                
flt_407452      dd 12.0                 
flt_407456      dd 400.0                
flt_40745A      dd 20.0                 
flt_40745E      dd 850.0                
flt_407462      dd 25.0                 
flt_407466      dd 650.0                
flt_40746A      dd 15.0                 
flt_40746E      dd 840.0                
flt_407472      dd 20.0                 
flt_407476      dd 640.0               
flt_40747A      dd 10.0                

.data?

dword_4074AF 	dd ?
dword_4074A3 	dd ?

dword_4078FD    dd ?                    
dword_407901    dd ?                    
dword_407905    dd ?                    
dword_4078F5 dd ?
m_array_0x270   dd 270h dup(?) 
				dd 1000h dup (?)                                      
hWndd		dd	?
.code

ZeroMemoryX      proc near               

arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch

                push    ebp
                mov     ebp, esp
                push    edi
                cld
                mov     edi, [ebp+arg_0]
                mov     ecx, [ebp+arg_4]
                shr     ecx, 2
                xor     eax, eax
                jecxz   short loc_4022F5
                rep stosd

loc_4022F5:                            
                mov     ecx, [ebp+arg_4]
                and     ecx, 3
                jecxz   short loc_4022FF
                rep stosb

loc_4022FF:                             
                pop     edi
                leave
                retn    8
ZeroMemoryX      endp


sub_4022C0      proc near               

arg_0           = dword ptr  8 ; <---- these needed to be added along 
                               ; <---- with these stack pointers (ebp & esp)
                push    ebp    ; <---- , and without them the aboutbox
                mov     ebp, esp ; <-- will crash . [ r0ger ]
                mov     eax, 156h
                cdq
                mul     [ebp+arg_0]
                add     eax, 1Fh
                and     eax, 0FFFFFFE0h
                shr     eax, 3
                cdq
                mov     ecx, 7Dh ; '}'
                mul     ecx
                leave
                retn    4
sub_4022C0      endp


AboutInit proc near hdc:DWORD        
LOCAL pbmi : BITMAPINFO
;LOCAL hdc:DWORD

                push    2Ch ; ','
                lea     eax, pbmi
                push    eax
                call    ZeroMemoryX
                mov     [pbmi.bmiHeader.biSize], 28h ; '('
                push    20h ; ' '
                call    sub_4022C0
                mov     [pbmi.bmiHeader.biSizeImage], eax
                mov     [pbmi.bmiHeader.biPlanes], 1
                mov     [pbmi.bmiHeader.biBitCount], 20h ; ' '
                mov     [pbmi.bmiHeader.biWidth], 156h
                mov     [pbmi.bmiHeader.biHeight], 7Dh ; '}'
                mov     dword_4078F5, 0
                push    0               ; offset
                push    0               ; hSection
                push    offset dword_4078F5 ; ppvBits
                push    0               ; usage
                lea     eax, pbmi
                push    eax             ; pbmi
                push    0               ; hdc
                call    CreateDIBSection
                push    eax
                push    [hdc]       ; hdc
                call    CreateCompatibleDC
                mov     m_hDC, eax
                pop     edx
                invoke SelectObject,eax,edx
                invoke CreateFontIndirect,addr AboutFont
                invoke SelectObject,m_hDC,eax
                invoke SetBkMode,m_hDC,1
                invoke SetTextColor,m_hDC,TextColor
                invoke SetTextAlign,m_hDC,TA_BASELINE
                xor eax,eax
                ret
AboutInit endp


FadeInDlg      proc near hWnd : dword               
                push    0FFFFFFECh      ; nIndex
                push    [hWnd]      ; hWnd
                call    GetWindowLongA
                or      eax, 80000h
                push    eax             ; dwNewLong
                push    0FFFFFFECh      ; nIndex
                push    [hWnd]      ; hWnd
                call    SetWindowLongA
                push    offset ModuleName ; "User32.dll"
                call    GetModuleHandleA
                push    offset ProcName ; "SetLayeredWindowAttributes"
                push    eax             ; hModule
                call    GetProcAddress
                mov     dword_4074AF, eax
                push    2
                push    0
                push    0
                push    [hWnd]
                call    dword_4074AF
                mov     dword_4074A3, 5Ah ; 'Z'
                push    SW_SHOWNA               ; nCmdShow Displays the window in its current size and position. This value is similar to SW_SHOW, except that the window is not activated. [ kao ]
                push    [hWnd]      ; hWnd
                call    ShowWindow

loc_4014B1:                             ; CODE XREF: sub_401457+89?j
                push    3
                push    dword_4074A3
                push    dword_4074A3
                push    [hWnd]
                call    dword_4074AF
                push    0Ah             ; dwMilliseconds
                call    Sleep
                add     dword_4074A3, 0Fh
                cmp     dword_4074A3, 0FFh
                jnz     short loc_4014B1
                push    2
                push    0FFh
                push    0
                push    [hWnd]
                call    dword_4074AF
                ret
FadeInDlg      endp


AboutProc proc yWnd:DWORD, uMsgz:DWORD, wParamz:DWORD, lParamz:DWORD
LOCAL Paint:PAINTSTRUCT
LOCAL Rekt:RECT
LOCAL hColor:DWORD

                cmp     [uMsgz], 110h
                jnz     short loc_4021A8
                invoke  SetWindowText,[yWnd],addr AboutTitle
             ;   invoke  FadeInDlg,[yWnd]
                invoke  GetDC,[yWnd]
                call  GetTickCount
                push    eax
                call    Dwordshit
                mov     dword_4078FD, 7Dh ; '}'
                mov     dword_407901, 0
                mov     dword_407905, 0
                invoke  GetWindowDC,[yWnd]
                push eax
                call AboutInit
             	invoke  SetTimer,[yWnd],1,1,0
                jmp     return0
; ---------------------------------------------------------------------------

loc_4021A8:                             
                cmp     [uMsgz], WM_TIMER
                jnz     short loc_4021EF
;locWM_TIMER:
                cmp     [wParamz], 1
                jnz     return0
                call    timerProc
                mov     [Rekt.left], 0
                mov     [Rekt.top], 0
                mov     [Rekt.right], 156h
                mov     [Rekt.bottom], 7Dh ; '}'
                push    0               ; bErase
                lea     eax, [Rekt]
                push    eax             ; lpRect
                push    [yWnd]      ; hWnd
                call    InvalidateRect
                jmp     return0
; ---------------------------------------------------------------------------

loc_4021EF:                            
                cmp     [uMsgz], WM_PAINT
                jnz     short loc_40223D
;locWM_PAINT:
                lea     eax, [Paint]
              	invoke  BeginPaint,[yWnd],eax
                push    eax
                lea     eax, [Rekt]
             	invoke  GetClientRect,[yWnd],eax
                pop     eax
              	invoke  BitBlt,eax,0,0,153h,79h,m_hDC,0,0,0CC0020h
                lea     eax, [Paint]
              	invoke  EndPaint,[yWnd],eax
                jmp     return0
; ---------------------------------------------------------------------------

loc_40223D:                           
                cmp     [uMsgz], WM_CTLCOLORSTATIC
                jnz     short loc_402266
;locWM_CTLCOLORSTATIC:                   
                invoke  SetBkMode,[wParamz],1
                invoke  SetTextColor,[wParamz],0FFFFFFh
                mov     eax, [hColor]
                leave
                retn    10h
; ---------------------------------------------------------------------------
                jmp     short return0
; ---------------------------------------------------------------------------

loc_402266:                             
                cmp     [uMsgz], WM_CTLCOLORDLG
                jnz     short loc_402278
             	mov eax,[wParamz]
             	invoke SetBkColor,eax,Black
             	invoke GetStockObject,BLACK_BRUSH
             	ret
; ---------------------------------------------------------------------------
                jmp     short return0
; ---------------------------------------------------------------------------

loc_402278:                             
                cmp     [uMsgz], WM_LBUTTONDOWN
                jnz     short loc_402295
               invoke SendMessage, [yWnd], WM_NCLBUTTONDOWN, HTCAPTION, 0
                jmp     short return0
; ---------------------------------------------------------------------------

loc_402295:                             
                cmp     [uMsgz], WM_RBUTTONDOWN
                jnz     short return0
                invoke EndDialog,[yWnd],0
                invoke ShowWindow,xWnd,SW_SHOW

return0:                                
                            
                xor     eax, eax
                leave
                retn 10h

AboutProc endp


Dwordshit proc near   

arg_0           = dword ptr  8

                push    ebp
                mov     ebp, esp
                push    edi
                lea     edi, m_array_0x270
                mov     eax, [ebp+arg_0]
                mov     [edi], eax
                mov     m_counter, 1

loc_401596:                             
                add     edi, 4
                mul     dword_407608
                mov     [edi], eax
                inc     m_counter
                cmp     m_counter, 270h
                jnz     short loc_401596
                pop     edi
                leave
                retn    4
Dwordshit endp

BallCalc    proc near   
      
                call    GetTickCount
                mov     dword_40743A, eax
                fild    dword_40743A
                fdiv    flt_40743E
                fcos
                fmul    flt_407442
                fistp   dword_407436
                push    dword_407436
                pop     dword_407909
                add     dword_407909, 32h ; '2'


                fild    dword_40743A
                fdiv    flt_407446
                fsin
                fmul    flt_40744A
                fistp   dword_407436
                push    dword_407436
                pop     dword_40790D
                add     dword_40790D, 28h ; '('


                fild    dword_40743A
                fdiv    flt_40744E
                fcos
                fmul    flt_407452
                fistp   dword_407436
                push    dword_407436
                pop     dword_407911
                add     dword_407911, 32h ; '2'


                fild    dword_40743A
                fdiv    flt_407456
                fsin
                fmul    flt_40745A
                fistp   dword_407436
                push    dword_407436
                pop     dword_407915


                add     dword_407915, 3Ch ; '<'
                fild    dword_40743A
                fdiv    flt_40745E
                fcos
                fmul    flt_407462
                fistp   dword_407436
                push    dword_407436
                pop     dword_407919
                add     dword_407919, 3Ch ; '<'
                fild    dword_40743A
                fdiv    flt_407466
                fsin
                fmul    flt_40746A
                fistp   dword_407436
                push    dword_407436
                pop     dword_40791D
                add     dword_40791D, 32h ; '2'
                fild    dword_40743A
                fdiv    flt_40746E
                fcos
                fmul    flt_407472
                fistp   dword_407436
                push    dword_407436
                pop     dword_407921
                add     dword_407921, 46h ; 'F'
                fild    dword_40743A
                fdiv    flt_407476
                fsin
                fmul    flt_40747A
                fistp   dword_407436
                push    dword_407436
                pop     dword_407925
                add     dword_407925, 3Ch ; '<'
                retn
BallCalc    endp

MeatballzProc      proc near              

arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch

                push    ebp
                mov     ebp, esp
                push    esi
                push    edi
                push    ebx
                mov     esi, offset dword_407909
                mov     edi, 4
                xor     ebx, ebx

loc_402455:                             
                mov     eax, [esi]
                sub     eax, [ebp+arg_0]
                cdq
                mul     eax
                mov     ecx, eax
                mov     eax, [esi+4]
                sub     eax, [ebp+arg_4]
                cdq
                mul     eax
                add     eax, ecx
                or      eax, eax
                jnz     short loc_40247C
                mov     eax, 4B4C51h
                pop     ebx
                pop     edi
                pop     esi
                leave
                retn    8
; ---------------------------------------------------------------------------
                jmp     short loc_4024B2
; ---------------------------------------------------------------------------

loc_40247C:                             ; CODE XREF: sub_402443+29?j
                xor     edx, edx
                mov     ecx, eax
                cmp     edi, 1
                jnz     short loc_40248C
                mov     eax, 0EA60h ; first meatball size [ r0ger ]
                jmp     short loc_4024AE
; ---------------------------------------------------------------------------

loc_40248C:                             ; CODE XREF: sub_402443+40?j
                cmp     edi, 2
                jnz     short loc_402498
                mov     eax, 11170h ; second meatball size [ r0ger ]
                jmp     short loc_4024AE
; ---------------------------------------------------------------------------

loc_402498:                             ; CODE XREF: sub_402443+4C?j
                cmp     edi, 3
                jnz     short loc_4024A4
                mov     eax, 186A0h ; third meatball size [ r0ger ]
                jmp     short loc_4024AE
; ---------------------------------------------------------------------------

loc_4024A4:                             ; CODE XREF: sub_402443+58?j
                cmp     edi, 4
                jnz     short loc_4024AE
                mov     eax, 1D4C0h ; fourth meatball size [ r0ger ]

loc_4024AE:                             ; CODE XREF: sub_402443+47?j
                                        ; sub_402443+53?j ...
                div     ecx
                add     ebx, eax

loc_4024B2:                             ; CODE XREF: sub_402443+37?j
                add     esi, 8
                dec     edi
                jnz     short loc_402455
                mov     eax, ebx
                pop     ebx
                pop     edi
                pop     esi
                leave
                retn    8
MeatballzProc      endp



timerProc       proc near               
                push    edi
                push    esi
                push    ebx
                call    BallCalc

		; create pixel noise
                cld
                mov     edi, dword_4078F5
                mov     ecx, 0A6FEh
                xor     ebx, ebx
                xor     esi, esi

loc_40264C:                             ; CODE XREF: timerProc+51?j
                or      ebx, ebx
                jz      short loc_402661
                or      esi, esi
                jz      short loc_402661
                cmp     ebx, 155h
                jz      short loc_402661
                cmp     esi, 7Ch ; '|'
                jnz     short loc_402665

loc_402661:                             ; CODE XREF: timerProc+1A?j
                                        ; timerProc+1E?j ...
                xor     eax, eax
                jmp     short loc_402677
; ---------------------------------------------------------------------------

loc_402665:                             ; CODE XREF: timerProc+2B?j
                push    ecx
                push   	30h ; <-- static noise size
                call    sub_4015B8

                add     al, 3Ch ; '<'
                mov     ah, al
                shl     eax, 28h
                mov     al, ah
                pop     ecx

loc_402677:                             ; CODE XREF: timerProc+2F?j
                stosd
                inc     ebx
                cmp     ebx, 156h
                jnz     short loc_402684
                xor     ebx, ebx
                inc     esi

loc_402684:                             ; CODE XREF: timerProc+4B?j
                dec     ecx
                jnz     short loc_40264C



		; do meatball stuff?
                mov     edi, dword_4078F5
                mov     ecx, 0A6FEh
                xor     ebx, ebx
                xor     esi, esi

loc_402696:                             ; CODE XREF: timerProc+BD?j
                inc     ebx
                cmp     ebx, 156h
                jnz     short loc_4026A2
                xor     ebx, ebx
                inc     esi

loc_4026A2:                             ; CODE XREF: timerProc+69?j
                cmp     ebx, 1
                jbe     short loc_4026ED
                cmp     esi, 0
                jbe     short loc_4026ED
                cmp     ebx, 155h
                jnb     short loc_4026ED
                cmp     esi, 7Ch ; '|'
                jnb     short loc_4026ED
                push    ecx
                push    esi
                push    ebx
                call    MeatballzProc

                cmp     eax, 1F4h
                jbe     short loc_4026D5
                mov     eax, [edi]
                and     eax, 0FEFEFEh;002824DBh ; meatball in color (original - 0FFh) [ r0ger ]
                shr     eax, 1
                mov     [edi], eax
                jmp     short loc_4026EC
; ---------------------------------------------------------------------------

loc_4026D5:                             ; CODE XREF: timerProc+92?j
                cmp     eax, 190h
                jbe     short loc_4026EC
                mov     eax, [edi]
                and     eax, 0000000h ; meatball border color 1 (original - 0FF0000h) [ r0ger ]
                sub     eax, 000505FFh; meatball border color 2 (original - 0FF0000h) [ r0ger ]
                shr     eax, 1
                mov     [edi], eax

loc_4026EC:                             ; CODE XREF: timerProc+9F?j
                                        ; timerProc+A6?j
                pop     ecx

loc_4026ED:                             ; CODE XREF: timerProc+71?j
                                        ; timerProc+76?j ...
                add     edi, 4
                dec     ecx
                jnz     short loc_402696
                call    TextProc
                mov     ecx, TextStopPos ; <-- text position where it needs to pause scrolling
                sub     ecx, eax
                cmp     dword_4078FD, ecx
                jnz     short loc_40272F
                mov     ecx, eax
                shl     ecx, 3 ; <-- delay time of text credit roll.
                add     ecx, 5
                cmp     dword_407901, ecx
                jnb     short loc_402725
                inc     dword_407901
                inc     dword_4078FD
                jmp     short loc_40272F
; ---------------------------------------------------------------------------

loc_402725:                             ; CODE XREF: timerProc+E1?j
                mov     dword_407901, 0

loc_40272F:                             ; CODE XREF: timerProc+D1?j
                                        ; timerProc+EF?j
                cld
                dec     dword_4078FD
                add     eax, eax
                not     eax
                cmp     dword_4078FD, eax
                jnz     short loc_40277B
                mov     edi, lpString
                xor     eax, eax
                or      ecx, 0FFFFFFFFh
                repne scasb
                cmp     byte ptr [edi], 0
                jz      short loc_40275C
                mov     lpString, edi
                jmp     short loc_402771
; ---------------------------------------------------------------------------

loc_40275C:                             ; CODE XREF: timerProc+11E?j
                push    offset AboutText 
                pop     lpString
                mov     dword_407905, 0

loc_402771:                             ; CODE XREF: timerProc+126?j
                mov     dword_4078FD, 7Dh ; '}'
;@
loc_40277B:                             ; CODE XREF: timerProc+10C?j
                pop     ebx
                pop     esi
                pop     edi
                retn
timerProc       endp

sub_4015B8      proc near               ; CODE XREF: timerProc+34?p

var_4           = dword ptr -4
arg_0           = dword ptr  8

                push    ebp
                mov     ebp, esp
                add     esp, 0FFFFFFFCh
                push    esi
                push    edi
                push    ebx
                lea     edi, m_array_0x270
                cmp     m_counter, 270h
                jb      loc_401698

                cmp     m_counter, 271h
                jnz     short loc_4015ED

                push    1105h
                call    Dwordshit

loc_4015ED:                             ; CODE XREF: sub_4015B8+29?j
                mov     [ebp+var_4], 0
                mov     esi, edi

loc_4015F6:                             ; CODE XREF: sub_4015B8+7B?j
                mov     eax, [esi]
                and     eax, 80000000h
                mov     ebx, [esi+4]
                and     ebx, 7FFFFFFFh
                or      eax, ebx
                mov     ecx, eax
                shr     eax, 1
                mov     edx, esi
                add     edx, 634h
                mov     ebx, [edx]
                xor     eax, ebx
                and     ecx, 1
                or      ecx, ecx
                jz      short loc_401624
                xor     eax, 9908B0DFh

loc_401624:                             ; CODE XREF: sub_4015B8+65?j
                mov     [esi], eax
                add     esi, 4
                inc     [ebp+var_4]
                cmp     [ebp+var_4], 0E3h ; 'ã'
                jnz     short loc_4015F6

loc_401635:                             ; CODE XREF: sub_4015B8+BA?j
                mov     eax, [esi]
                and     eax, 80000000h
                mov     ebx, [esi+4]
                and     ebx, 7FFFFFFFh
                or      eax, ebx
                mov     ecx, eax
                shr     eax, 1
                mov     edx, esi
                add     edx, 0FFFFFC74h
                mov     ebx, [edx]
                xor     eax, ebx
                and     ecx, 1
                or      ecx, ecx
                jz      short loc_401663
                xor     eax, 9908B0DFh

loc_401663:                             ; CODE XREF: sub_4015B8+A4?j
                mov     [esi], eax
                add     esi, 4
                inc     [ebp+var_4]
                cmp     [ebp+var_4], 26Fh
                jnz     short loc_401635
                mov     edx, edi
                add     edx, 630h
                mov     ebx, [edx]
                xor     eax, ebx
                and     ecx, 1
                or      ecx, ecx
                jz      short loc_40168C
                xor     eax, 9908B0DFh

loc_40168C:                             ; CODE XREF: sub_4015B8+CD?j
                mov     [esi], eax
                mov     m_counter, 0

loc_401698:                             ; CODE XREF: sub_4015B8+19?j
                mov     esi, edi
                mov     eax, m_counter
                inc     m_counter
                shl     eax, 2
                add     esi, eax
                mov     eax, [esi]
                ;xor     eax, eax ; if you add this it will remove its tv static effect. [ r0ger ]
                mov     ebx, eax
                shr     eax, 0Bh
                xor     ebx, eax
                mov     eax, ebx
                shl     eax, 7
                and     eax, 9D2C5680h
                xor     ebx, eax
                mov     eax, ebx
                shl     eax, 0Fh
                and     eax, 0EFC60000h
                xor     ebx, eax
                mov     eax, ebx
                shr     eax, 12h
                xor     eax, ebx
                xor     edx, edx
                div     [ebp+arg_0]
                mov     eax, edx
                pop     ebx
                pop     edi
                pop     esi
                leave
                retn    4
sub_4015B8      endp

TextProc      proc near               ; CODE XREF: timerProc:textScroller?p
LOCAL y:DWORD

                push    esi
                push    edi
                push    ebx
                mov     esi, lpString
                push    esi             ; lpString
                call    lstrlenA
                mov     ebx, eax
                inc     ebx
                push    dword_4078FD
                pop     y
                mov     edi, esi

loc_4023FA:                             ; CODE XREF: sub_4023D7+5A?j
                cmp     byte ptr [esi], 0Dh
                jz      short loc_402404
                cmp     byte ptr [esi], 0
                jnz     short loc_40242F

loc_402404:                             ; CODE XREF: sub_4023D7+26?j
                mov     cl, [esi]
                push    ecx
                mov     byte ptr [esi], 0
                push    edi             ; lpString
                call    lstrlenA
                push    eax             ; c
                push    edi             ; lpString
                push    y         ; y
                push    TextLeft             ; x
                push    m_hDC           ; hdc
                call    TextOutA
                add     y, TextLineSize
                pop     ecx
                mov     edi, esi
                inc     edi
                mov     [esi], cl

loc_40242F:                             ; CODE XREF: sub_4023D7+2B?j
                lodsb
                dec     ebx
                jnz     short loc_4023FA
                mov     eax, y
                sub     eax, dword_4078FD
                shr     eax, 1
                pop     ebx
                pop     edi
                pop     esi
                ret
TextProc      endp


