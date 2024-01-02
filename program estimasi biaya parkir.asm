.MODEL SMALL
.STACK 100h  
.DATA

JMP MULAI: 
msg_symbol      DB 0Dh, 0Ah, '===============================================', 0Dh, 0Ah, '$'
msg_name        DB 0Dh, 0Ah, '||          NAMA  : FARHAN AINUR RAHMAT        || ', 0Dh, 0Ah, '$'  
msg_nim         DB 0Dh, 0Ah, '||          NIM   : 2300018026                 || ' , 0Dh, 0Ah, '$' 
msg_kelas       DB 0Dh, 0Ah, '||          Kelas : A                          || ' , 0Dh, 0Ah, '$'  
msg_prodi       DB 0Dh, 0Ah, '||            S1 INFORMATIKA                   || ' , 0Dh, 0Ah, '$'
msg_symbol2     DB 0Dh, 0Ah, '===============================================', 0Dh, 0Ah, '$'
msg_start       DB 0Dh, 0Ah, '     ===PROGRAM PERHITUNGAN BIAYA PARKIR===', 0Dh, 0Ah, '$'
msg_pilih       DB 0Dh, 0Ah, 'PILIH JENIS KENDARAAN YANG DIGUNAKAN', 0Dh, 0Ah, '1. MOTOR (1000)', 0Dh, 0Ah, '2. MOBIL (2000)', 0Dh, 0Ah, '3. PICK UP (5000)', 0Dh, 0Ah,  '4. TRUK (8000)', 0Dh, 0Ah,'5. BUS (10000)',0Dh, 0Ah,'6. Keluar', 0Dh, 0Ah, '$'
msg_awal        DB 0Dh, 0Ah, 'MASUKAN JAM AWAL PARKIR KENDARAAN {0-12}   :  $'
msg_akhir       DB 0Dh, 0Ah, 'MASUKAN JAM KELUAR PARKIR KENDARAAN {0-12} :  $'
msg_hasil       DB 0Dh, 0Ah, 'HASIL PERHITUNGAN BIAYA PARKIR      :  $' 
msg_invalid     DB 0Dh, 0Ah, 'MASUKAN NOMOR YANG BENAR!!!!!', 0Dh, 0Ah, '$'
msg_keluar      DB 0Dh, 0Ah, 'TERIMA KASIH TELAH MENGGUNAKAN KALKULATOR INI :)', 0Dh, 0Ah, '$' 
hasil           DB 10 DUP('$') 
biaya           DW ?

.CODE
MULAI: 
       MAIN PROC
       MOV AX, DATA
       MOV DS, AX
       LEA DX, msg_symbol
       MOV AH, 09h
       INT 21h
       LEA DX, msg_name
       MOV AH, 09h
       INT 21h
       LEA DX, msg_nim
       MOV AH, 09h
       INT 21h 
       LEA DX, msg_kelas
       MOV AH, 09h
       INT 21h
       LEA DX, msg_prodi
       MOV AH, 09h
       INT 21h
       LEA DX, msg_symbol2
       MOV AH, 09h
       INT 21h
       LEA DX, msg_start
       MOV AH, 09h
       INT 21h

PILIH:
       LEA DX, msg_pilih
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       CMP AL, '1'
       JE MOTOR
       CMP AL, '2'
       JE MOBIL
       CMP AL, '3'
       JE PICK_UP
       CMP AL, '4'
       JE TRUK 
       CMP AL, '5' 
       JE BUS
       CMP AL, '6'
       JE KELUAR

       JMP INVALID   
       

MOTOR:  
       LEA DX, msg_akhir
       MOV AH, 09h
       INT 21h

       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1       
       JG SINGLE_DIGIT_END 
       JE READ_UNIT_END    

SINGLE_DIGIT_END:
       MOV BH, AL      
       JMP GET_START_TIME

READ_UNIT_END:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BH, AL     

GET_START_TIME:
       LEA DX, msg_awal
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'    
       CMP AL, 1     
       JG SINGLE_DIGIT_START 
       JE READ_UNIT_START   

SINGLE_DIGIT_START:
       MOV BL, AL     
       JMP CALCULATE_DURATION

READ_UNIT_START:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'   
       ADD AL, 10      
       MOV BL, AL      

CALCULATE_DURATION:
       MOV AL, BH     
       SUB AL, BL      
       MOV AH, 0       
       MOV BX, 1000    
       CMP AL, 0
       JGE NO_NEG    
       NEG AL          

NO_NEG:
       MUL BX          
       MOV biaya, AX
       JMP TULIS_ANGKA

MOBIL:  
       LEA DX, msg_akhir
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'    
       CMP AL, 1       
       JG SINGLE_DIGIT_END2
       JE READ_UNIT_END2    

SINGLE_DIGIT_END2:
       MOV BH, AL      
       JMP GET_START_TIME2

READ_UNIT_END2:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BH, AL     

GET_START_TIME2:
       LEA DX, msg_awal
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1      
       JG SINGLE_DIGIT_START2 
       JE READ_UNIT_START2    

SINGLE_DIGIT_START2:
       MOV BL, AL      
       JMP CALCULATE_DURATION2

READ_UNIT_START2:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BL, AL      

CALCULATE_DURATION2:
       MOV AL, BH      
       SUB AL, BL      
       MOV AH, 0       
       MOV BX, 2000    
       CMP AL, 0
       JGE NO_NEG2      
       NEG AL          

NO_NEG2:
       MUL BX         
       MOV biaya, AX
       JMP TULIS_ANGKA
 
    
PICK_UP:  
       LEA DX, msg_akhir
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1       
       JG SINGLE_DIGIT_END3 
       JE READ_UNIT_END3    
    
SINGLE_DIGIT_END3:
       MOV BH, AL      
       JMP GET_START_TIME

READ_UNIT_END3:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BH, AL      
    
GET_START_TIME3:
       LEA DX, msg_awal
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1       
       JG SINGLE_DIGIT_START3 
       JE READ_UNIT_START3   

SINGLE_DIGIT_START3:
       MOV BL, AL    
       JMP CALCULATE_DURATION3

READ_UNIT_START3:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BL, AL     

CALCULATE_DURATION3:
       MOV AL, BH     
       SUB AL, BL      
       MOV AH, 0       
       MOV BX, 5000    
       CMP AL, 0
       JGE NO_NEG3      
       NEG AL         

NO_NEG3:
       MUL BX         
       MOV biaya, AX
       JMP TULIS_ANGKA   
       
TRUK:  
       LEA DX, msg_akhir
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1       
       JG SINGLE_DIGIT_END4 
       JE READ_UNIT_END4    
    
SINGLE_DIGIT_END4:
       MOV BH, AL      
       JMP GET_START_TIME

READ_UNIT_END4:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BH, AL      
    
GET_START_TIME4:
       LEA DX, msg_awal
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1       
       JG SINGLE_DIGIT_START4 
       JE READ_UNIT_START4   

SINGLE_DIGIT_START4:
       MOV BL, AL    
       JMP CALCULATE_DURATION4

READ_UNIT_START4:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BL, AL     

CALCULATE_DURATION4:
       MOV AL, BH     
       SUB AL, BL      
       MOV AH, 0       
       MOV BX, 8000    
       CMP AL, 0
       JGE NO_NEG4     
       NEG AL         

NO_NEG4:
       MUL BX         
       MOV biaya, AX
       JMP TULIS_ANGKA  
       
BUS:   
       LEA DX, msg_akhir
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1       
       JG SINGLE_DIGIT_END5
       JE READ_UNIT_END5    
    
SINGLE_DIGIT_END5:
       MOV BH, AL      
       JMP GET_START_TIME

READ_UNIT_END5:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BH, AL      
    
GET_START_TIME5:
       LEA DX, msg_awal
       MOV AH, 09h
       INT 21h
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       CMP AL, 1       
       JG SINGLE_DIGIT_START5 
       JE READ_UNIT_START5   

SINGLE_DIGIT_START5:
       MOV BL, AL    
       JMP CALCULATE_DURATION5

READ_UNIT_START5:
       MOV AH, 01h
       INT 21h
       SUB AL, '0'     
       ADD AL, 10      
       MOV BL, AL     

CALCULATE_DURATION5:
       MOV AL, BH     
       SUB AL, BL      
       MOV AH, 0       
       MOV BX, 10000    
       CMP AL, 0
       JGE NO_NEG5     
       NEG AL         

NO_NEG5:
       MUL BX         
       MOV biaya, AX
       JMP TULIS_ANGKA 
       
       


KELUAR:  
       LEA DX, msg_keluar
       MOV AH, 09h
       INT 21h
       MOV AH, 4Ch
       INT 21h

INVALID:
       LEA DX, msg_invalid
       MOV AH, 09h
       INT 21h
       JMP PILIH

TULIS_ANGKA:
       CALL CETAK
       LEA DX, msg_hasil
       MOV AH, 09h
       INT 21h
       LEA DX, hasil
       MOV AH, 09h
       INT 21h
       JMP SELESAI

SELESAI:
       LEA DX, msg_keluar  
       MOV AH, 09h
       INT 21h
       MOV AH, 01h          
       INT 21h
       MOV AH, 4Ch          
       INT 21h

CETAK  PROC 
       PUSH AX
       PUSH BX
       PUSH CX
       PUSH DX
       MOV CX, 10
       MOV BX, 0
       LEA DI, hasil 
    
CONVERT_LOOP:
       XOR DX, DX
       DIV CX
       PUSH DX
       INC BX
       TEST AX, AX
       JZ CETAK_LOOP
       JMP CONVERT_LOOP
CETAK_LOOP:
       POP DX
       ADD DL, '0'
       MOV [DI], DL
       INC DI
       DEC BX
       JNZ CETAK_LOOP
       MOV [DI], '$'
       POP DX
       POP CX
       POP BX
       POP AX
       RET
CETAK  ENDP

END main       