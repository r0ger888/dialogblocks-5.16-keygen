How 2 keygen :
- Get the buffer of the name string
- make all the chars for the name string lowercase with **CharLower** function
- concatenate the name string with the specific string : ***Anthemion Software DialogBlocks***
- get the whole length of these two strings altogether by creating a variable for the length (**hLen**)
- compute the md5 hash on both of the strings
- convert the hexadecimal chars to unicode ones with **HexToChar**
- copy each 8 MD5 chars into three parts (including dashes)
- then clean all their buffer memories with **RtlZeroMemory**.
