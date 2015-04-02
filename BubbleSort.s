*Melanie Dauber (mpdaube)
*mpdaube@emory.edu
*I worked on this project alone, using only this semester's course materials.


        xdef BubbleSort


BubbleSort:
******************************************************
* Write your bubble sort assembler subroutine here
******************************************************
	move.l #0, done			* done = 0 (false)
	move.l #1, k			* k = 1

While:

	
	move.l D0, A0
	move.l done, D6
	cmp.l #0, D6			* while done == 0
	bne Over
	move.l #1, done			* done = 1 (true)
	move.l #0, i			* i = 0

Loop:
	
	move.l D1, D2
	sub.l k, D2
	move.l i, D6			* subtract k from n
	cmp.l D2, D6			* compare n-k and i
	blt ForLoopBody			* branch to ForLoopBody if i < n-k
	bra EndLoop			* if i > or = to n-k end loop

ForLoopBody:

	move.l i, D3 
	muls #4, D3
	move.l 0(A0, D3), D4		* A[i]
	move.l 4(A0, D3), D5		* A[i+1]
	cmp.l D5, D4
	ble Loop2
	move.l 0(A0, D3), temp		* temp = A[i]
	move.l 4(A0, D3), 0(A0, D3)	* A[i] = A[i+1]
	move.l temp, 4(A0, D3)		* A[i+1] = temp
	move.l #0, done			* done = 0
	

Loop2: 

	add.l #1, i			* i++
	bra Loop

EndLoop:
	
	add.l #1, k			* k = k + 1
	bra While
	
Over:

	rts



* *****************************************************************************
* If you need local variables, you can add variable definitions below this line
* *****************************************************************************

i:	dc.l 0
k:	dc.l 1
temp:	dc.l 0
done:	dc.l 0

        end
