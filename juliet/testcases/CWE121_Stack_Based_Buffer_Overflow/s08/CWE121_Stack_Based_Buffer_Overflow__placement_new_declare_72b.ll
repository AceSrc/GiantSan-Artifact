; ModuleID = 'CWE121_Stack_Based_Buffer_Overflow__placement_new_declare_72b.cpp'
source_filename = "CWE121_Stack_Based_Buffer_Overflow__placement_new_declare_72b.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<char *, std::allocator<char *>>::_Vector_impl" }
%"struct.std::_Vector_base<char *, std::allocator<char *>>::_Vector_impl" = type { i8**, i8**, i8** }
%class.TwoIntsClass = type { i32, i32 }

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_ctor, i8* null }]

; Function Attrs: sanitize_address uwtable mustprogress
define dso_local void @_ZN60CWE121_Stack_Based_Buffer_Overflow__placement_new_declare_727badSinkESt6vectorIPcSaIS1_EE(%"class.std::vector"* nocapture readonly %dataVector) local_unnamed_addr #0 {
entry:
  %0 = ptrtoint %"class.std::vector"* %dataVector to i64
  %1 = lshr i64 %0, 3
  %2 = add nuw nsw i64 %1, 2147450880
  %3 = inttoptr i64 %2 to i8*
  %4 = load volatile i8, i8* %3, align 1
  %5 = icmp ugt i8 %4, 64
  br i1 %5, label %6, label %7

6:                                                ; preds = %entry
  call void @__asan_report_load2(i64 %0) #2
  unreachable

7:                                                ; preds = %entry
  %_M_start.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %dataVector, i64 0, i32 0, i32 0, i32 0
  %8 = load i8**, i8*** %_M_start.i, align 8, !tbaa !2
  %add.ptr.i = getelementptr inbounds i8*, i8** %8, i64 2
  %9 = ptrtoint i8** %add.ptr.i to i64
  %10 = lshr i64 %9, 3
  %11 = add nuw nsw i64 %10, 2147450880
  %12 = inttoptr i64 %11 to i8*
  %13 = load volatile i8, i8* %12, align 1
  %14 = icmp ugt i8 %13, 64
  br i1 %14, label %15, label %16

15:                                               ; preds = %7
  call void @__asan_report_load2(i64 %9) #2
  unreachable

16:                                               ; preds = %7
  %17 = bitcast i8** %add.ptr.i to %class.TwoIntsClass**
  %18 = load %class.TwoIntsClass*, %class.TwoIntsClass** %17, align 8, !tbaa !8
  %19 = ptrtoint %class.TwoIntsClass* %18 to i64
  %20 = lshr i64 %19, 3
  %21 = add nuw nsw i64 %20, 2147450880
  %22 = inttoptr i64 %21 to i8*
  %23 = load volatile i8, i8* %22, align 1
  %24 = icmp ugt i8 %23, 64
  br i1 %24, label %25, label %26

25:                                               ; preds = %16
  call void @__asan_report_store2(i64 %19) #2
  unreachable

26:                                               ; preds = %16
  %intOne = getelementptr inbounds %class.TwoIntsClass, %class.TwoIntsClass* %18, i64 0, i32 0
  store i32 5, i32* %intOne, align 4, !tbaa !9
  %intTwo = getelementptr inbounds %class.TwoIntsClass, %class.TwoIntsClass* %18, i64 0, i32 1
  store i32 10, i32* %intTwo, align 4, !tbaa !12
  tail call void @printIntLine(i32 5)
  ret void
}

declare dso_local void @printIntLine(i32) local_unnamed_addr #1

declare void @__asan_report_load2(i64) local_unnamed_addr

declare void @__asan_report_store2(i64) local_unnamed_addr

declare void @__asan_init() local_unnamed_addr

define internal void @asan.module_ctor() {
  call void @__asan_init()
  call void @__asan_version_mismatch_check_v8()
  ret void
}

declare void @__asan_version_mismatch_check_v8() local_unnamed_addr

attributes #0 = { sanitize_address uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nomerge }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
!2 = !{!3, !5, i64 0}
!3 = !{!"_ZTSSt12_Vector_baseIPcSaIS0_EE", !4, i64 0}
!4 = !{!"_ZTSNSt12_Vector_baseIPcSaIS0_EE12_Vector_implE", !5, i64 0, !5, i64 8, !5, i64 16}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!5, !5, i64 0}
!9 = !{!10, !11, i64 0}
!10 = !{!"_ZTS12TwoIntsClass", !11, i64 0, !11, i64 4}
!11 = !{!"int", !6, i64 0}
!12 = !{!10, !11, i64 4}
