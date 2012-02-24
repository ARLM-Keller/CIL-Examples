/*
 * branching.il
 * Written By: Jon Hartwell
 * 2/23/2012
 * howing some of the branches that are used in CIL. This is
 * in public domain so feel free to use it but I would definitely
 * appreciate a heads up if you are using it. After all, I'd love to see
 * what others are doing with CIL.
 */
.assembly extern mscorlib {}

.assembly Branching {}

.method public static void main() cil managed
{
	.entrypoint
	// plain ol' branch
	br branchedNormal
RecoverNormal:
	// branch if less than
	ldc.i4 5
	// imagine the < here
	ldc.i4 10
	blt branchedLessThan
RecoverLessThan:
	// branch if less than or equal
	ldc.i4 5
	// imagine the <= here
	ldc.i4 5
	ble branchedLessThanEqual
RecoverLessThanEqual:
	// branch if greater than 
	ldc.i4 10
	// imagine the > here
	ldc.i4 5
	bgt branchedGreaterThan
RecoverGreaterThan:
	// branch greater than or equal
	ldc.i4 20
	// imagine the >= here
	ldc.i4 20
	bge branchedGreaterThanEqual
RecoverGreaterThanEqual:
	// branch if false or if zero is on stack
	ldc.i4 0
	brfalse branchedFalse
RecoverFalse:	
	// branch if true or if  is on the stack
	ldc.i4 5 // push int32 5 onto the stack
	ldc.i4 5 // push int32 5 onto the stack
	ceq // check to see if they are equal. Puts int32 1 on stack if so, int32 0 if not
	brtrue branchedTrue
RecoverTrue:
	// all done so lets print a message so we know that and then return
	ldstr "Fin!"
	call void [mscorlib]System.Console::WriteLine(string)
	ret	

branchedGreaterThanEqual:
	ldstr "20 is not greater than 20, but it is equal"
	call void [mscorlib]System.Console::WriteLine(string)
	br RecoverGreaterThanEqual

branchedLessThanEqual:
	ldstr "5 is not less than 5, but it is equal!"
	call void [mscorlib]System.Console::WriteLine(string)
	br RecoverLessThanEqual
	
branchedGreaterThan:
	ldstr "So...10 is greater than 5  you say!"
	call void [mscorlib]System.Console::WriteLine(string)
	// go back to where we came from
	br RecoverGreaterThan
branchedTrue:
	ldstr "That's right...5 is equal to 5"
	call void [mscorlib]System.Console::WriteLine(string)
	// go back to where we came from
	br RecoverTrue
branchedFalse:
	ldstr "FALSE! Black bear"
	call void [mscorlib]System.Console::WriteLine(string)
	// go back to where we came from
	br RecoverFalse
	
branchedLessThan:
	ldstr "One was less than the other"
	call void [mscorlib]System.Console::WriteLine(string)
	// go back to where we came from
	br RecoverLessThan

branchedNormal:
	ldstr "This is the normal branch"
	call void [mscorlib]System.Console::WriteLine(string)
	// go back to where we came from
	br RecoverNormal
}
