/* 
 * FunctionCall.il
 * Part of CIL-Examples
 * By Jon Hartwell, 2/16/2012
 * This source code is under Public Domain
 */
 
.assembly extern mscorlib {}
// name our application FunctionCall
.assembly FunctionCall {}

// Our namespace
.namespace FunctionCall
{
	// main method
	.method public static void main() cil managed
	{
		.entrypoint
		
		// Display the string "Enter a number: "
		ldstr "Enter a number: "
		call void [mscorlib]System.Console::Write(string)
		
		// Get an integer from the user as string
		call string [mscorlib]System.Console::ReadLine()
		// turn it into an integer
		call int32 [mscorlib]System.Int32::Parse(string)
		
		// call our home made function
		call int32 AddTen(int32)
		call void [mscorlib]System.Console::Write(int32)
		ret
	}

	// our home made function
	// takes an int32 and adds 10
	.method public static int32 AddTen(int32) cil managed
	{
		ldarg.0
		ldc.i4 10
		add
		ret
	}
}