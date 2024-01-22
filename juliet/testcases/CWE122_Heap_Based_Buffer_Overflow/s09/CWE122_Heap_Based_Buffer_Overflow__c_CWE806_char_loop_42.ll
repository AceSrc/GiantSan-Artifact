; ModuleID = 'CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c'
source_filename = "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = internal constant { [17 x i8], [47 x i8] } { [17 x i8] c"Calling bad()...\00", [47 x i8] zeroinitializer }, align 32
@.str.1 = internal constant { [15 x i8], [49 x i8] } { [15 x i8] c"Finished bad()\00", [49 x i8] zeroinitializer }, align 32
@___asan_gen_.4 = private unnamed_addr constant { [59 x i8]*, i32, i32 } { [59 x i8]* @___asan_gen_.6, i32 111, i32 15 }
@___asan_gen_.5 = private unnamed_addr constant [17 x i8] c"<string literal>\00", align 1
@___asan_gen_.6 = private constant [59 x i8] c"CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c\00", align 1
@___asan_gen_.7 = private unnamed_addr constant { [59 x i8]*, i32, i32 } { [59 x i8]* @___asan_gen_.6, i32 113, i32 15 }
@0 = internal global [2 x { i64, i64, i64, i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [17 x i8], [47 x i8] }* @.str to i64), i64 17, i64 64, i64 ptrtoint ([17 x i8]* @___asan_gen_.5 to i64), i64 ptrtoint ([59 x i8]* @___asan_gen_.6 to i64), i64 0, i64 ptrtoint ({ [59 x i8]*, i32, i32 }* @___asan_gen_.4 to i64), i64 -1 }, { i64, i64, i64, i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [15 x i8], [49 x i8] }* @.str.1 to i64), i64 15, i64 64, i64 ptrtoint ([17 x i8]* @___asan_gen_.5 to i64), i64 ptrtoint ([59 x i8]* @___asan_gen_.6 to i64), i64 0, i64 ptrtoint ({ [59 x i8]*, i32, i32 }* @___asan_gen_.7 to i64), i64 -1 }]
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_ctor, i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_dtor, i8* null }]
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ({ [17 x i8], [47 x i8] }, { [17 x i8], [47 x i8] }* @.str, i32 0, i32 0, i32 0), i8* getelementptr inbounds ({ [15 x i8], [49 x i8] }, { [15 x i8], [49 x i8] }* @.str.1, i32 0, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind sanitize_address uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_bad() local_unnamed_addr #0 {
entry:
  %call = tail call noalias dereferenceable_or_null(100) i8* @malloc(i64 100) #6
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @__asan_handle_no_return() #6
  tail call void @exit(i32 -1) #7
  unreachable

if.end:                                           ; preds = %entry
  %0 = tail call i8* @__asan_memset(i8* nonnull %call, i32 65, i64 99) #6
  %arrayidx.i = getelementptr inbounds i8, i8* %call, i64 99
  store i8 0, i8* %arrayidx.i, align 1, !tbaa !6
  tail call void @printLine(i8* nonnull %call) #6
  tail call void @free(i8* nonnull %call) #6
  ret void
}

; Function Attrs: inaccessiblememonly nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #2

declare dso_local void @printLine(i8*) local_unnamed_addr #3

; Function Attrs: inaccessiblemem_or_argmemonly nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #4

; Function Attrs: nounwind sanitize_address uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i64 @time(i64* null) #6
  %conv = trunc i64 %call to i32
  tail call void @srand(i32 %conv) #6
  tail call void @printLine(i8* getelementptr inbounds ({ [17 x i8], [47 x i8] }, { [17 x i8], [47 x i8] }* @.str, i64 0, i32 0, i64 0)) #6
  %call.i = tail call noalias dereferenceable_or_null(100) i8* @malloc(i64 100) #6
  %cmp.i = icmp eq i8* %call.i, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  tail call void @__asan_handle_no_return() #6
  tail call void @exit(i32 -1) #7
  unreachable

if.end.i:                                         ; preds = %entry
  %0 = tail call i8* @__asan_memset(i8* nonnull %call.i, i32 65, i64 99) #6
  %arrayidx.i.i = getelementptr inbounds i8, i8* %call.i, i64 99
  store i8 0, i8* %arrayidx.i.i, align 1, !tbaa !6
  tail call void @printLine(i8* nonnull %call.i) #6
  tail call void @free(i8* nonnull %call.i) #6
  tail call void @printLine(i8* getelementptr inbounds ({ [15 x i8], [49 x i8] }, { [15 x i8], [49 x i8] }* @.str.1, i64 0, i32 0, i64 0)) #6
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) local_unnamed_addr #5

declare i8* @__asan_memset(i8*, i32, i64) local_unnamed_addr

declare void @__asan_handle_no_return() local_unnamed_addr

declare void @__asan_register_globals(i64, i64) local_unnamed_addr

declare void @__asan_unregister_globals(i64, i64) local_unnamed_addr

declare void @__asan_init() local_unnamed_addr

define internal void @asan.module_ctor() {
  tail call void @__asan_init()
  tail call void @__asan_version_mismatch_check_v8()
  tail call void @__asan_register_globals(i64 ptrtoint ([2 x { i64, i64, i64, i64, i64, i64, i64, i64 }]* @0 to i64), i64 2)
  ret void
}

declare void @__asan_version_mismatch_check_v8() local_unnamed_addr

define internal void @asan.module_dtor() {
  tail call void @__asan_unregister_globals(i64 ptrtoint ([2 x { i64, i64, i64, i64, i64, i64, i64, i64 }]* @0 to i64), i64 2)
  ret void
}

attributes #0 = { nounwind sanitize_address uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inaccessiblememonly nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inaccessiblemem_or_argmemonly nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.asan.globals = !{!0, !2}
!llvm.module.flags = !{!4}
!llvm.ident = !{!5}

!0 = distinct !{null, !1, !"<string literal>", i1 false, i1 false}
!1 = !{!"CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c", i32 111, i32 15}
!2 = distinct !{null, !3, !"<string literal>", i1 false, i1 false}
!3 = !{!"CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c", i32 113, i32 15}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{!"clang version 12.0.1"}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
