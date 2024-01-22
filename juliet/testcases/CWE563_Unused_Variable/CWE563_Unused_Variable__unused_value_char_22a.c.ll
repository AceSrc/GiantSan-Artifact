; ModuleID = 'CWE563_Unused_Variable__unused_value_char_22a.c.ll.o0.ll'
source_filename = "CWE563_Unused_Variable__unused_value_char_22a.c.new.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE563_Unused_Variable__unused_value_char_22_goodB2G1Global = dso_local global i32 0, align 8
@CWE563_Unused_Variable__unused_value_char_22_goodB2G2Global = dso_local global i32 0, align 8
@CWE563_Unused_Variable__unused_value_char_22_goodG2BGlobal = dso_local global i32 0, align 8
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_ctor, i8* null }]

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_value_char_22_good() local_unnamed_addr #0 {
  tail call fastcc void @goodB2G1()
  tail call fastcc void @goodB2G2()
  tail call fastcc void @goodG2B()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #0 {
  %3 = tail call i64 @time(i64* null) #3
  %4 = trunc i64 %3 to i32
  tail call void @srand(i32 %4) #3
  tail call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #3
  tail call void @CWE563_Unused_Variable__unused_value_char_22_good()
  tail call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)) #3
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) local_unnamed_addr #1

declare dso_local void @printLine(i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @goodB2G1() unnamed_addr #0 {
  store i32 0, i32* @CWE563_Unused_Variable__unused_value_char_22_goodB2G1Global, align 8
  tail call void @CWE563_Unused_Variable__unused_value_char_22_goodB2G1Sink(i8 signext 67) #3
  ret void
}

declare dso_local void @CWE563_Unused_Variable__unused_value_char_22_goodB2G1Sink(i8 signext) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @goodB2G2() unnamed_addr #0 {
  store i32 1, i32* @CWE563_Unused_Variable__unused_value_char_22_goodB2G2Global, align 8
  tail call void @CWE563_Unused_Variable__unused_value_char_22_goodB2G2Sink(i8 signext 67) #3
  ret void
}

declare dso_local void @CWE563_Unused_Variable__unused_value_char_22_goodB2G2Sink(i8 signext) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @goodG2B() unnamed_addr #0 {
  tail call void @printHexCharLine(i8 signext 67) #3
  store i32 1, i32* @CWE563_Unused_Variable__unused_value_char_22_goodG2BGlobal, align 8
  tail call void @CWE563_Unused_Variable__unused_value_char_22_goodG2BSink(i8 signext 67) #3
  ret void
}

declare dso_local void @printHexCharLine(i8 signext) local_unnamed_addr #2

declare dso_local void @CWE563_Unused_Variable__unused_value_char_22_goodG2BSink(i8 signext) local_unnamed_addr #2

define internal void @asan.module_ctor() {
  tail call void @__cocheck__globalInit()
  tail call void @__cocheck__globalRegister(i64 ptrtoint (i32* @CWE563_Unused_Variable__unused_value_char_22_goodB2G1Global to i64), i64 4)
  tail call void @__cocheck__globalRegister(i64 ptrtoint (i32* @CWE563_Unused_Variable__unused_value_char_22_goodB2G2Global to i64), i64 4)
  tail call void @__cocheck__globalRegister(i64 ptrtoint (i32* @CWE563_Unused_Variable__unused_value_char_22_goodG2BGlobal to i64), i64 4)
  tail call void @__cocheck__globalRegister(i64 ptrtoint ([18 x i8]* @.str to i64), i64 18)
  tail call void @__cocheck__globalRegister(i64 ptrtoint ([16 x i8]* @.str.1 to i64), i64 16)
  ret void
}

declare void @__cocheck__globalInit() local_unnamed_addr

declare void @__cocheck__globalRegister(i64, i64) local_unnamed_addr

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
