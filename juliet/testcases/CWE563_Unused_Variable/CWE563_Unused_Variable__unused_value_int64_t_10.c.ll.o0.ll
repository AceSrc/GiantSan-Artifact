; ModuleID = 'CWE563_Unused_Variable__unused_value_int64_t_10.c.ll.inline.ll'
source_filename = "CWE563_Unused_Variable__unused_value_int64_t_10.c.new.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 8
@__cocheck__loadGuardian.cache = internal global i32* inttoptr (i64 17594333495296 to i32*), align 8
@globalTrue = external dso_local global i32, align 4
@globalFalse = external dso_local global i32, align 4
@.str.2 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 8
@__cocheck__poisonArea.cache = internal global i32* inttoptr (i64 17594333495296 to i32*), align 8
@__cocheck__poisonArea.blockUsed = internal global i8* inttoptr (i64 19793356750848 to i8*), align 8
@__cocheck___poisonArea.blockUsed = internal global i8* inttoptr (i64 19793356750848 to i8*), align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_ctor, i8* null }]

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_value_int64_t_10_good() #0 {
  call void @goodB2G1()
  call void @goodB2G2()
  call void @goodG2B1()
  call void @goodG2B2()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = call i64 @time(i64* null) #5
  %7 = trunc i64 %6 to i32
  call void @srand(i32 %7) #5
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0))
  call void @CWE563_Unused_Variable__unused_value_int64_t_10_good()
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 {
  %1 = alloca i64, align 8
  %2 = load i32, i32* @globalTrue, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  store i64 5, i64* %1, align 8
  br label %5

5:                                                ; preds = %4, %0
  %6 = load i32, i32* @globalFalse, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0))
  br label %11

9:                                                ; preds = %5
  %10 = load i64, i64* %1, align 8
  call void @printLongLongLine(i64 %10)
  br label %11

11:                                               ; preds = %9, %8
  ret void
}

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 {
  %1 = alloca i64, align 8
  %2 = load i32, i32* @globalTrue, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  store i64 5, i64* %1, align 8
  br label %5

5:                                                ; preds = %4, %0
  %6 = load i32, i32* @globalTrue, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %5
  %9 = load i64, i64* %1, align 8
  call void @printLongLongLine(i64 %9)
  br label %10

10:                                               ; preds = %8, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 {
  %1 = alloca i64, align 8
  %2 = load i32, i32* @globalFalse, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0))
  br label %7

5:                                                ; preds = %0
  store i64 5, i64* %1, align 8
  %6 = load i64, i64* %1, align 8
  call void @printLongLongLine(i64 %6)
  br label %7

7:                                                ; preds = %5, %4
  %8 = load i32, i32* @globalTrue, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  store i64 10, i64* %1, align 8
  %11 = load i64, i64* %1, align 8
  call void @printLongLongLine(i64 %11)
  br label %12

12:                                               ; preds = %10, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 {
  %1 = alloca i64, align 8
  %2 = load i32, i32* @globalTrue, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  store i64 5, i64* %1, align 8
  %5 = load i64, i64* %1, align 8
  call void @printLongLongLine(i64 %5)
  br label %6

6:                                                ; preds = %4, %0
  %7 = load i32, i32* @globalTrue, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  store i64 10, i64* %1, align 8
  %10 = load i64, i64* %1, align 8
  call void @printLongLongLine(i64 %10)
  br label %11

11:                                               ; preds = %9, %6
  ret void
}

declare dso_local void @__cocheck__reportError(i64, i64, i64) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

define internal void @asan.module_ctor() {
  call void @__cocheck__globalInit()
  call void @__cocheck__globalRegister(i64 ptrtoint ([18 x i8]* @.str to i64), i64 18)
  call void @__cocheck__globalRegister(i64 ptrtoint ([16 x i8]* @.str.1 to i64), i64 16)
  call void @__cocheck__globalRegister(i64 ptrtoint ([21 x i8]* @.str.2 to i64), i64 21)
  ret void
}

declare void @__cocheck__globalInit()

declare void @__cocheck__globalRegister(i64, i64)

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nosync nounwind willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
