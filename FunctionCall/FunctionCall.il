/* 
 * FunctionCall.il
 * Part of CIL-Examples
 * By Jon Hartwell, 2/16/2012
 * This source code is under Public Domain
 */
 
.assembly extern mscorlib {}
.assembly FunctionCall {}


.namespace FunctionCall
{
	.method public static void main() cil managed
	{
		.entrypoint
		
		ldstr "Enter a number: "
		call void [mscorlib]System.Console::Write(string)
		
		call string [mscorlib]System.Console::ReadLine()

		call int32 [mscorlib]System.Int32::Parse(string)
		
		call int32 AddTen(int32)
		call void [mscorlib]System.Console::Write(int32)
		ret
	}

	.method public static int32 AddTen(int32) cil managed
	{
		ldarg.0
		ldc.i4 10
		add
		ret
	}
}