define internal fastcc void @goodG2B() unnamed_addr #3 !dbg !59 {
entry:
  %Quasi_Bound = alloca i64, align 8, !dbg !77, !nosanitize !2
  %Quasi_Bound16 = alloca i64, align 8, !dbg !77, !nosanitize !2
  %0 = load i32, i32* @__asan_option_detect_stack_use_after_return, align 4
  %.not = icmp eq i32 %0, 0
  br i1 %.not, label %.thread, label %1

1:                                                ; preds = %entry
  %2 = call i64 @__asan_stack_malloc_2(i64 192) #6
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %.thread, label %5
Quasi_Bound16
.thread:                                          ; preds = %entry, %1
  %MyAlloca24 = alloca [192 x i8], align 32
  %4 = ptrtoint [192 x i8]* %MyAlloca24 to i64
  br label %5

5:                                                ; preds = %1, %.thread
  %6 = phi i1 [ false, %1 ], [ true, %.thread ]
  %7 = phi i64 [ %2, %1 ], [ 0, %.thread ]
  %8 = phi i64 [ %2, %1 ], [ %4, %.thread ]
  call void @llvm.dbg.value(metadata i64 undef, metadata !72, metadata !DIExpression(DW_OP_deref, DW_OP_plus_uconst, 32)), !dbg !81
  call void @llvm.dbg.value(metadata i64 undef, metadata !76, metadata !DIExpression(DW_OP_deref, DW_OP_plus_uconst, 112)), !dbg !81
  %9 = add i64 %8, 32
  %10 = inttoptr i64 %9 to [10 x i32]*
  %11 = add i64 %8, 112
  %12 = inttoptr i64 %11 to [10 x i32]*
  %13 = inttoptr i64 %8 to i64*
  store i64 1102416563, i64* %13, align 8
  %14 = add i64 %8, 8
  %15 = inttoptr i64 %14 to i64*
  store i64 ptrtoint ([41 x i8]* @___asan_gen_ to i64), i64* %15, align 8
  %16 = add i64 %8, 16
  %17 = inttoptr i64 %16 to i64*
  store i64 ptrtoint (void ()* @goodG2B to i64), i64* %17, align 8
  %18 = lshr i64 %8, 3
  %19 = add nuw nsw i64 %18, 2147450880
  %20 = inttoptr i64 %19 to i64*
  store i64 -506381209984437775, i64* %20, align 1
  %21 = add nuw nsw i64 %18, 2147450888
  %22 = inttoptr i64 %21 to i64*
  store i64 -506387832807165192, i64* %22, align 1
  %23 = add nuw nsw i64 %18, 2147450896
  %24 = inttoptr i64 %23 to i64*
  store i64 -868082074056591112, i64* %24, align 1
  call void @llvm.dbg.value(metadata i32 7, metadata !61, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.value(metadata i32 7, metadata !62, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.value(metadata i32 7, metadata !68, metadata !DIExpression()), !dbg !83
  %25 = inttoptr i64 %9 to i8*, !dbg !84
  %26 = add nuw nsw i64 %18, 2147450884, !dbg !84
  %27 = inttoptr i64 %26 to i32*, !dbg !84
  store i32 1061109310, i32* %27, align 1, !dbg !84
  %28 = inttoptr i64 %21 to i8*, !dbg !84
  store i8 64, i8* %28, align 1, !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %25) #6, !dbg !84
  %29 = call i8* @__asan_memset(i8* %25, i32 0, i64 40) #6, !dbg !85
  %30 = inttoptr i64 %11 to i8*, !dbg !86
  %31 = add nuw nsw i64 %18, 2147450894, !dbg !86
  %32 = inttoptr i64 %31 to i32*, !dbg !86
  store i32 1061109310, i32* %32, align 1, !dbg !86
  %33 = add nuw nsw i64 %18, 2147450898, !dbg !86
  %34 = inttoptr i64 %33 to i8*, !dbg !86
  store i8 64, i8* %34, align 1, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %30) #6, !dbg !86
  %35 = call i8* @__asan_memset(i8* %30, i32 0, i64 40) #6, !dbg !87
  %36 = getelementptr inbounds [10 x i32], [10 x i32]* %12, i64 0, i64 0, !dbg !87
  store i32 1, i32* %36, align 16, !dbg !87
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %10, i64 0, i64 7, !dbg !88
  store i32 1, i32* %arrayidx, align 4, !dbg !89, !tbaa !90
  call void @llvm.dbg.value(metadata i32 0, metadata !70, metadata !DIExpression()), !dbg !81
  store i64 %9, i64* %Quasi_Bound, align 8, !dbg !77
  store i64 %11, i64* %Quasi_Bound16, align 8, !dbg !77
  br label %for.body, !dbg !77

for.body:                                         ; preds = %5, %43
  %indvars.iv = phi i64 [ 0, %5 ], [ %indvars.iv.next, %43 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !70, metadata !DIExpression()), !dbg !81
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %10, i64 0, i64 %indvars.iv, !dbg !94
  %Quasi_Bound.0. = load i64, i64* %Quasi_Bound, align 8, !dbg !94
  %37 = ptrtoint i32* %arrayidx4 to i64, !dbg !94
  %.not19 = icmp ugt i64 %Quasi_Bound.0., %37, !dbg !94
  br i1 %.not19, label %39, label %38, !dbg !94

38:                                               ; preds = %for.body
  store i64 %37, i64* %Quasi_Bound, align 8, !dbg !94
  br label %39, !dbg !94

39:                                               ; preds = %for.body, %38
  %40 = load i32, i32* %arrayidx4, align 4, !dbg !94, !tbaa !90
  tail call void @printIntLine(i32 %40) #6, !dbg !97
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %12, i64 0, i64 %indvars.iv, !dbg !98
  %Quasi_Bound16.0. = load i64, i64* %Quasi_Bound16, align 8, !dbg !98
  %41 = ptrtoint i32* %arrayidx6 to i64, !dbg !98
  %.not20 = icmp ugt i64 %Quasi_Bound16.0., %41, !dbg !98
  br i1 %.not20, label %43, label %42, !dbg !98

42:                                               ; preds = %39
  store i64 %41, i64* %Quasi_Bound16, align 8, !dbg !98
  br label %43, !dbg !98

43:                                               ; preds = %39, %42
  %44 = load i32, i32* %arrayidx6, align 4, !dbg !98, !tbaa !90
  tail call void @printIntLine(i32 %44) #6, !dbg !99
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !100
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !70, metadata !DIExpression()), !dbg !81
  %exitcond.not = icmp eq i64 %indvars.iv.next, 10, !dbg !101
  br i1 %exitcond.not, label %if.end, label %for.body, !dbg !77, !llvm.loop !102

if.end:                                           ; preds = %43
  %Quasi_Bound.0.quasi_bound_for_check = load volatile i64, i64* %Quasi_Bound, align 8, !dbg !106
  %45 = lshr i64 %9, 3, !dbg !106
  %46 = add nuw nsw i64 %45, 2147450880, !dbg !106
  %47 = inttoptr i64 %46 to i8*, !dbg !106
  %48 = load volatile i8, i8* %47, align 1, !dbg !106
  %49 = icmp ult i8 %48, 65, !dbg !106
  %50 = sub i8 67, %48, !dbg !106
  %51 = zext i8 %50 to i64, !dbg !106
  %52 = zext i1 %49 to i64, !dbg !106
  %53 = shl nuw i64 %52, %51, !dbg !106
  %54 = and i64 %9, -8, !dbg !106
  %55 = add i64 %53, %54, !dbg !106
  %56 = icmp ugt i64 %Quasi_Bound.0.quasi_bound_for_check, %55, !dbg !106
  br i1 %56, label %57, label %75, !dbg !106

57:                                               ; preds = %if.end
  %58 = sub i64 %Quasi_Bound.0.quasi_bound_for_check, %53, !dbg !106
  %59 = lshr i64 %58, 3, !dbg !106
  %60 = add nuw nsw i64 %59, 2147450880, !dbg !106
  %61 = inttoptr i64 %60 to i8*, !dbg !106
  %62 = load volatile i8, i8* %61, align 1, !dbg !106
  %.not23 = icmp eq i8 %48, %62, !dbg !106
  br i1 %.not23, label %64, label %63, !dbg !106

63:                                               ; preds = %57
  call void @__asan_report_load2(i64 %9) #7, !dbg !106
  unreachable, !dbg !106

64:                                               ; preds = %57
  %65 = add i64 %Quasi_Bound.0.quasi_bound_for_check, -1, !dbg !106
  %66 = lshr i64 %65, 3, !dbg !106
  %67 = add nuw nsw i64 %66, 2147450880, !dbg !106
  %68 = inttoptr i64 %67 to i8*, !dbg !106
  %69 = load volatile i8, i8* %68, align 1, !dbg !106
  %70 = trunc i64 %Quasi_Bound.0.quasi_bound_for_check to i8, !dbg !106
  %71 = and i8 %70, 7, !dbg !106
  %72 = sub nuw nsw i8 72, %71, !dbg !106
  %73 = icmp ugt i8 %69, %72, !dbg !106
  br i1 %73, label %74, label %75, !dbg !106

74:                                               ; preds = %64
  call void @__asan_report_load2(i64 %9) #7, !dbg !106
  unreachable, !dbg !106

75:                                               ; preds = %64, %if.end
  %Quasi_Bound16.0.quasi_bound_for_check17 = load volatile i64, i64* %Quasi_Bound16, align 8, !dbg !106
  %76 = lshr i64 %11, 3, !dbg !106
  %77 = add nuw nsw i64 %76, 2147450880, !dbg !106
  %78 = inttoptr i64 %77 to i8*, !dbg !106
  %79 = load volatile i8, i8* %78, align 1, !dbg !106
  %80 = icmp ult i8 %79, 65, !dbg !106
  %81 = sub i8 67, %79, !dbg !106
  %82 = zext i8 %81 to i64, !dbg !106
  %83 = zext i1 %80 to i64, !dbg !106
  %84 = shl nuw i64 %83, %82, !dbg !106
  %85 = and i64 %11, -8, !dbg !106
  %86 = add i64 %84, %85, !dbg !106
  %87 = icmp ugt i64 %Quasi_Bound16.0.quasi_bound_for_check17, %86, !dbg !106
  br i1 %87, label %88, label %106, !dbg !106

88:                                               ; preds = %75
  %89 = sub i64 %Quasi_Bound16.0.quasi_bound_for_check17, %84, !dbg !106
  %90 = lshr i64 %89, 3, !dbg !106
  %91 = add nuw nsw i64 %90, 2147450880, !dbg !106
  %92 = inttoptr i64 %91 to i8*, !dbg !106
  %93 = load volatile i8, i8* %92, align 1, !dbg !106
  %.not22 = icmp eq i8 %79, %93, !dbg !106
  br i1 %.not22, label %95, label %94, !dbg !106

94:                                               ; preds = %88
  call void @__asan_report_load2(i64 %11) #7, !dbg !106
  unreachable, !dbg !106

95:                                               ; preds = %88
  %96 = add i64 %Quasi_Bound16.0.quasi_bound_for_check17, -1, !dbg !106
  %97 = lshr i64 %96, 3, !dbg !106
  %98 = add nuw nsw i64 %97, 2147450880, !dbg !106
  %99 = inttoptr i64 %98 to i8*, !dbg !106
  %100 = load volatile i8, i8* %99, align 1, !dbg !106
  %101 = trunc i64 %Quasi_Bound16.0.quasi_bound_for_check17 to i8, !dbg !106
  %102 = and i8 %101, 7, !dbg !106
  %103 = sub nuw nsw i8 72, %102, !dbg !106
  %104 = icmp ugt i8 %100, %103, !dbg !106
  br i1 %104, label %105, label %106, !dbg !106

105:                                              ; preds = %95
  call void @__asan_report_load2(i64 %11) #7, !dbg !106
  unreachable, !dbg !106

106:                                              ; preds = %95, %75
  store i32 -117901064, i32* %32, align 1, !dbg !106
  store i8 -8, i8* %34, align 1, !dbg !106
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %30) #6, !dbg !106
  store i32 -117901064, i32* %27, align 1, !dbg !106
  store i8 -8, i8* %28, align 1, !dbg !106
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #6, !dbg !106
  store i64 1172321806, i64* %13, align 8, !dbg !107
  br i1 %6, label %114, label %107, !dbg !107

107:                                              ; preds = %106
  store i64 -723401728380766731, i64* %20, align 1, !dbg !107
  store i64 -723401728380766731, i64* %22, align 1, !dbg !107
  store i64 -723401728380766731, i64* %24, align 1, !dbg !107
  %108 = add nuw nsw i64 %18, 2147450904, !dbg !107
  %109 = inttoptr i64 %108 to i64*, !dbg !107
  store i64 -723401728380766731, i64* %109, align 1, !dbg !107
  %110 = add i64 %7, 248, !dbg !107
  %111 = inttoptr i64 %110 to i64*, !dbg !107
  %112 = load i64, i64* %111, align 8, !dbg !107
  %113 = inttoptr i64 %112 to i8*, !dbg !107
  store i8 0, i8* %113, align 1, !dbg !107
  br label %115, !dbg !107

114:                                              ; preds = %106
  store i64 0, i64* %20, align 1, !dbg !107
  store i64 0, i64* %22, align 1, !dbg !107
  store i64 0, i64* %24, align 1, !dbg !107
  br label %115, !dbg !107

115:                                              ; preds = %114, %107
  ret void, !dbg !107
}

