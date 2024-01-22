; ModuleID = 'CWE563_Unused_Variable__unused_value_char_22b.c.ll.o0.ll'
source_filename = "CWE563_Unused_Variable__unused_value_char_22b.c.new.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE563_Unused_Variable__unused_value_char_22_goodB2G1Global = external dso_local local_unnamed_addr global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 8
@CWE563_Unused_Variable__unused_value_char_22_goodB2G2Global = external dso_local local_unnamed_addr global i32, align 4
@CWE563_Unused_Variable__unused_value_char_22_goodG2BGlobal = external dso_local local_unnamed_addr global i32, align 4
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_ctor, i8* null }]

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_value_char_22_goodB2G1Sink(i8 signext %0) local_unnamed_addr #0 {
  %2 = load i32, i32* @CWE563_Unused_Variable__unused_value_char_22_goodB2G1Global, align 4
  %.not = icmp eq i32 %2, 0
  br i1 %.not, label %4, label %3

3:                                                ; preds = %1
  tail call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #2
  br label %5

4:                                                ; preds = %1
  tail call void @printHexCharLine(i8 signext %0) #2
  br label %5

5:                                                ; preds = %4, %3
  ret void
}

declare dso_local void @printLine(i8*) local_unnamed_addr #1

declare dso_local void @printHexCharLine(i8 signext) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_value_char_22_goodB2G2Sink(i8 signext %0) local_unnamed_addr #0 {
  %2 = load i32, i32* @CWE563_Unused_Variable__unused_value_char_22_goodB2G2Global, align 4
  %.not = icmp eq i32 %2, 0
  br i1 %.not, label %4, label %3

3:                                                ; preds = %1
  tail call void @printHexCharLine(i8 signext %0) #2
  br label %4

4:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_value_char_22_goodG2BSink(i8 signext %0) local_unnamed_addr #0 {
  %2 = load i32, i32* @CWE563_Unused_Variable__unused_value_char_22_goodG2BGlobal, align 4
  %.not = icmp eq i32 %2, 0
  br i1 %.not, label %4, label %3

3:                                                ; preds = %1
  tail call void @printHexCharLine(i8 signext 90) #2
  br label %4

4:                                                ; preds = %3, %1
  ret void
}

define internal void @asan.module_ctor() {
  tail call void @__cocheck__globalInit()
  tail call void @__cocheck__globalRegister(i64 ptrtoint ([21 x i8]* @.str to i64), i64 21)
  ret void
}

declare void @__cocheck__globalInit() local_unnamed_addr

declare void @__cocheck__globalRegister(i64, i64) local_unnamed_addr

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
