// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//pseudo Code
//i=0
//sum=0
//R2=0
//for(i=1;i<=R1;i++)
//{
//    sum=sum+R0
//}
//R2=sum

//initializing i with 1
@1
D=A
@i
M=D

//initializing R2 with 0
@R2
M=0

(LOOP)
    // if i > R1 than go to END
    @i
    D=M
    @R1
    D=M-D
    @END
    D;JLT
    
    //increment in i
    @i
    M=M+1

    @R2
    D=M
    @R0
    D=D+M
    @R2
    M=D

    @LOOP
    0,JMP

(END)
    @END
    0;JMP

