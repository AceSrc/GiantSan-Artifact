; ModuleID = 'CWE563_Unused_Variable__unused_uninit_variable_struct_22b.c.ll.o0.ll'
source_filename = "CWE563_Unused_Variable__unused_uninit_variable_struct_22b.c.new.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE563_Unused_Variable__unused_uninit_variable_struct_22_goodB2G1Global = external dso_local local_unnamed_addr global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 8
@CWE563_Unused_Variable__unused_uninit_variable_struct_22_goodB2G2Global = external dso_local local_unnamed_addr global i32, align 4
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 1, void ()* @asan.module_ctor, i8* null }]

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_uninit_variable_struct_22_goodB2G1Sink(i64 %0) local_unnamed_addr #0 {
  %2 = alloca i64, align 8
  %tmpcast = bitcast i64* %2 to %struct._twoIntsStruct*
  %3 = ptrtoint i64* %2 to i64
  %4 = add i64 %3, 8
  %5 = lshr i64 %3, 8
  %6 = and i64 %3, -256
  %7 = lshr i64 %4, 8
  %8 = and i64 %4, -256
  %9 = icmp eq i64 %7, %5
  br i1 %9, label %37, label %.lr.ph382

.lr.ph382:                                        ; preds = %1
  %10 = icmp eq i64 %6, %3
  br i1 %10, label %.lr.ph382.split.us.preheader, label %.lr.ph382.split

.lr.ph382.split.us.preheader:                     ; preds = %.lr.ph382
  %11 = sub nsw i64 %7, %5
  %.neg392 = add nuw nsw i64 %5, 1
  %xtraiter = and i64 %11, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.lr.ph382.split.us.prol.loopexit, label %.lr.ph382.split.us.prol

.lr.ph382.split.us.prol:                          ; preds = %.lr.ph382.split.us.preheader
  %12 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  %13 = load i8, i8* %12, align 1
  %.not373.us.prol = icmp eq i8 %13, 0
  br i1 %.not373.us.prol, label %18, label %14

14:                                               ; preds = %.lr.ph382.split.us.prol
  %15 = shl nuw nsw i64 %5, 5
  %16 = add nuw nsw i64 %15, 2147450880
  %17 = inttoptr i64 %16 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %17, i8 0, i64 32, i1 false) #3
  br label %18

18:                                               ; preds = %14, %.lr.ph382.split.us.prol
  %.neg.us.prol = mul i64 %5, -256
  %19 = add i64 %.neg.us.prol, %4
  %20 = trunc i64 %19 to i32
  %21 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %5
  store i32 %20, i32* %21, align 4
  %22 = add nuw nsw i64 %5, 1
  br label %.lr.ph382.split.us.prol.loopexit

.lr.ph382.split.us.prol.loopexit:                 ; preds = %18, %.lr.ph382.split.us.preheader
  %.0346380.us.unr = phi i64 [ %5, %.lr.ph382.split.us.preheader ], [ %22, %18 ]
  %23 = icmp eq i64 %7, %.neg392
  br i1 %23, label %._crit_edge, label %.lr.ph382.split.us

.lr.ph382.split.us:                               ; preds = %.lr.ph382.split.us.prol.loopexit, %194
  %.0346380.us = phi i64 [ %198, %194 ], [ %.0346380.us.unr, %.lr.ph382.split.us.prol.loopexit ]
  %24 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %.0346380.us
  %25 = load i8, i8* %24, align 1
  %.not373.us = icmp eq i8 %25, 0
  br i1 %.not373.us, label %.lr.ph382.split.us.1, label %26

26:                                               ; preds = %.lr.ph382.split.us
  %27 = shl i64 %.0346380.us, 5
  %28 = and i64 %27, 2305843009213693920
  %29 = add nuw nsw i64 %28, 2147450880
  %30 = inttoptr i64 %29 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %30, i8 0, i64 32, i1 false) #3
  br label %.lr.ph382.split.us.1

.lr.ph382.split.us.1:                             ; preds = %26, %.lr.ph382.split.us
  %.neg.us = mul i64 %.0346380.us, -256
  %31 = add i64 %.neg.us, %4
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %.0346380.us
  store i32 %32, i32* %33, align 4
  %34 = add i64 %.0346380.us, 1
  %35 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %34
  %36 = load i8, i8* %35, align 1
  %.not373.us.1 = icmp eq i8 %36, 0
  br i1 %.not373.us.1, label %194, label %189

37:                                               ; preds = %1
  %38 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  %39 = load i8, i8* %38, align 1
  %.not375 = icmp eq i8 %39, 0
  br i1 %.not375, label %40, label %44

40:                                               ; preds = %37
  store i8 1, i8* %38, align 1
  %41 = lshr exact i64 %6, 3
  %42 = add nuw nsw i64 %41, 2147450880
  %43 = inttoptr i64 %42 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %43, i8 -1, i64 32, i1 false) #3
  br label %44

44:                                               ; preds = %37, %40
  %45 = lshr exact i64 %3, 3
  %46 = add nuw nsw i64 %45, 2147450880
  %47 = inttoptr i64 %46 to i8*
  store i8 1, i8* %47, align 1
  br label %__cocheck__PoisonStack.exit

.lr.ph382.split:                                  ; preds = %.lr.ph382, %55
  %.0346380 = phi i64 [ %59, %55 ], [ %5, %.lr.ph382 ]
  %48 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %.0346380
  %49 = load i8, i8* %48, align 1
  %.not373 = icmp ne i8 %49, 0
  %.not374 = icmp ne i64 %.0346380, %5
  %or.cond = and i1 %.not373, %.not374
  br i1 %or.cond, label %50, label %55

50:                                               ; preds = %.lr.ph382.split
  %51 = shl i64 %.0346380, 5
  %52 = and i64 %51, 2305843009213693920
  %53 = add nuw nsw i64 %52, 2147450880
  %54 = inttoptr i64 %53 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %54, i8 0, i64 32, i1 false) #3
  br label %55

55:                                               ; preds = %50, %.lr.ph382.split
  %.neg = mul i64 %.0346380, -256
  %56 = add i64 %.neg, %4
  %57 = trunc i64 %56 to i32
  %58 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %.0346380
  store i32 %57, i32* %58, align 4
  %59 = add i64 %.0346380, 1
  %.not = icmp eq i64 %59, %7
  br i1 %.not, label %._crit_edge, label %.lr.ph382.split, !llvm.loop !2

._crit_edge:                                      ; preds = %55, %.lr.ph382.split.us.prol.loopexit, %194
  %60 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  %61 = load i8, i8* %60, align 1
  %.not367 = icmp eq i8 %61, 0
  br i1 %10, label %62, label %63

62:                                               ; preds = %._crit_edge
  br i1 %.not367, label %74, label %.thread

63:                                               ; preds = %._crit_edge
  br i1 %.not367, label %64, label %.thread

64:                                               ; preds = %63
  %65 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  store i8 1, i8* %65, align 1
  %66 = lshr exact i64 %6, 3
  %67 = add nuw nsw i64 %66, 2147450880
  %68 = inttoptr i64 %67 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %68, i8 -1, i64 32, i1 false) #3
  br label %.thread

.thread:                                          ; preds = %62, %63, %64
  %.pn = sub i64 256, %3
  %69 = add i64 %.pn, %6
  %70 = lshr exact i64 %3, 3
  %71 = add nuw nsw i64 %70, 2147450880
  %72 = inttoptr i64 %71 to i8*
  %73 = lshr exact i64 %69, 3
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %72, i8 0, i64 %73, i1 false) #3
  br label %74

74:                                               ; preds = %.thread, %62
  %.not368 = icmp eq i64 %4, %8
  br i1 %.not368, label %__cocheck__PoisonStack.exit, label %75

75:                                               ; preds = %74
  %76 = and i64 %4, 248
  %77 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %7
  %78 = load i8, i8* %77, align 1
  %.not370 = icmp eq i8 %78, 0
  br i1 %.not370, label %79, label %._crit_edge384

._crit_edge384:                                   ; preds = %75
  %.pre385 = lshr exact i64 %8, 3
  %.pre386 = add nuw nsw i64 %.pre385, 2147450880
  br label %83

79:                                               ; preds = %75
  store i8 1, i8* %77, align 1
  %80 = lshr exact i64 %8, 3
  %81 = add nuw nsw i64 %80, 2147450880
  %82 = inttoptr i64 %81 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %82, i8 -1, i64 32, i1 false) #3
  br label %83

83:                                               ; preds = %._crit_edge384, %79
  %.pre-phi387 = phi i64 [ %.pre386, %._crit_edge384 ], [ %81, %79 ]
  %84 = lshr exact i64 %3, 3
  %85 = add nuw nsw i64 %84, 2147450880
  %86 = add nuw nsw i64 %84, 2147450881
  %87 = icmp ult i64 %76, 129
  br i1 %87, label %88, label %166

88:                                               ; preds = %83
  %89 = lshr exact i64 %76, 3
  switch i64 %89, label %__cocheck__PoisonStack.exit [
    i64 1, label %90
    i64 2, label %92
    i64 3, label %95
    i64 4, label %99
    i64 5, label %102
    i64 6, label %106
    i64 7, label %111
    i64 8, label %117
    i64 9, label %120
    i64 10, label %124
    i64 11, label %129
    i64 12, label %135
    i64 13, label %140
    i64 14, label %146
    i64 15, label %153
    i64 16, label %161
  ]

90:                                               ; preds = %88
  %91 = inttoptr i64 %85 to i8*
  store i8 1, i8* %91, align 1
  br label %__cocheck__PoisonStack.exit

92:                                               ; preds = %88
  %93 = add nuw nsw i64 %84, 2147450879
  %94 = inttoptr i64 %93 to i16*
  store i16 258, i16* %94, align 2
  br label %__cocheck__PoisonStack.exit

95:                                               ; preds = %88
  %96 = inttoptr i64 %85 to i8*
  store i8 1, i8* %96, align 1
  %97 = add nuw nsw i64 %84, 2147450878
  %98 = inttoptr i64 %97 to i16*
  store i16 514, i16* %98, align 2
  br label %__cocheck__PoisonStack.exit

99:                                               ; preds = %88
  %100 = add nuw nsw i64 %84, 2147450877
  %101 = inttoptr i64 %100 to i32*
  store i32 16908803, i32* %101, align 4
  br label %__cocheck__PoisonStack.exit

102:                                              ; preds = %88
  %103 = inttoptr i64 %85 to i8*
  store i8 1, i8* %103, align 1
  %104 = add nuw nsw i64 %84, 2147450876
  %105 = inttoptr i64 %104 to i32*
  store i32 33686275, i32* %105, align 4
  br label %__cocheck__PoisonStack.exit

106:                                              ; preds = %88
  %107 = add nuw nsw i64 %84, 2147450879
  %108 = inttoptr i64 %107 to i16*
  store i16 258, i16* %108, align 2
  %109 = add nuw nsw i64 %84, 2147450875
  %110 = inttoptr i64 %109 to i32*
  store i32 33751811, i32* %110, align 4
  br label %__cocheck__PoisonStack.exit

111:                                              ; preds = %88
  %112 = inttoptr i64 %85 to i8*
  store i8 1, i8* %112, align 1
  %113 = add nuw nsw i64 %84, 2147450878
  %114 = inttoptr i64 %113 to i16*
  store i16 514, i16* %114, align 2
  %115 = add nuw nsw i64 %84, 2147450874
  %116 = inttoptr i64 %115 to i32*
  store i32 50529027, i32* %116, align 4
  br label %__cocheck__PoisonStack.exit

117:                                              ; preds = %88
  %118 = add nuw nsw i64 %84, 2147450873
  %119 = inttoptr i64 %118 to i64*
  store i64 72622755950035716, i64* %119, align 8
  br label %__cocheck__PoisonStack.exit

120:                                              ; preds = %88
  %121 = inttoptr i64 %85 to i8*
  store i8 1, i8* %121, align 1
  %122 = add nuw nsw i64 %84, 2147450872
  %123 = inttoptr i64 %122 to i64*
  store i64 144681449499591684, i64* %123, align 8
  br label %__cocheck__PoisonStack.exit

124:                                              ; preds = %88
  %125 = add nuw nsw i64 %84, 2147450879
  %126 = inttoptr i64 %125 to i16*
  store i16 258, i16* %126, align 2
  %127 = add nuw nsw i64 %84, 2147450871
  %128 = inttoptr i64 %127 to i64*
  store i64 144962924476367876, i64* %128, align 8
  br label %__cocheck__PoisonStack.exit

129:                                              ; preds = %88
  %130 = inttoptr i64 %85 to i8*
  store i8 1, i8* %130, align 1
  %131 = add nuw nsw i64 %84, 2147450878
  %132 = inttoptr i64 %131 to i16*
  store i16 514, i16* %132, align 2
  %133 = add nuw nsw i64 %84, 2147450870
  %134 = inttoptr i64 %133 to i64*
  store i64 217020518531073028, i64* %134, align 8
  br label %__cocheck__PoisonStack.exit

135:                                              ; preds = %88
  %136 = add nuw nsw i64 %84, 2147450877
  %137 = inttoptr i64 %136 to i32*
  store i32 16908803, i32* %137, align 4
  %138 = add nuw nsw i64 %84, 2147450869
  %139 = inttoptr i64 %138 to i64*
  store i64 217020522826040324, i64* %139, align 8
  br label %__cocheck__PoisonStack.exit

140:                                              ; preds = %88
  %141 = inttoptr i64 %85 to i8*
  store i8 1, i8* %141, align 1
  %142 = add nuw nsw i64 %84, 2147450876
  %143 = inttoptr i64 %142 to i32*
  store i32 33686275, i32* %143, align 4
  %144 = add nuw nsw i64 %84, 2147450868
  %145 = inttoptr i64 %144 to i64*
  store i64 217021622337668100, i64* %145, align 8
  br label %__cocheck__PoisonStack.exit

146:                                              ; preds = %88
  %147 = add nuw nsw i64 %84, 2147450879
  %148 = inttoptr i64 %147 to i16*
  store i16 258, i16* %148, align 2
  %149 = add nuw nsw i64 %84, 2147450875
  %150 = inttoptr i64 %149 to i32*
  store i32 33751811, i32* %150, align 4
  %151 = add nuw nsw i64 %84, 2147450867
  %152 = inttoptr i64 %151 to i64*
  store i64 217303097314378756, i64* %152, align 8
  br label %__cocheck__PoisonStack.exit

153:                                              ; preds = %88
  %154 = inttoptr i64 %85 to i8*
  store i8 1, i8* %154, align 1
  %155 = add nuw nsw i64 %84, 2147450878
  %156 = inttoptr i64 %155 to i16*
  store i16 514, i16* %156, align 2
  %157 = add nuw nsw i64 %84, 2147450874
  %158 = inttoptr i64 %157 to i32*
  store i32 50529027, i32* %158, align 4
  %159 = add nuw nsw i64 %84, 2147450866
  %160 = inttoptr i64 %159 to i64*
  store i64 289360691352306692, i64* %160, align 8
  br label %__cocheck__PoisonStack.exit

161:                                              ; preds = %88
  %162 = add nuw nsw i64 %84, 2147450873
  %163 = inttoptr i64 %162 to i64*
  store i64 72622755950035716, i64* %163, align 8
  %164 = add nuw nsw i64 %84, 2147450865
  %165 = inttoptr i64 %164 to i64*
  store i64 289360691352306693, i64* %165, align 8
  br label %__cocheck__PoisonStack.exit

166:                                              ; preds = %83
  %167 = add nuw nsw i64 %84, 2147450873
  %168 = inttoptr i64 %167 to i64*
  store i64 72622755950035716, i64* %168, align 8
  %169 = add nuw nsw i64 %84, 2147450865
  %170 = inttoptr i64 %169 to i64*
  store i64 289360691352306693, i64* %170, align 8
  %.not371377 = icmp ult i64 %169, %.pre-phi387
  br i1 %.not371377, label %__cocheck__PoisonStack.exit, label %.lr.ph

.lr.ph:                                           ; preds = %166, %.lr.ph
  %171 = phi i64 [ %176, %.lr.ph ], [ %169, %166 ]
  %.0347378 = phi i64 [ %172, %.lr.ph ], [ 4, %166 ]
  %172 = add i64 %.0347378, 1
  %173 = trunc i64 %172 to i32
  %174 = shl nuw i32 1, %173
  %175 = sext i32 %174 to i64
  %176 = sub nsw i64 %86, %175
  %177 = add i64 %176, 1
  %178 = icmp ult i64 %177, %.pre-phi387
  %spec.select = select i1 %178, i64 %.pre-phi387, i64 %177
  %179 = inttoptr i64 %spec.select to i8*
  %180 = trunc i64 %172 to i8
  %181 = add nsw i64 %171, 1
  %182 = sub i64 %181, %spec.select
  call void @llvm.memset.p0i8.i64(i8* align 1 %179, i8 %180, i64 %182, i1 false) #3
  %.not371 = icmp ult i64 %176, %.pre-phi387
  br i1 %.not371, label %__cocheck__PoisonStack.exit, label %.lr.ph, !llvm.loop !4

__cocheck__PoisonStack.exit:                      ; preds = %.lr.ph, %166, %90, %92, %95, %99, %102, %106, %111, %117, %120, %124, %129, %135, %140, %146, %153, %161, %88, %44, %74
  store i64 %0, i64* %2, align 8
  %183 = load i32, i32* @CWE563_Unused_Variable__unused_uninit_variable_struct_22_goodB2G1Global, align 4
  %.not369 = icmp eq i32 %183, 0
  br i1 %.not369, label %185, label %184

184:                                              ; preds = %__cocheck__PoisonStack.exit
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #3
  br label %188

185:                                              ; preds = %__cocheck__PoisonStack.exit
  %186 = bitcast i64* %2 to i32*
  store i32 0, i32* %186, align 8
  %187 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %tmpcast, i64 0, i32 1
  store i32 0, i32* %187, align 4
  call void @printStructLine(%struct._twoIntsStruct* nonnull %tmpcast) #3
  br label %188

188:                                              ; preds = %185, %184
  ret void

189:                                              ; preds = %.lr.ph382.split.us.1
  %190 = shl i64 %34, 5
  %191 = and i64 %190, 2305843009213693920
  %192 = add nuw nsw i64 %191, 2147450880
  %193 = inttoptr i64 %192 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %193, i8 0, i64 32, i1 false) #3
  br label %194

194:                                              ; preds = %189, %.lr.ph382.split.us.1
  %.neg.us.1 = mul i64 %34, -256
  %195 = add i64 %.neg.us.1, %4
  %196 = trunc i64 %195 to i32
  %197 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %34
  store i32 %196, i32* %197, align 4
  %198 = add i64 %.0346380.us, 2
  %.not.us.1 = icmp eq i64 %198, %7
  br i1 %.not.us.1, label %._crit_edge, label %.lr.ph382.split.us, !llvm.loop !2
}

declare dso_local void @printLine(i8*) local_unnamed_addr #1

declare dso_local void @printStructLine(%struct._twoIntsStruct*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_uninit_variable_struct_22_goodB2G2Sink(i64 %0) local_unnamed_addr #0 {
  %2 = alloca i64, align 8
  %tmpcast = bitcast i64* %2 to %struct._twoIntsStruct*
  %3 = ptrtoint i64* %2 to i64
  %4 = add i64 %3, 8
  %5 = lshr i64 %3, 8
  %6 = and i64 %3, -256
  %7 = lshr i64 %4, 8
  %8 = and i64 %4, -256
  %9 = icmp eq i64 %7, %5
  br i1 %9, label %37, label %.lr.ph382

.lr.ph382:                                        ; preds = %1
  %10 = icmp eq i64 %6, %3
  br i1 %10, label %.lr.ph382.split.us.preheader, label %.lr.ph382.split

.lr.ph382.split.us.preheader:                     ; preds = %.lr.ph382
  %11 = sub nsw i64 %7, %5
  %.neg392 = add nuw nsw i64 %5, 1
  %xtraiter = and i64 %11, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.lr.ph382.split.us.prol.loopexit, label %.lr.ph382.split.us.prol

.lr.ph382.split.us.prol:                          ; preds = %.lr.ph382.split.us.preheader
  %12 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  %13 = load i8, i8* %12, align 1
  %.not373.us.prol = icmp eq i8 %13, 0
  br i1 %.not373.us.prol, label %18, label %14

14:                                               ; preds = %.lr.ph382.split.us.prol
  %15 = shl nuw nsw i64 %5, 5
  %16 = add nuw nsw i64 %15, 2147450880
  %17 = inttoptr i64 %16 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %17, i8 0, i64 32, i1 false) #3
  br label %18

18:                                               ; preds = %14, %.lr.ph382.split.us.prol
  %.neg.us.prol = mul i64 %5, -256
  %19 = add i64 %.neg.us.prol, %4
  %20 = trunc i64 %19 to i32
  %21 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %5
  store i32 %20, i32* %21, align 4
  %22 = add nuw nsw i64 %5, 1
  br label %.lr.ph382.split.us.prol.loopexit

.lr.ph382.split.us.prol.loopexit:                 ; preds = %18, %.lr.ph382.split.us.preheader
  %.0346380.us.unr = phi i64 [ %5, %.lr.ph382.split.us.preheader ], [ %22, %18 ]
  %23 = icmp eq i64 %7, %.neg392
  br i1 %23, label %._crit_edge, label %.lr.ph382.split.us

.lr.ph382.split.us:                               ; preds = %.lr.ph382.split.us.prol.loopexit, %193
  %.0346380.us = phi i64 [ %197, %193 ], [ %.0346380.us.unr, %.lr.ph382.split.us.prol.loopexit ]
  %24 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %.0346380.us
  %25 = load i8, i8* %24, align 1
  %.not373.us = icmp eq i8 %25, 0
  br i1 %.not373.us, label %.lr.ph382.split.us.1, label %26

26:                                               ; preds = %.lr.ph382.split.us
  %27 = shl i64 %.0346380.us, 5
  %28 = and i64 %27, 2305843009213693920
  %29 = add nuw nsw i64 %28, 2147450880
  %30 = inttoptr i64 %29 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %30, i8 0, i64 32, i1 false) #3
  br label %.lr.ph382.split.us.1

.lr.ph382.split.us.1:                             ; preds = %26, %.lr.ph382.split.us
  %.neg.us = mul i64 %.0346380.us, -256
  %31 = add i64 %.neg.us, %4
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %.0346380.us
  store i32 %32, i32* %33, align 4
  %34 = add i64 %.0346380.us, 1
  %35 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %34
  %36 = load i8, i8* %35, align 1
  %.not373.us.1 = icmp eq i8 %36, 0
  br i1 %.not373.us.1, label %193, label %188

37:                                               ; preds = %1
  %38 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  %39 = load i8, i8* %38, align 1
  %.not375 = icmp eq i8 %39, 0
  br i1 %.not375, label %40, label %44

40:                                               ; preds = %37
  store i8 1, i8* %38, align 1
  %41 = lshr exact i64 %6, 3
  %42 = add nuw nsw i64 %41, 2147450880
  %43 = inttoptr i64 %42 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %43, i8 -1, i64 32, i1 false) #3
  br label %44

44:                                               ; preds = %37, %40
  %45 = lshr exact i64 %3, 3
  %46 = add nuw nsw i64 %45, 2147450880
  %47 = inttoptr i64 %46 to i8*
  store i8 1, i8* %47, align 1
  br label %__cocheck__PoisonStack.exit

.lr.ph382.split:                                  ; preds = %.lr.ph382, %55
  %.0346380 = phi i64 [ %59, %55 ], [ %5, %.lr.ph382 ]
  %48 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %.0346380
  %49 = load i8, i8* %48, align 1
  %.not373 = icmp ne i8 %49, 0
  %.not374 = icmp ne i64 %.0346380, %5
  %or.cond = and i1 %.not373, %.not374
  br i1 %or.cond, label %50, label %55

50:                                               ; preds = %.lr.ph382.split
  %51 = shl i64 %.0346380, 5
  %52 = and i64 %51, 2305843009213693920
  %53 = add nuw nsw i64 %52, 2147450880
  %54 = inttoptr i64 %53 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %54, i8 0, i64 32, i1 false) #3
  br label %55

55:                                               ; preds = %50, %.lr.ph382.split
  %.neg = mul i64 %.0346380, -256
  %56 = add i64 %.neg, %4
  %57 = trunc i64 %56 to i32
  %58 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %.0346380
  store i32 %57, i32* %58, align 4
  %59 = add i64 %.0346380, 1
  %.not = icmp eq i64 %59, %7
  br i1 %.not, label %._crit_edge, label %.lr.ph382.split, !llvm.loop !2

._crit_edge:                                      ; preds = %55, %.lr.ph382.split.us.prol.loopexit, %193
  %60 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  %61 = load i8, i8* %60, align 1
  %.not367 = icmp eq i8 %61, 0
  br i1 %10, label %62, label %63

62:                                               ; preds = %._crit_edge
  br i1 %.not367, label %74, label %.thread

63:                                               ; preds = %._crit_edge
  br i1 %.not367, label %64, label %.thread

64:                                               ; preds = %63
  %65 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %5
  store i8 1, i8* %65, align 1
  %66 = lshr exact i64 %6, 3
  %67 = add nuw nsw i64 %66, 2147450880
  %68 = inttoptr i64 %67 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %68, i8 -1, i64 32, i1 false) #3
  br label %.thread

.thread:                                          ; preds = %62, %63, %64
  %.pn = sub i64 256, %3
  %69 = add i64 %.pn, %6
  %70 = lshr exact i64 %3, 3
  %71 = add nuw nsw i64 %70, 2147450880
  %72 = inttoptr i64 %71 to i8*
  %73 = lshr exact i64 %69, 3
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %72, i8 0, i64 %73, i1 false) #3
  br label %74

74:                                               ; preds = %.thread, %62
  %.not368 = icmp eq i64 %4, %8
  br i1 %.not368, label %__cocheck__PoisonStack.exit, label %75

75:                                               ; preds = %74
  %76 = and i64 %4, 248
  %77 = getelementptr inbounds i8, i8* inttoptr (i64 19793356750848 to i8*), i64 %7
  %78 = load i8, i8* %77, align 1
  %.not370 = icmp eq i8 %78, 0
  br i1 %.not370, label %79, label %._crit_edge384

._crit_edge384:                                   ; preds = %75
  %.pre385 = lshr exact i64 %8, 3
  %.pre386 = add nuw nsw i64 %.pre385, 2147450880
  br label %83

79:                                               ; preds = %75
  store i8 1, i8* %77, align 1
  %80 = lshr exact i64 %8, 3
  %81 = add nuw nsw i64 %80, 2147450880
  %82 = inttoptr i64 %81 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %82, i8 -1, i64 32, i1 false) #3
  br label %83

83:                                               ; preds = %._crit_edge384, %79
  %.pre-phi387 = phi i64 [ %.pre386, %._crit_edge384 ], [ %81, %79 ]
  %84 = lshr exact i64 %3, 3
  %85 = add nuw nsw i64 %84, 2147450880
  %86 = add nuw nsw i64 %84, 2147450881
  %87 = icmp ult i64 %76, 129
  br i1 %87, label %88, label %166

88:                                               ; preds = %83
  %89 = lshr exact i64 %76, 3
  switch i64 %89, label %__cocheck__PoisonStack.exit [
    i64 1, label %90
    i64 2, label %92
    i64 3, label %95
    i64 4, label %99
    i64 5, label %102
    i64 6, label %106
    i64 7, label %111
    i64 8, label %117
    i64 9, label %120
    i64 10, label %124
    i64 11, label %129
    i64 12, label %135
    i64 13, label %140
    i64 14, label %146
    i64 15, label %153
    i64 16, label %161
  ]

90:                                               ; preds = %88
  %91 = inttoptr i64 %85 to i8*
  store i8 1, i8* %91, align 1
  br label %__cocheck__PoisonStack.exit

92:                                               ; preds = %88
  %93 = add nuw nsw i64 %84, 2147450879
  %94 = inttoptr i64 %93 to i16*
  store i16 258, i16* %94, align 2
  br label %__cocheck__PoisonStack.exit

95:                                               ; preds = %88
  %96 = inttoptr i64 %85 to i8*
  store i8 1, i8* %96, align 1
  %97 = add nuw nsw i64 %84, 2147450878
  %98 = inttoptr i64 %97 to i16*
  store i16 514, i16* %98, align 2
  br label %__cocheck__PoisonStack.exit

99:                                               ; preds = %88
  %100 = add nuw nsw i64 %84, 2147450877
  %101 = inttoptr i64 %100 to i32*
  store i32 16908803, i32* %101, align 4
  br label %__cocheck__PoisonStack.exit

102:                                              ; preds = %88
  %103 = inttoptr i64 %85 to i8*
  store i8 1, i8* %103, align 1
  %104 = add nuw nsw i64 %84, 2147450876
  %105 = inttoptr i64 %104 to i32*
  store i32 33686275, i32* %105, align 4
  br label %__cocheck__PoisonStack.exit

106:                                              ; preds = %88
  %107 = add nuw nsw i64 %84, 2147450879
  %108 = inttoptr i64 %107 to i16*
  store i16 258, i16* %108, align 2
  %109 = add nuw nsw i64 %84, 2147450875
  %110 = inttoptr i64 %109 to i32*
  store i32 33751811, i32* %110, align 4
  br label %__cocheck__PoisonStack.exit

111:                                              ; preds = %88
  %112 = inttoptr i64 %85 to i8*
  store i8 1, i8* %112, align 1
  %113 = add nuw nsw i64 %84, 2147450878
  %114 = inttoptr i64 %113 to i16*
  store i16 514, i16* %114, align 2
  %115 = add nuw nsw i64 %84, 2147450874
  %116 = inttoptr i64 %115 to i32*
  store i32 50529027, i32* %116, align 4
  br label %__cocheck__PoisonStack.exit

117:                                              ; preds = %88
  %118 = add nuw nsw i64 %84, 2147450873
  %119 = inttoptr i64 %118 to i64*
  store i64 72622755950035716, i64* %119, align 8
  br label %__cocheck__PoisonStack.exit

120:                                              ; preds = %88
  %121 = inttoptr i64 %85 to i8*
  store i8 1, i8* %121, align 1
  %122 = add nuw nsw i64 %84, 2147450872
  %123 = inttoptr i64 %122 to i64*
  store i64 144681449499591684, i64* %123, align 8
  br label %__cocheck__PoisonStack.exit

124:                                              ; preds = %88
  %125 = add nuw nsw i64 %84, 2147450879
  %126 = inttoptr i64 %125 to i16*
  store i16 258, i16* %126, align 2
  %127 = add nuw nsw i64 %84, 2147450871
  %128 = inttoptr i64 %127 to i64*
  store i64 144962924476367876, i64* %128, align 8
  br label %__cocheck__PoisonStack.exit

129:                                              ; preds = %88
  %130 = inttoptr i64 %85 to i8*
  store i8 1, i8* %130, align 1
  %131 = add nuw nsw i64 %84, 2147450878
  %132 = inttoptr i64 %131 to i16*
  store i16 514, i16* %132, align 2
  %133 = add nuw nsw i64 %84, 2147450870
  %134 = inttoptr i64 %133 to i64*
  store i64 217020518531073028, i64* %134, align 8
  br label %__cocheck__PoisonStack.exit

135:                                              ; preds = %88
  %136 = add nuw nsw i64 %84, 2147450877
  %137 = inttoptr i64 %136 to i32*
  store i32 16908803, i32* %137, align 4
  %138 = add nuw nsw i64 %84, 2147450869
  %139 = inttoptr i64 %138 to i64*
  store i64 217020522826040324, i64* %139, align 8
  br label %__cocheck__PoisonStack.exit

140:                                              ; preds = %88
  %141 = inttoptr i64 %85 to i8*
  store i8 1, i8* %141, align 1
  %142 = add nuw nsw i64 %84, 2147450876
  %143 = inttoptr i64 %142 to i32*
  store i32 33686275, i32* %143, align 4
  %144 = add nuw nsw i64 %84, 2147450868
  %145 = inttoptr i64 %144 to i64*
  store i64 217021622337668100, i64* %145, align 8
  br label %__cocheck__PoisonStack.exit

146:                                              ; preds = %88
  %147 = add nuw nsw i64 %84, 2147450879
  %148 = inttoptr i64 %147 to i16*
  store i16 258, i16* %148, align 2
  %149 = add nuw nsw i64 %84, 2147450875
  %150 = inttoptr i64 %149 to i32*
  store i32 33751811, i32* %150, align 4
  %151 = add nuw nsw i64 %84, 2147450867
  %152 = inttoptr i64 %151 to i64*
  store i64 217303097314378756, i64* %152, align 8
  br label %__cocheck__PoisonStack.exit

153:                                              ; preds = %88
  %154 = inttoptr i64 %85 to i8*
  store i8 1, i8* %154, align 1
  %155 = add nuw nsw i64 %84, 2147450878
  %156 = inttoptr i64 %155 to i16*
  store i16 514, i16* %156, align 2
  %157 = add nuw nsw i64 %84, 2147450874
  %158 = inttoptr i64 %157 to i32*
  store i32 50529027, i32* %158, align 4
  %159 = add nuw nsw i64 %84, 2147450866
  %160 = inttoptr i64 %159 to i64*
  store i64 289360691352306692, i64* %160, align 8
  br label %__cocheck__PoisonStack.exit

161:                                              ; preds = %88
  %162 = add nuw nsw i64 %84, 2147450873
  %163 = inttoptr i64 %162 to i64*
  store i64 72622755950035716, i64* %163, align 8
  %164 = add nuw nsw i64 %84, 2147450865
  %165 = inttoptr i64 %164 to i64*
  store i64 289360691352306693, i64* %165, align 8
  br label %__cocheck__PoisonStack.exit

166:                                              ; preds = %83
  %167 = add nuw nsw i64 %84, 2147450873
  %168 = inttoptr i64 %167 to i64*
  store i64 72622755950035716, i64* %168, align 8
  %169 = add nuw nsw i64 %84, 2147450865
  %170 = inttoptr i64 %169 to i64*
  store i64 289360691352306693, i64* %170, align 8
  %.not371377 = icmp ult i64 %169, %.pre-phi387
  br i1 %.not371377, label %__cocheck__PoisonStack.exit, label %.lr.ph

.lr.ph:                                           ; preds = %166, %.lr.ph
  %171 = phi i64 [ %176, %.lr.ph ], [ %169, %166 ]
  %.0347378 = phi i64 [ %172, %.lr.ph ], [ 4, %166 ]
  %172 = add i64 %.0347378, 1
  %173 = trunc i64 %172 to i32
  %174 = shl nuw i32 1, %173
  %175 = sext i32 %174 to i64
  %176 = sub nsw i64 %86, %175
  %177 = add i64 %176, 1
  %178 = icmp ult i64 %177, %.pre-phi387
  %spec.select = select i1 %178, i64 %.pre-phi387, i64 %177
  %179 = inttoptr i64 %spec.select to i8*
  %180 = trunc i64 %172 to i8
  %181 = add nsw i64 %171, 1
  %182 = sub i64 %181, %spec.select
  call void @llvm.memset.p0i8.i64(i8* align 1 %179, i8 %180, i64 %182, i1 false) #3
  %.not371 = icmp ult i64 %176, %.pre-phi387
  br i1 %.not371, label %__cocheck__PoisonStack.exit, label %.lr.ph, !llvm.loop !4

__cocheck__PoisonStack.exit:                      ; preds = %.lr.ph, %166, %90, %92, %95, %99, %102, %106, %111, %117, %120, %124, %129, %135, %140, %146, %153, %161, %88, %44, %74
  %183 = load i32, i32* @CWE563_Unused_Variable__unused_uninit_variable_struct_22_goodB2G2Global, align 4
  %.not369 = icmp eq i32 %183, 0
  br i1 %.not369, label %187, label %184

184:                                              ; preds = %__cocheck__PoisonStack.exit
  %185 = bitcast i64* %2 to i32*
  store i32 0, i32* %185, align 8
  %186 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %tmpcast, i64 0, i32 1
  store i32 0, i32* %186, align 4
  call void @printStructLine(%struct._twoIntsStruct* nonnull %tmpcast) #3
  br label %187

187:                                              ; preds = %184, %__cocheck__PoisonStack.exit
  ret void

188:                                              ; preds = %.lr.ph382.split.us.1
  %189 = shl i64 %34, 5
  %190 = and i64 %189, 2305843009213693920
  %191 = add nuw nsw i64 %190, 2147450880
  %192 = inttoptr i64 %191 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 32 dereferenceable(32) %192, i8 0, i64 32, i1 false) #3
  br label %193

193:                                              ; preds = %188, %.lr.ph382.split.us.1
  %.neg.us.1 = mul i64 %34, -256
  %194 = add i64 %.neg.us.1, %4
  %195 = trunc i64 %194 to i32
  %196 = getelementptr inbounds i32, i32* inttoptr (i64 17594333495296 to i32*), i64 %34
  store i32 %195, i32* %196, align 4
  %197 = add i64 %.0346380.us, 2
  %.not.us.1 = icmp eq i64 %197, %7
  br i1 %.not.us.1, label %._crit_edge, label %.lr.ph382.split.us, !llvm.loop !2
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

define internal void @asan.module_ctor() {
  tail call void @__cocheck__globalInit()
  tail call void @__cocheck__globalRegister(i64 ptrtoint ([21 x i8]* @.str to i64), i64 21)
  ret void
}

declare void @__cocheck__globalInit() local_unnamed_addr

declare void @__cocheck__globalRegister(i64, i64) local_unnamed_addr

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
!4 = distinct !{!4, !3}
