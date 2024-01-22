; ModuleID = 'CWE126_Buffer_Overread__malloc_char_loop_64b.c'
source_filename = "CWE126_Buffer_Overread__malloc_char_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__asan_option_detect_stack_use_after_return = external local_unnamed_addr global i32
@___asan_gen_ = private unnamed_addr constant [16 x i8] c"1 32 100 4 dest\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_ctor, i8* null }]

; Function Attrs: nounwind sanitize_address uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_64b_badSink(i8* nocapture readonly %dataVoidPtr) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @__asan_option_detect_stack_use_after_return, align 4
  %.not = icmp eq i32 %0, 0
  br i1 %.not, label %.thread, label %1

1:                                                ; preds = %entry
  %2 = call i64 @__asan_stack_malloc_2(i64 192) #5
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %.thread, label %5

.thread:                                          ; preds = %entry, %1
  %MyAlloca18 = alloca [192 x i8], align 32
  %4 = ptrtoint [192 x i8]* %MyAlloca18 to i64
  br label %5

5:                                                ; preds = %1, %.thread
  %6 = phi i1 [ false, %1 ], [ true, %.thread ]
  %7 = phi i64 [ %2, %1 ], [ 0, %.thread ]
  %8 = phi i64 [ %2, %1 ], [ %4, %.thread ]
  %9 = add i64 %8, 32
  %10 = inttoptr i64 %9 to [100 x i8]*
  %11 = getelementptr [100 x i8], [100 x i8]* %10, i64 0, i64 0
  %12 = inttoptr i64 %8 to i64*
  store i64 1102416563, i64* %12, align 8
  %13 = add i64 %8, 8
  %14 = inttoptr i64 %13 to i64*
  store i64 ptrtoint ([16 x i8]* @___asan_gen_ to i64), i64* %14, align 8
  %15 = add i64 %8, 16
  %16 = inttoptr i64 %15 to i64*
  store i64 ptrtoint (void (i8*)* @CWE126_Buffer_Overread__malloc_char_loop_64b_badSink to i64), i64* %16, align 8
  %17 = lshr i64 %8, 3
  %18 = add nuw nsw i64 %17, 2147450880
  %19 = inttoptr i64 %18 to i64*
  store i64 -506381209984437775, i64* %19, align 1
  %20 = add nuw nsw i64 %17, 2147450888
  %21 = inttoptr i64 %20 to i64*
  store i64 -506381209866536712, i64* %21, align 1
  %22 = add nuw nsw i64 %17, 2147450896
  %23 = inttoptr i64 %22 to i64*
  store i64 -868082074056920072, i64* %23, align 1
  %24 = ptrtoint i8* %dataVoidPtr to i64
  %25 = lshr i64 %24, 3
  %26 = add nuw nsw i64 %25, 2147450880
  %27 = inttoptr i64 %26 to i8*
  %28 = load volatile i8, i8* %27, align 1
  %29 = icmp ugt i8 %28, 64
  br i1 %29, label %30, label %31

30:                                               ; preds = %5
  call void @__asan_report_load2(i64 %24) #6
  unreachable

31:                                               ; preds = %5
  %32 = bitcast i8* %dataVoidPtr to i8**
  %33 = load i8*, i8** %32, align 8, !tbaa !2
  %34 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 0
  %35 = add nuw nsw i64 %17, 2147450884
  %36 = inttoptr i64 %35 to i64*
  store i64 4485090711648943421, i64* %36, align 1
  %37 = add nuw nsw i64 %17, 2147450892
  %38 = inttoptr i64 %37 to i32*
  store i32 1077886782, i32* %38, align 1
  %39 = inttoptr i64 %22 to i8*
  store i8 68, i8* %39, align 1
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %34) #5
  %40 = call i8* @__asan_memset(i8* %34, i32 67, i64 99) #5
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 99
  store i8 0, i8* %arrayidx, align 1, !tbaa !6
  %call = call i64 @strlen(i8* nonnull %34) #7
  %cmp14.not = icmp eq i64 %call, 0
  br i1 %cmp14.not, label %for.end, label %iter.check

iter.check:                                       ; preds = %31
  %min.iters.check = icmp ult i64 %call, 8
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %scevgep = getelementptr [100 x i8], [100 x i8]* %10, i64 0, i64 %call
  %scevgep19 = getelementptr i8, i8* %33, i64 %call
  %bound0 = icmp ult i8* %11, %scevgep19
  %bound1 = icmp ult i8* %33, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check20 = icmp ult i64 %call, 32
  br i1 %min.iters.check20, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %call, -32
  %41 = add i64 %n.vec, -32
  %42 = lshr exact i64 %41, 5
  %43 = add nuw nsw i64 %42, 1
  %xtraiter28 = and i64 %43, 3
  %44 = icmp ult i64 %41, 96
  br i1 %44, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %43, 1152921504606846972
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.3, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.3, %vector.body ]
  %45 = getelementptr inbounds i8, i8* %33, i64 %index
  %46 = bitcast i8* %45 to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %46, align 1, !tbaa !6, !alias.scope !7
  %47 = getelementptr inbounds i8, i8* %45, i64 16
  %48 = bitcast i8* %47 to <16 x i8>*
  %wide.load21 = load <16 x i8>, <16 x i8>* %48, align 1, !tbaa !6, !alias.scope !7
  %49 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %index
  %50 = bitcast i8* %49 to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %50, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %51 = getelementptr inbounds i8, i8* %49, i64 16
  %52 = bitcast i8* %51 to <16 x i8>*
  store <16 x i8> %wide.load21, <16 x i8>* %52, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %index.next = or i64 %index, 32
  %53 = getelementptr inbounds i8, i8* %33, i64 %index.next
  %54 = bitcast i8* %53 to <16 x i8>*
  %wide.load.1 = load <16 x i8>, <16 x i8>* %54, align 1, !tbaa !6, !alias.scope !7
  %55 = getelementptr inbounds i8, i8* %53, i64 16
  %56 = bitcast i8* %55 to <16 x i8>*
  %wide.load21.1 = load <16 x i8>, <16 x i8>* %56, align 1, !tbaa !6, !alias.scope !7
  %57 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %index.next
  %58 = bitcast i8* %57 to <16 x i8>*
  store <16 x i8> %wide.load.1, <16 x i8>* %58, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %59 = getelementptr inbounds i8, i8* %57, i64 16
  %60 = bitcast i8* %59 to <16 x i8>*
  store <16 x i8> %wide.load21.1, <16 x i8>* %60, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %index.next.1 = or i64 %index, 64
  %61 = getelementptr inbounds i8, i8* %33, i64 %index.next.1
  %62 = bitcast i8* %61 to <16 x i8>*
  %wide.load.2 = load <16 x i8>, <16 x i8>* %62, align 1, !tbaa !6, !alias.scope !7
  %63 = getelementptr inbounds i8, i8* %61, i64 16
  %64 = bitcast i8* %63 to <16 x i8>*
  %wide.load21.2 = load <16 x i8>, <16 x i8>* %64, align 1, !tbaa !6, !alias.scope !7
  %65 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %index.next.1
  %66 = bitcast i8* %65 to <16 x i8>*
  store <16 x i8> %wide.load.2, <16 x i8>* %66, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %67 = getelementptr inbounds i8, i8* %65, i64 16
  %68 = bitcast i8* %67 to <16 x i8>*
  store <16 x i8> %wide.load21.2, <16 x i8>* %68, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %index.next.2 = or i64 %index, 96
  %69 = getelementptr inbounds i8, i8* %33, i64 %index.next.2
  %70 = bitcast i8* %69 to <16 x i8>*
  %wide.load.3 = load <16 x i8>, <16 x i8>* %70, align 1, !tbaa !6, !alias.scope !7
  %71 = getelementptr inbounds i8, i8* %69, i64 16
  %72 = bitcast i8* %71 to <16 x i8>*
  %wide.load21.3 = load <16 x i8>, <16 x i8>* %72, align 1, !tbaa !6, !alias.scope !7
  %73 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %index.next.2
  %74 = bitcast i8* %73 to <16 x i8>*
  store <16 x i8> %wide.load.3, <16 x i8>* %74, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %75 = getelementptr inbounds i8, i8* %73, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  store <16 x i8> %wide.load21.3, <16 x i8>* %76, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %index.next.3 = add i64 %index, 128
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %lcmp.mod29.not = icmp eq i64 %xtraiter28, 0
  br i1 %lcmp.mod29.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %vector.body.epil ], [ %xtraiter28, %middle.block.unr-lcssa ]
  %77 = getelementptr inbounds i8, i8* %33, i64 %index.epil
  %78 = bitcast i8* %77 to <16 x i8>*
  %wide.load.epil = load <16 x i8>, <16 x i8>* %78, align 1, !tbaa !6, !alias.scope !7
  %79 = getelementptr inbounds i8, i8* %77, i64 16
  %80 = bitcast i8* %79 to <16 x i8>*
  %wide.load21.epil = load <16 x i8>, <16 x i8>* %80, align 1, !tbaa !6, !alias.scope !7
  %81 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %index.epil
  %82 = bitcast i8* %81 to <16 x i8>*
  store <16 x i8> %wide.load.epil, <16 x i8>* %82, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %83 = getelementptr inbounds i8, i8* %81, i64 16
  %84 = bitcast i8* %83 to <16 x i8>*
  store <16 x i8> %wide.load21.epil, <16 x i8>* %84, align 1, !tbaa !6, !alias.scope !10, !noalias !7
  %index.next.epil = add i64 %index.epil, 32
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %middle.block, label %vector.body.epil, !llvm.loop !15

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %call, %n.vec
  br i1 %cmp.n, label %for.end, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %call, 24
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec23 = and i64 %call, -8
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index24 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next25, %vec.epilog.vector.body ]
  %85 = getelementptr inbounds i8, i8* %33, i64 %index24
  %86 = bitcast i8* %85 to <8 x i8>*
  %wide.load27 = load <8 x i8>, <8 x i8>* %86, align 1, !tbaa !6
  %87 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %index24
  %88 = bitcast i8* %87 to <8 x i8>*
  store <8 x i8> %wide.load27, <8 x i8>* %88, align 1, !tbaa !6
  %index.next25 = add i64 %index24, 8
  %89 = icmp eq i64 %index.next25, %n.vec23
  br i1 %89, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !17

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n26 = icmp eq i64 %call, %n.vec23
  br i1 %cmp.n26, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %i.015.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec23, %vec.epilog.middle.block ]
  %90 = xor i64 %i.015.ph, -1
  %91 = add i64 %call, %90
  %xtraiter = and i64 %call, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader, %for.body.prol
  %i.015.prol = phi i64 [ %inc.prol, %for.body.prol ], [ %i.015.ph, %for.body.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body.prol ], [ %xtraiter, %for.body.preheader ]
  %arrayidx2.prol = getelementptr inbounds i8, i8* %33, i64 %i.015.prol
  %92 = load i8, i8* %arrayidx2.prol, align 1, !tbaa !6
  %arrayidx3.prol = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %i.015.prol
  store i8 %92, i8* %arrayidx3.prol, align 1, !tbaa !6
  %inc.prol = add nuw i64 %i.015.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %for.body.prol.loopexit, label %for.body.prol, !llvm.loop !18

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %i.015.unr = phi i64 [ %i.015.ph, %for.body.preheader ], [ %inc.prol, %for.body.prol ]
  %93 = icmp ult i64 %91, 3
  br i1 %93, label %for.end, label %for.body

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %i.015 = phi i64 [ %inc.3, %for.body ], [ %i.015.unr, %for.body.prol.loopexit ]
  %arrayidx2 = getelementptr inbounds i8, i8* %33, i64 %i.015
  %94 = load i8, i8* %arrayidx2, align 1, !tbaa !6
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %i.015
  store i8 %94, i8* %arrayidx3, align 1, !tbaa !6
  %inc = add nuw i64 %i.015, 1
  %arrayidx2.1 = getelementptr inbounds i8, i8* %33, i64 %inc
  %95 = load i8, i8* %arrayidx2.1, align 1, !tbaa !6
  %arrayidx3.1 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %inc
  store i8 %95, i8* %arrayidx3.1, align 1, !tbaa !6
  %inc.1 = add nuw i64 %i.015, 2
  %arrayidx2.2 = getelementptr inbounds i8, i8* %33, i64 %inc.1
  %96 = load i8, i8* %arrayidx2.2, align 1, !tbaa !6
  %arrayidx3.2 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %inc.1
  store i8 %96, i8* %arrayidx3.2, align 1, !tbaa !6
  %inc.2 = add nuw i64 %i.015, 3
  %arrayidx2.3 = getelementptr inbounds i8, i8* %33, i64 %inc.2
  %97 = load i8, i8* %arrayidx2.3, align 1, !tbaa !6
  %arrayidx3.3 = getelementptr inbounds [100 x i8], [100 x i8]* %10, i64 0, i64 %inc.2
  store i8 %97, i8* %arrayidx3.3, align 1, !tbaa !6
  %inc.3 = add nuw i64 %i.015, 4
  %exitcond.not.3 = icmp eq i64 %inc.3, %call
  br i1 %exitcond.not.3, label %for.end, label %for.body, !llvm.loop !19

for.end:                                          ; preds = %for.body.prol.loopexit, %for.body, %middle.block, %vec.epilog.middle.block, %31
  store i8 0, i8* %arrayidx, align 1, !tbaa !6
  call void @printLine(i8* nonnull %34) #5
  call void @free(i8* %33) #5
  store i64 -506381209866536712, i64* %36, align 1
  store i32 -117901064, i32* %38, align 1
  store i8 -8, i8* %39, align 1
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %34) #5
  store i64 1172321806, i64* %12, align 8
  br i1 %6, label %105, label %98

98:                                               ; preds = %for.end
  store i64 -723401728380766731, i64* %19, align 1
  store i64 -723401728380766731, i64* %21, align 1
  store i64 -723401728380766731, i64* %23, align 1
  %99 = add nuw nsw i64 %17, 2147450904
  %100 = inttoptr i64 %99 to i64*
  store i64 -723401728380766731, i64* %100, align 1
  %101 = add i64 %7, 248
  %102 = inttoptr i64 %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = inttoptr i64 %103 to i8*
  store i8 0, i8* %104, align 1
  br label %106

105:                                              ; preds = %for.end
  store i64 0, i64* %19, align 1
  store i64 0, i64* %21, align 1
  store i64 0, i64* %23, align 1
  br label %106

106:                                              ; preds = %105, %98
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #2

declare dso_local void @printLine(i8*) local_unnamed_addr #3

; Function Attrs: inaccessiblemem_or_argmemonly nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare void @__asan_report_load2(i64) local_unnamed_addr

declare i8* @__asan_memset(i8*, i32, i64) local_unnamed_addr

declare i64 @__asan_stack_malloc_2(i64) local_unnamed_addr

declare void @__asan_init() local_unnamed_addr

define internal void @asan.module_ctor() {
  call void @__asan_init()
  call void @__asan_version_mismatch_check_v8()
  ret void
}

declare void @__asan_version_mismatch_check_v8() local_unnamed_addr

attributes #0 = { nounwind sanitize_address uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind readonly willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inaccessiblemem_or_argmemonly nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nomerge nounwind }
attributes #7 = { nobuiltin nounwind readonly willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !13, !14}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !13, !14}
