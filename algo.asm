include md5.asm

Hex2ch 			PROTO		:DWORD,:DWORD,:DWORD
GenKey			PROTO		:DWORD

.data
Magicstr	db	"Anthemion Software DialogBlocks",0
MD5Namehash	db	100h	dup(0)
Dashh		db	"-",0
Noname		db	"Insert ur name",0
TooLong		db	"Name too long!",0

.data?
Namebuff	db	60h	dup(?)
hLen		dd	?
part1		db 	60h dup(?)
part2		db 	60h dup(?)
part3		db 	60h dup(?)
Serialbuff	db	60h dup(?)
MD5hash		db  60h dup(?)

.code
Hex2ch proc HexValue:DWORD,CharValue:DWORD,HexLength:DWORD
    mov esi,[ebp+8]
    mov edi,[ebp+0Ch]
    mov ecx,[ebp+10h]
    @HexToChar:
      lodsb
      mov ah, al
      and ah, 0Fh
      shr al, 4
      add al, '0'
      add ah, '0'
       .if al > '9'
          add al, 'A'-'9'-1
       .endif
       .if ah > '9'
          add ah, 'A'-'9'-1
       .endif
      stosw
    loopd @HexToChar
    ret
Hex2ch endp

GenKey proc hWin:DWORD

	invoke GetDlgItemText,hWin,IDC_NAME,addr Namebuff,256
	.if eax == 0
		invoke SetDlgItemText,hWin,IDC_SERIAL,addr Noname
		invoke GetDlgItem,hWin,IDB_COPY
		invoke EnableWindow,eax,FALSE
	.elseif eax > 30
		invoke SetDlgItemText,hWin,IDC_SERIAL,addr TooLong
		invoke GetDlgItem,hWin,IDB_COPY
		invoke EnableWindow,eax,FALSE
	.elseif
		invoke CharLower,addr Namebuff
		invoke lstrcat,addr MD5hash,addr Namebuff
		invoke lstrcat,addr MD5hash,addr Magicstr
		invoke lstrlen,addr MD5hash
		mov hLen,eax
		invoke MD5Init
		invoke MD5Update,addr MD5hash,hLen
		invoke MD5Final
		invoke Hex2ch,addr MD5Digest,addr MD5Namehash,16
		invoke lstrcpyn,addr part1,addr MD5Namehash,9
		invoke lstrcat,addr Serialbuff,addr part1
		invoke lstrcat,addr Serialbuff,addr Dashh
		invoke lstrcpyn,addr part2,addr MD5Namehash+8,9
		invoke lstrcat,addr Serialbuff,addr part2
		invoke lstrcat,addr Serialbuff,addr Dashh
		invoke lstrcpyn,addr part3,addr MD5Namehash+16,9
		invoke lstrcat,addr Serialbuff,addr part3
		invoke SetDlgItemText,hWin,IDC_SERIAL,addr Serialbuff
		invoke GetDlgItem,hWin,IDB_COPY
		invoke EnableWindow,eax,TRUE
	    call Clean
	.endif
	Ret
GenKey endp

Clean proc
    invoke RtlZeroMemory,addr Namebuff,sizeof Namebuff
    invoke RtlZeroMemory,addr MD5Namehash,sizeof MD5Namehash
    invoke RtlZeroMemory,addr part1,sizeof part1
    invoke RtlZeroMemory,addr part2,sizeof part2
    invoke RtlZeroMemory,addr part3,sizeof part3
    invoke RtlZeroMemory,addr Serialbuff,sizeof Serialbuff
    invoke RtlZeroMemory,addr MD5hash,sizeof MD5hash
	Ret
Clean endp