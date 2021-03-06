// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
    @i
    M=0

    @SCREEN
    D=A
    @startpixelbyte
    M=D

    @KBD
    D=A
    @endpixelbyte
    M=D

    //@endpixelbyte
    //D=M
    //@startpixelbyte
    //A=M
    @8192
    D=A
    @screenwidth
    M=D


    @KBD
    D=M
    @DRAW
    D;JGT 

    @KBD
    D=M
    @ERASE
    D;JLE
    

    @LOOP
    0;JMP

    (DRAW)
        @startpixelbyte
        D=M
        @i
        A=D+M
    
        M=-1
    
        @i
        D=M
        @screenwidth
        D=M-D
        D=D-1
        @i
        M=M+1
    
        @DRAW
        D;JGT

    @LOOP
    0;JMP

    (ERASE)
        @startpixelbyte
        D=M
        @i
        A=D+M
    
        M=0
    
        @i
        D=M
        @screenwidth
        D=M-D
        D=D-1
        @i
        M=M+1
    
        @ERASE
        D;JGT
    

    @LOOP
    0;JMP
