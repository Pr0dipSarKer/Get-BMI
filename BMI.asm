.MODEL SMALL
 .STACK 100H
 .DATA 
 MESSAGEA DB ' -------------------Hello Everyone Wellcome TO --------------------$' 

 MESSAGEB DB ' -------------------- Body Mass Index(BMI) Calculator --------------------$'
 MESSAGEC DB ' For the relation of ft and cm 30cm = 1ft $'
 MESSAGED DB ' Enter your height(cm):$'
 MESSAGEE DB ' Enter your weight(kg):$'
 MESSAGEF DB ' "Over weight"$'
 MESSAGEG DB ' " perfect weight"$'
 MESSAGEH DB ' "Under weight"$'
 Tips1 DB ' "--------- underweight----- -> perfect weight tips ----- Enter- 1 "$'
 Tips2 DB ' "--------- overweight------ -> perfect weight tips ------ Enter- 2 " $'
 
 MESSAGEK1 DB ' " 1. Sleep at leat 7 hourse a day and eat a more."$'
 MESSAGEK2 DB ' " 2. Eat chicken breast, potato, check peas, etc means all the high calorie protin kind of food."$'
 MESSAGEK3 DB ' " 3.You have to Drink at minimum 3L water per day."$'
 MESSAGEK4 DB ' " 4.Simply Eat vegetables regularly and drink 1 glass of milk and 1 whole egg each day."$'
 
 MESSAGEL1 DB ' " 1.You have to follow a low calorie healthy diet it is very important."$'
 MESSAGEL2 DB ' " 2.You have to Eat high protein like as vegetables and all time you have to avoid fast food."$'
 MESSAGEL3 DB ' " 3. Crunching, walking, running, ropping is really helpful cause workout help a lot in losing weight."$' 
 
 MESSAGEN DB ' Congratulation..! Now simply keep it up.$'
 
 MESSAGEM1 DB ' " You want to calculate agin?-----------Enter- 1."$'
 MESSAGEM2 DB ' " To quit ----------------- Enter 2."$' 
 MESSAGEM3 DB ' --------------Thank You Very Much----------------$'

 MESSAGEM4 DB ' " Hey! to continue press any key from keybord...."$'
 
 SUM DW ? 
 .CODE
 MAIN PROC
 
 
 MOV AX,@DATA
 MOV DS,AX
 
 LEA DX,MESSAGEA
 MOV AH,9
 INT 21H
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEB
 MOV AH,9
 INT 21H 
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEC

 MOV AH,9
 INT 21H 
 
 START:
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGED
 MOV AH,9
 INT 21H 
 
 MOV AX,0
 MOV BX,0
 MOV CX,0
 MOV DX,0
 MOV SUM,0
 
 
INPUT:
 AND AX,000FH
 PUSH AX
 MOV AX,10

 MUL BX
 MOV BX,AX
 POP AX
 ADD BX,AX
 
 MOV AH,1
 INT 21H
 
 CMP AL,0DH
 JE PRINT
 
 
 JMP INPUT
 
 
 PRINT: 
 
 CALL NL
 
 LEA DX,MESSAGEE
 MOV AH,9
 INT 21H
 
 MOV SUM,BX
 MOV BX,0

 MOV AX,0
 
 INPUT2:
 
 AND AX,000FH
 PUSH AX
 MOV AX,10
 MUL BX
 MOV BX,AX
 POP AX
 ADD BX,AX
 
 MOV AH,1
 INT 21H
 
 CMP AL,0DH
 JE CONVERT
 
 JMP INPUT2
 
 CONVERT:
 
 MOV AX,SUM
 MOV DX,0
 

 DIV BX
 
 
 CMP AX,1
 JE OVER
 
 CMP AX,2
 JE OVER
 
 CMP AX,3
 JE PERFECT
 
 CMP AX,4
 JE UNDER
 
 CMP AX,5
 JE UNDER
 
 OVER:
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEF
 MOV AH,9

 INT 21H 
 
 JMP PRESS
 
 PERFECT:
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEG
 MOV AH,9
 INT 21H
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEN
 MOV AH,9
 INT 21H 
 
 JMP EXIT
 
 UNDER:
 
 CALL NL

 CALL NL
 
 LEA DX,MESSAGEH
 MOV AH,9
 INT 21H 
 
 JMP PRESS
 
 PRESS:
 
 MOV AX,0 
 
 CALL NL
 CALL NL
 
 LEA DX,Tips1
 MOV AH,9
 INT 21H
 
 CALL NL
 CALL NL
 
 LEA DX,Tips2
 MOV AH,9
 INT 21H
 
 
 MOV AH,1
 INT 21H
 
 CMP AL,'1'
 JE P1
 
 CMP AL,'2'
 JE P2
 
 P1:
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEK1
 MOV AH,9
 INT 21H
 
 CALL NL
 
 LEA DX,MESSAGEK2
 MOV AH,9
 INT 21H

 
 CALL NL
 
 LEA DX,MESSAGEK3
 MOV AH,9
 INT 21H
 
 CALL NL
 
 LEA DX,MESSAGEK4
 MOV AH,9
 INT 21H
 
 JMP EXIT
 
 P2:
 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEL1
 MOV AH,9
 INT 21H
 
 CALL NL

 
 LEA DX,MESSAGEL2
 MOV AH,9
 INT 21H
 
 CALL NL
 
 LEA DX,MESSAGEL3
 MOV AH,9
 INT 21H
 
 EXIT:
 MOV AX,0
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEM4
 MOV AH,9
 INT 21H 
 
 MOV AH,1
 INT 21H
 
 CALL NL
 

 LEA DX,MESSAGEM1
 MOV AH,9
 INT 21H
 
 CALL NL
 
 LEA DX,MESSAGEM2
 MOV AH,9
 INT 21H 
 
 MOV AH,1
 INT 21H
 
 CMP AL,'1'
 JE START
 
 JMP EXIT2
 
 NL:
 MOV AH,2
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H
 RET

 
 
 EXIT2: 
 CALL NL
 CALL NL
 
 LEA DX,MESSAGEM3
 MOV AH,9
 INT 21H
 
 MOV AH,4CH
 INT 21H
 
 MAIN ENDP 
 END MAIN