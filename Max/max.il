.assembly extern mscorlib {}
.assembly Max {}

.module Max.exe
.method public static void main() cil managed
{
	.entrypoint
	.maxstack 8
	.locals init (int32,int32)
	// Get number from user and store in location 0
	ldstr "Enter Number: "
	call void [mscorlib]System.Console::Write(string)
	call string [mscorlib]System.Console::ReadLine()
	call int32 [mscorlib]System.Int32::Parse(string)
	stloc.0
	
	// Get number from user and store in location 1
	ldstr "Enter Number: "
	call void [mscorlib]System.Console::Write(string)
	call string [mscorlib]System.Console::ReadLine()
	call int32 [mscorlib]System.Int32::Parse(string)
	stloc.1
	
	// Load addresses
	ldloca 0
	ldloca 1
	call int32 DoSum(int32&,int32&) //pass by reference
	dup
	brtrue True
	brfalse False
True:
	pop
	ldloc.1
	call void [mscorlib]System.Console::WriteLine(int32)
	br Exit

False:
	ldloc.0
	call void [mscorlib]System.Console::WriteLine(int32)
	br Exit

Exit:

	ret
}

.method public static int32 DoSum(int32&, int32&) cil managed
{
	.locals init (int32, int32)
	ldarg.0
	ldind.i4
	stloc.0
	ldarg.1
	ldind.i4
	stloc.1
	
	ldloc.0
	ldloc.1
	clt
	
	ret
}

.method public static void PrintSum(int32) cil managed
{
	.maxstack 2
	ldstr "The result is: "
	call void [mscorlib]System.Console::Write(string)
	
	ldarg.0
	call void [mscorlib]System.Console::Write(int32)
	
	
	ret
}