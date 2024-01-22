; ModuleID = 'CWE563_Unused_Variable__unused_value_int64_t_17.c.new.c'
source_filename = "CWE563_Unused_Variable__unused_value_int64_t_17.c.new.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@__cocheck__loadGuardian.cache = internal global i32* inttoptr (i64 17594333495296 to i32*), align 8
@__cocheck__poisonArea.cache = internal global i32* inttoptr (i64 17594333495296 to i32*), align 8
@__cocheck__poisonArea.blockUsed = internal global i8* inttoptr (i64 19793356750848 to i8*), align 8
@__cocheck___poisonArea.blockUsed = internal global i8* inttoptr (i64 19793356750848 to i8*), align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE563_Unused_Variable__unused_value_int64_t_17_good() #0 {
  call void @goodB2G()
  call void @goodG2B()
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
  %6 = call i64 @time(i64* null) #4
  %7 = trunc i64 %6 to i32
  call void @srand(i32 %7) #4
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0))
  call void @CWE563_Unused_Variable__unused_value_int64_t_17_good()
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @__cocheck__recheck(i64 %0, i64 %1, i64 %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i32, align 4
  %13 = alloca i8, align 1
  %14 = alloca i8*, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  store i64 %0, i64* %22, align 8
  store i64 %1, i64* %23, align 8
  store i64 %2, i64* %24, align 8
  %25 = load i64, i64* %22, align 8
  %26 = inttoptr i64 %25 to i8*
  %27 = load i64, i64* %23, align 8
  %28 = inttoptr i64 %27 to i8*
  %29 = load i64, i64* %24, align 8
  store i8* %26, i8** %17, align 8
  store i8* %28, i8** %18, align 8
  store i64 %29, i64* %19, align 8
  %30 = load i8*, i8** %17, align 8
  %31 = ptrtoint i8* %30 to i64
  store i64 %31, i64* %20, align 8
  %32 = load i8*, i8** %18, align 8
  %33 = ptrtoint i8* %32 to i64
  store i64 %33, i64* %21, align 8
  %34 = load i8*, i8** %18, align 8
  %35 = load i64, i64* %20, align 8
  %36 = load i64, i64* %21, align 8
  %37 = sub i64 %35, %36
  %38 = add i64 %37, 1
  %39 = load i64, i64* %19, align 8
  store i8* %34, i8** %14, align 8
  store i64 %38, i64* %15, align 8
  store i64 %39, i64* %16, align 8
  %40 = load i8*, i8** %14, align 8
  %41 = load i64, i64* %15, align 8
  %42 = sub i64 %41, 1
  %43 = load i64, i64* %16, align 8
  store i8* %40, i8** %4, align 8
  store i64 %42, i64* %5, align 8
  store i64 %43, i64* %6, align 8
  %44 = load i64, i64* %6, align 8
  %45 = load i8*, i8** %4, align 8
  %46 = ptrtoint i8* %45 to i64
  store i64 %46, i64* %7, align 8
  %47 = load i64, i64* %7, align 8
  %48 = lshr i64 %47, 3
  %49 = add i64 %48, 2147450880
  store i64 %49, i64* %8, align 8
  %50 = load i64, i64* %7, align 8
  %51 = load i64, i64* %5, align 8
  %52 = add i64 %50, %51
  %53 = sub i64 %52, 1
  %54 = lshr i64 %53, 3
  %55 = add i64 %54, 2147450880
  %56 = add i64 %55, 1
  store i64 %56, i64* %9, align 8
  %57 = load i64, i64* %8, align 8
  %58 = inttoptr i64 %57 to i8*
  %59 = load i8, i8* %58, align 1
  store i8 %59, i8* %10, align 1
  %60 = load i8, i8* %10, align 1
  %61 = zext i8 %60 to i32
  %62 = sub nsw i32 %61, 1
  %63 = trunc i32 %62 to i8
  store i8 %63, i8* %11, align 1
  %64 = load i8, i8* %10, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %72

67:                                               ; preds = %3
  %68 = load i8*, i8** %4, align 8
  %69 = ptrtoint i8* %68 to i64
  %70 = load i64, i64* %5, align 8
  %71 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %69, i64 %70, i64 %71) #4
  unreachable

72:                                               ; preds = %3
  %73 = load i64, i64* %5, align 8
  %74 = icmp ule i64 %73, 8
  br i1 %74, label %75, label %89

75:                                               ; preds = %72
  %76 = load i8, i8* %11, align 1
  %77 = zext i8 %76 to i32
  %78 = ashr i32 %77, 5
  %79 = sext i32 %78 to i64
  %80 = load i64, i64* %5, align 8
  %81 = add i64 %79, %80
  %82 = icmp uge i64 %81, 8
  br i1 %82, label %83, label %88

83:                                               ; preds = %75
  %84 = load i8*, i8** %4, align 8
  %85 = ptrtoint i8* %84 to i64
  %86 = load i64, i64* %5, align 8
  %87 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %85, i64 %86, i64 %87) #4
  unreachable

88:                                               ; preds = %75
  br label %150

89:                                               ; preds = %72
  %90 = load i64, i64* %8, align 8
  %91 = load i8, i8* %11, align 1
  %92 = zext i8 %91 to i32
  %93 = shl i32 1, %92
  %94 = mul nsw i32 %93, 2
  %95 = sext i32 %94 to i64
  %96 = add i64 %90, %95
  %97 = load i64, i64* %9, align 8
  %98 = icmp ule i64 %96, %97
  br i1 %98, label %113, label %99

99:                                               ; preds = %89
  %100 = load i64, i64* %9, align 8
  %101 = load i8, i8* %11, align 1
  %102 = zext i8 %101 to i32
  %103 = shl i32 1, %102
  %104 = sext i32 %103 to i64
  %105 = sub i64 %100, %104
  %106 = inttoptr i64 %105 to i8*
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = sub nsw i32 %108, 1
  %110 = load i8, i8* %11, align 1
  %111 = zext i8 %110 to i32
  %112 = icmp ne i32 %109, %111
  br label %113

113:                                              ; preds = %99, %89
  %114 = phi i1 [ true, %89 ], [ %112, %99 ]
  %115 = zext i1 %114 to i32
  store i32 %115, i32* %12, align 4
  %116 = load i32, i32* %12, align 4
  %117 = sext i32 %116 to i64
  %118 = icmp ne i64 %117, 0
  br i1 %118, label %119, label %124

119:                                              ; preds = %113
  %120 = load i8*, i8** %4, align 8
  %121 = ptrtoint i8* %120 to i64
  %122 = load i64, i64* %5, align 8
  %123 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %121, i64 %122, i64 %123) #4
  unreachable

124:                                              ; preds = %113
  %125 = load i64, i64* %9, align 8
  %126 = sub i64 %125, 1
  %127 = inttoptr i64 %126 to i8*
  %128 = load i8, i8* %127, align 1
  store i8 %128, i8* %13, align 1
  %129 = load i8, i8* %13, align 1
  %130 = zext i8 %129 to i32
  %131 = and i32 %130, 31
  %132 = icmp eq i32 %131, 1
  br i1 %132, label %133, label %150

133:                                              ; preds = %124
  %134 = load i64, i64* %5, align 8
  %135 = sub i64 %134, 1
  %136 = urem i64 %135, 8
  %137 = add i64 %136, 1
  %138 = load i8, i8* %13, align 1
  %139 = zext i8 %138 to i32
  %140 = ashr i32 %139, 5
  %141 = sext i32 %140 to i64
  %142 = add i64 %137, %141
  %143 = icmp uge i64 %142, 8
  br i1 %143, label %144, label %149

144:                                              ; preds = %133
  %145 = load i8*, i8** %4, align 8
  %146 = ptrtoint i8* %145 to i64
  %147 = load i64, i64* %5, align 8
  %148 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %146, i64 %147, i64 %148) #4
  unreachable

149:                                              ; preds = %133
  br label %150

150:                                              ; preds = %88, %124, %149
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @__cocheck__loadGuardian(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8, align 1
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  %12 = load i64, i64* %5, align 8
  %13 = load i64, i64* %4, align 8
  %14 = lshr i64 %13, 3
  %15 = add i64 %14, 2147450880
  store i64 %15, i64* %6, align 8
  %16 = load i64, i64* %6, align 8
  %17 = inttoptr i64 %16 to i8*
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = sub nsw i32 %19, 1
  %21 = trunc i32 %20 to i8
  store i8 %21, i8* %7, align 1
  %22 = load i8, i8* %7, align 1
  %23 = zext i8 %22 to i32
  %24 = icmp eq i32 %23, 255
  br i1 %24, label %25, label %39

25:                                               ; preds = %2
  %26 = load i64, i64* %4, align 8
  %27 = udiv i64 %26, 256
  store i64 %27, i64* %8, align 8
  %28 = load i32*, i32** @__cocheck__loadGuardian.cache, align 8
  %29 = load i64, i64* %8, align 8
  %30 = getelementptr inbounds i32, i32* %28, i64 %29
  %31 = load i32, i32* %30, align 4
  %32 = sext i32 %31 to i64
  %33 = load i64, i64* %8, align 8
  %34 = mul i64 %33, 256
  %35 = add i64 %32, %34
  %36 = load i64, i64* %4, align 8
  %37 = sub i64 %35, %36
  store i64 %37, i64* %9, align 8
  %38 = load i64, i64* %9, align 8
  store i64 %38, i64* %3, align 8
  br label %93

39:                                               ; preds = %2
  %40 = load i64, i64* %6, align 8
  %41 = load i8, i8* %7, align 1
  %42 = zext i8 %41 to i32
  %43 = and i32 %42, 31
  %44 = shl i32 1, %43
  %45 = sext i32 %44 to i64
  %46 = add i64 %40, %45
  %47 = sub i64 %46, 1
  store i64 %47, i64* %10, align 8
  %48 = load i64, i64* %10, align 8
  %49 = inttoptr i64 %48 to i8*
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = sub nsw i32 %51, 1
  %53 = trunc i32 %52 to i8
  store i8 %53, i8* %7, align 1
  %54 = load i8, i8* %7, align 1
  %55 = zext i8 %54 to i32
  %56 = and i32 %55, 31
  %57 = shl i32 1, %56
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = load i64, i64* %10, align 8
  %61 = add i64 %60, %59
  store i64 %61, i64* %10, align 8
  %62 = load i64, i64* %10, align 8
  %63 = inttoptr i64 %62 to i8*
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = sub nsw i32 %65, 1
  %67 = trunc i32 %66 to i8
  store i8 %67, i8* %7, align 1
  %68 = load i8, i8* %7, align 1
  %69 = zext i8 %68 to i32
  %70 = and i32 %69, 31
  %71 = shl i32 1, %70
  %72 = sub nsw i32 %71, 1
  %73 = sext i32 %72 to i64
  %74 = load i64, i64* %10, align 8
  %75 = add i64 %74, %73
  store i64 %75, i64* %10, align 8
  %76 = load i64, i64* %10, align 8
  %77 = inttoptr i64 %76 to i8*
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = sub nsw i32 %79, 1
  %81 = trunc i32 %80 to i8
  store i8 %81, i8* %7, align 1
  %82 = load i64, i64* %10, align 8
  %83 = load i64, i64* %6, align 8
  %84 = sub i64 %82, %83
  %85 = add i64 %84, 1
  %86 = mul i64 %85, 8
  %87 = load i8, i8* %7, align 1
  %88 = zext i8 %87 to i32
  %89 = ashr i32 %88, 5
  %90 = sext i32 %89 to i64
  %91 = sub i64 %86, %90
  store i64 %91, i64* %11, align 8
  %92 = load i64, i64* %11, align 8
  store i64 %92, i64* %3, align 8
  br label %93

93:                                               ; preds = %39, %25
  %94 = load i64, i64* %3, align 8
  ret i64 %94
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @__cocheck__SequentCheck(i64 %0, i64 %1, i64 %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i32, align 4
  %13 = alloca i8, align 1
  %14 = alloca i8*, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  store i64 %0, i64* %17, align 8
  store i64 %1, i64* %18, align 8
  store i64 %2, i64* %19, align 8
  %20 = load i64, i64* %18, align 8
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %3
  br label %145

23:                                               ; preds = %3
  %24 = load i64, i64* %17, align 8
  %25 = call i64 @__cocheck__loadGuardian(i64 %24, i64 0)
  %26 = load i64, i64* %18, align 8
  %27 = icmp uge i64 %25, %26
  br i1 %27, label %28, label %29

28:                                               ; preds = %23
  br label %145

29:                                               ; preds = %23
  %30 = load i64, i64* %17, align 8
  %31 = inttoptr i64 %30 to i8*
  %32 = load i64, i64* %18, align 8
  %33 = load i64, i64* %19, align 8
  store i8* %31, i8** %14, align 8
  store i64 %32, i64* %15, align 8
  store i64 %33, i64* %16, align 8
  %34 = load i8*, i8** %14, align 8
  %35 = load i64, i64* %15, align 8
  %36 = sub i64 %35, 1
  %37 = load i64, i64* %16, align 8
  store i8* %34, i8** %4, align 8
  store i64 %36, i64* %5, align 8
  store i64 %37, i64* %6, align 8
  %38 = load i64, i64* %6, align 8
  %39 = load i8*, i8** %4, align 8
  %40 = ptrtoint i8* %39 to i64
  store i64 %40, i64* %7, align 8
  %41 = load i64, i64* %7, align 8
  %42 = lshr i64 %41, 3
  %43 = add i64 %42, 2147450880
  store i64 %43, i64* %8, align 8
  %44 = load i64, i64* %7, align 8
  %45 = load i64, i64* %5, align 8
  %46 = add i64 %44, %45
  %47 = sub i64 %46, 1
  %48 = lshr i64 %47, 3
  %49 = add i64 %48, 2147450880
  %50 = add i64 %49, 1
  store i64 %50, i64* %9, align 8
  %51 = load i64, i64* %8, align 8
  %52 = inttoptr i64 %51 to i8*
  %53 = load i8, i8* %52, align 1
  store i8 %53, i8* %10, align 1
  %54 = load i8, i8* %10, align 1
  %55 = zext i8 %54 to i32
  %56 = sub nsw i32 %55, 1
  %57 = trunc i32 %56 to i8
  store i8 %57, i8* %11, align 1
  %58 = load i8, i8* %10, align 1
  %59 = zext i8 %58 to i32
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %66

61:                                               ; preds = %29
  %62 = load i8*, i8** %4, align 8
  %63 = ptrtoint i8* %62 to i64
  %64 = load i64, i64* %5, align 8
  %65 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %63, i64 %64, i64 %65) #4
  unreachable

66:                                               ; preds = %29
  %67 = load i64, i64* %5, align 8
  %68 = icmp ule i64 %67, 8
  br i1 %68, label %69, label %83

69:                                               ; preds = %66
  %70 = load i8, i8* %11, align 1
  %71 = zext i8 %70 to i32
  %72 = ashr i32 %71, 5
  %73 = sext i32 %72 to i64
  %74 = load i64, i64* %5, align 8
  %75 = add i64 %73, %74
  %76 = icmp uge i64 %75, 8
  br i1 %76, label %77, label %82

77:                                               ; preds = %69
  %78 = load i8*, i8** %4, align 8
  %79 = ptrtoint i8* %78 to i64
  %80 = load i64, i64* %5, align 8
  %81 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %79, i64 %80, i64 %81) #4
  unreachable

82:                                               ; preds = %69
  br label %144

83:                                               ; preds = %66
  %84 = load i64, i64* %8, align 8
  %85 = load i8, i8* %11, align 1
  %86 = zext i8 %85 to i32
  %87 = shl i32 1, %86
  %88 = mul nsw i32 %87, 2
  %89 = sext i32 %88 to i64
  %90 = add i64 %84, %89
  %91 = load i64, i64* %9, align 8
  %92 = icmp ule i64 %90, %91
  br i1 %92, label %107, label %93

93:                                               ; preds = %83
  %94 = load i64, i64* %9, align 8
  %95 = load i8, i8* %11, align 1
  %96 = zext i8 %95 to i32
  %97 = shl i32 1, %96
  %98 = sext i32 %97 to i64
  %99 = sub i64 %94, %98
  %100 = inttoptr i64 %99 to i8*
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = sub nsw i32 %102, 1
  %104 = load i8, i8* %11, align 1
  %105 = zext i8 %104 to i32
  %106 = icmp ne i32 %103, %105
  br label %107

107:                                              ; preds = %93, %83
  %108 = phi i1 [ true, %83 ], [ %106, %93 ]
  %109 = zext i1 %108 to i32
  store i32 %109, i32* %12, align 4
  %110 = load i32, i32* %12, align 4
  %111 = sext i32 %110 to i64
  %112 = icmp ne i64 %111, 0
  br i1 %112, label %113, label %118

113:                                              ; preds = %107
  %114 = load i8*, i8** %4, align 8
  %115 = ptrtoint i8* %114 to i64
  %116 = load i64, i64* %5, align 8
  %117 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %115, i64 %116, i64 %117) #4
  unreachable

118:                                              ; preds = %107
  %119 = load i64, i64* %9, align 8
  %120 = sub i64 %119, 1
  %121 = inttoptr i64 %120 to i8*
  %122 = load i8, i8* %121, align 1
  store i8 %122, i8* %13, align 1
  %123 = load i8, i8* %13, align 1
  %124 = zext i8 %123 to i32
  %125 = and i32 %124, 31
  %126 = icmp eq i32 %125, 1
  br i1 %126, label %127, label %144

127:                                              ; preds = %118
  %128 = load i64, i64* %5, align 8
  %129 = sub i64 %128, 1
  %130 = urem i64 %129, 8
  %131 = add i64 %130, 1
  %132 = load i8, i8* %13, align 1
  %133 = zext i8 %132 to i32
  %134 = ashr i32 %133, 5
  %135 = sext i32 %134 to i64
  %136 = add i64 %131, %135
  %137 = icmp uge i64 %136, 8
  br i1 %137, label %138, label %143

138:                                              ; preds = %127
  %139 = load i8*, i8** %4, align 8
  %140 = ptrtoint i8* %139 to i64
  %141 = load i64, i64* %5, align 8
  %142 = load i64, i64* %6, align 8
  call void @__cocheck__reportError(i64 %140, i64 %141, i64 %142) #4
  unreachable

143:                                              ; preds = %127
  br label %144

144:                                              ; preds = %82, %118, %143
  br label %145

145:                                              ; preds = %144, %28, %22
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @__cocheck__PoisonStack(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i8, align 1
  %14 = alloca i64, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i8*, align 8
  %26 = alloca i64, align 8
  %27 = alloca i8, align 1
  %28 = alloca i64, align 8
  %29 = alloca i8*, align 8
  %30 = alloca i8*, align 8
  %31 = alloca i64, align 8
  %32 = alloca i64, align 8
  %33 = alloca i64, align 8
  %34 = alloca i64, align 8
  %35 = alloca i64, align 8
  %36 = alloca i64, align 8
  %37 = alloca i64, align 8
  %38 = alloca i64, align 8
  %39 = alloca i8*, align 8
  %40 = alloca i64, align 8
  %41 = alloca i8, align 1
  %42 = alloca i64, align 8
  %43 = alloca i8*, align 8
  %44 = alloca i8*, align 8
  %45 = alloca i8*, align 8
  %46 = alloca i64, align 8
  %47 = alloca i64, align 8
  %48 = alloca i64, align 8
  %49 = alloca i64, align 8
  %50 = alloca i64, align 8
  %51 = alloca i64, align 8
  %52 = alloca i64, align 8
  %53 = alloca i64, align 8
  %54 = alloca i64, align 8
  %55 = alloca i64, align 8
  store i64 %0, i64* %54, align 8
  store i64 %1, i64* %55, align 8
  %56 = load i64, i64* %54, align 8
  %57 = inttoptr i64 %56 to i8*
  %58 = load i64, i64* %55, align 8
  store i8* %57, i8** %45, align 8
  store i64 %58, i64* %46, align 8
  %59 = load i8*, i8** %45, align 8
  %60 = ptrtoint i8* %59 to i64
  store i64 %60, i64* %47, align 8
  %61 = load i64, i64* %47, align 8
  %62 = load i64, i64* %46, align 8
  %63 = add i64 %61, %62
  store i64 %63, i64* %48, align 8
  %64 = load i64, i64* %47, align 8
  %65 = udiv i64 %64, 256
  store i64 %65, i64* %49, align 8
  %66 = load i64, i64* %49, align 8
  %67 = mul i64 %66, 256
  store i64 %67, i64* %50, align 8
  %68 = load i64, i64* %48, align 8
  %69 = udiv i64 %68, 256
  store i64 %69, i64* %51, align 8
  %70 = load i64, i64* %51, align 8
  %71 = mul i64 %70, 256
  store i64 %71, i64* %52, align 8
  %72 = load i64, i64* %49, align 8
  %73 = load i64, i64* %51, align 8
  %74 = icmp eq i64 %72, %73
  br i1 %74, label %75, label %317

75:                                               ; preds = %2
  %76 = load i8*, i8** %45, align 8
  %77 = load i64, i64* %46, align 8
  store i8* %76, i8** %39, align 8
  store i64 %77, i64* %40, align 8
  store i8 0, i8* %41, align 1
  %78 = load i8*, i8** %39, align 8
  %79 = ptrtoint i8* %78 to i64
  %80 = udiv i64 %79, 256
  store i64 %80, i64* %42, align 8
  %81 = load i8*, i8** @__cocheck___poisonArea.blockUsed, align 8
  %82 = load i64, i64* %42, align 8
  %83 = getelementptr inbounds i8, i8* %81, i64 %82
  %84 = load i8, i8* %83, align 1
  %85 = icmp ne i8 %84, 0
  br i1 %85, label %96, label %86

86:                                               ; preds = %75
  %87 = load i8*, i8** @__cocheck___poisonArea.blockUsed, align 8
  %88 = load i64, i64* %42, align 8
  %89 = getelementptr inbounds i8, i8* %87, i64 %88
  store i8 1, i8* %89, align 1
  %90 = load i64, i64* %42, align 8
  %91 = mul i64 %90, 256
  %92 = lshr i64 %91, 3
  %93 = add i64 %92, 2147450880
  %94 = inttoptr i64 %93 to i8*
  store i8* %94, i8** %43, align 8
  %95 = load i8*, i8** %43, align 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %95, i8 -1, i64 32, i1 false) #4
  br label %96

96:                                               ; preds = %86, %75
  %97 = load i8, i8* %41, align 1
  %98 = icmp ne i8 %97, 0
  br i1 %98, label %290, label %99

99:                                               ; preds = %96
  %100 = load i8*, i8** %39, align 8
  %101 = ptrtoint i8* %100 to i64
  %102 = load i64, i64* %40, align 8
  store i64 %101, i64* %31, align 8
  store i64 %102, i64* %32, align 8
  %103 = load i64, i64* %31, align 8
  %104 = lshr i64 %103, 3
  %105 = add i64 %104, 2147450880
  store i64 %105, i64* %33, align 8
  %106 = load i64, i64* %31, align 8
  %107 = load i64, i64* %32, align 8
  %108 = add i64 %106, %107
  %109 = sub i64 %108, 1
  %110 = lshr i64 %109, 3
  %111 = add i64 %110, 2147450880
  %112 = add i64 %111, 1
  store i64 %112, i64* %34, align 8
  %113 = load i64, i64* %32, align 8
  %114 = icmp ule i64 %113, 128
  br i1 %114, label %115, label %240

115:                                              ; preds = %99
  %116 = load i64, i64* %32, align 8
  %117 = add i64 %116, 7
  %118 = udiv i64 %117, 8
  store i64 %118, i64* %35, align 8
  %119 = load i64, i64* %35, align 8
  switch i64 %119, label %238 [
    i64 1, label %120
    i64 2, label %124
    i64 3, label %128
    i64 4, label %135
    i64 5, label %139
    i64 6, label %146
    i64 7, label %153
    i64 8, label %163
    i64 9, label %167
    i64 10, label %174
    i64 11, label %181
    i64 12, label %191
    i64 13, label %198
    i64 14, label %208
    i64 15, label %218
    i64 16, label %231
  ]

120:                                              ; preds = %115
  %121 = load i64, i64* %34, align 8
  %122 = sub i64 %121, 1
  %123 = inttoptr i64 %122 to i8*
  store i8 1, i8* %123, align 1
  br label %239

124:                                              ; preds = %115
  %125 = load i64, i64* %34, align 8
  %126 = sub i64 %125, 2
  %127 = inttoptr i64 %126 to i16*
  store i16 258, i16* %127, align 2
  br label %239

128:                                              ; preds = %115
  %129 = load i64, i64* %34, align 8
  %130 = sub i64 %129, 1
  %131 = inttoptr i64 %130 to i8*
  store i8 1, i8* %131, align 1
  %132 = load i64, i64* %34, align 8
  %133 = sub i64 %132, 3
  %134 = inttoptr i64 %133 to i16*
  store i16 514, i16* %134, align 2
  br label %239

135:                                              ; preds = %115
  %136 = load i64, i64* %34, align 8
  %137 = sub i64 %136, 4
  %138 = inttoptr i64 %137 to i32*
  store i32 16908803, i32* %138, align 4
  br label %239

139:                                              ; preds = %115
  %140 = load i64, i64* %34, align 8
  %141 = sub i64 %140, 1
  %142 = inttoptr i64 %141 to i8*
  store i8 1, i8* %142, align 1
  %143 = load i64, i64* %34, align 8
  %144 = sub i64 %143, 5
  %145 = inttoptr i64 %144 to i32*
  store i32 33686275, i32* %145, align 4
  br label %239

146:                                              ; preds = %115
  %147 = load i64, i64* %34, align 8
  %148 = sub i64 %147, 2
  %149 = inttoptr i64 %148 to i16*
  store i16 258, i16* %149, align 2
  %150 = load i64, i64* %34, align 8
  %151 = sub i64 %150, 6
  %152 = inttoptr i64 %151 to i32*
  store i32 33751811, i32* %152, align 4
  br label %239

153:                                              ; preds = %115
  %154 = load i64, i64* %34, align 8
  %155 = sub i64 %154, 1
  %156 = inttoptr i64 %155 to i8*
  store i8 1, i8* %156, align 1
  %157 = load i64, i64* %34, align 8
  %158 = sub i64 %157, 3
  %159 = inttoptr i64 %158 to i16*
  store i16 514, i16* %159, align 2
  %160 = load i64, i64* %34, align 8
  %161 = sub i64 %160, 7
  %162 = inttoptr i64 %161 to i32*
  store i32 50529027, i32* %162, align 4
  br label %239

163:                                              ; preds = %115
  %164 = load i64, i64* %34, align 8
  %165 = sub i64 %164, 8
  %166 = inttoptr i64 %165 to i64*
  store i64 72622755950035716, i64* %166, align 8
  br label %239

167:                                              ; preds = %115
  %168 = load i64, i64* %34, align 8
  %169 = sub i64 %168, 1
  %170 = inttoptr i64 %169 to i8*
  store i8 1, i8* %170, align 1
  %171 = load i64, i64* %34, align 8
  %172 = sub i64 %171, 9
  %173 = inttoptr i64 %172 to i64*
  store i64 144681449499591684, i64* %173, align 8
  br label %239

174:                                              ; preds = %115
  %175 = load i64, i64* %34, align 8
  %176 = sub i64 %175, 2
  %177 = inttoptr i64 %176 to i16*
  store i16 258, i16* %177, align 2
  %178 = load i64, i64* %34, align 8
  %179 = sub i64 %178, 10
  %180 = inttoptr i64 %179 to i64*
  store i64 144962924476367876, i64* %180, align 8
  br label %239

181:                                              ; preds = %115
  %182 = load i64, i64* %34, align 8
  %183 = sub i64 %182, 1
  %184 = inttoptr i64 %183 to i8*
  store i8 1, i8* %184, align 1
  %185 = load i64, i64* %34, align 8
  %186 = sub i64 %185, 3
  %187 = inttoptr i64 %186 to i16*
  store i16 514, i16* %187, align 2
  %188 = load i64, i64* %34, align 8
  %189 = sub i64 %188, 11
  %190 = inttoptr i64 %189 to i64*
  store i64 217020518531073028, i64* %190, align 8
  br label %239

191:                                              ; preds = %115
  %192 = load i64, i64* %34, align 8
  %193 = sub i64 %192, 4
  %194 = inttoptr i64 %193 to i32*
  store i32 16908803, i32* %194, align 4
  %195 = load i64, i64* %34, align 8
  %196 = sub i64 %195, 12
  %197 = inttoptr i64 %196 to i64*
  store i64 217020522826040324, i64* %197, align 8
  br label %239

198:                                              ; preds = %115
  %199 = load i64, i64* %34, align 8
  %200 = sub i64 %199, 1
  %201 = inttoptr i64 %200 to i8*
  store i8 1, i8* %201, align 1
  %202 = load i64, i64* %34, align 8
  %203 = sub i64 %202, 5
  %204 = inttoptr i64 %203 to i32*
  store i32 33686275, i32* %204, align 4
  %205 = load i64, i64* %34, align 8
  %206 = sub i64 %205, 13
  %207 = inttoptr i64 %206 to i64*
  store i64 217021622337668100, i64* %207, align 8
  br label %239

208:                                              ; preds = %115
  %209 = load i64, i64* %34, align 8
  %210 = sub i64 %209, 2
  %211 = inttoptr i64 %210 to i16*
  store i16 258, i16* %211, align 2
  %212 = load i64, i64* %34, align 8
  %213 = sub i64 %212, 6
  %214 = inttoptr i64 %213 to i32*
  store i32 33751811, i32* %214, align 4
  %215 = load i64, i64* %34, align 8
  %216 = sub i64 %215, 14
  %217 = inttoptr i64 %216 to i64*
  store i64 217303097314378756, i64* %217, align 8
  br label %239

218:                                              ; preds = %115
  %219 = load i64, i64* %34, align 8
  %220 = sub i64 %219, 1
  %221 = inttoptr i64 %220 to i8*
  store i8 1, i8* %221, align 1
  %222 = load i64, i64* %34, align 8
  %223 = sub i64 %222, 3
  %224 = inttoptr i64 %223 to i16*
  store i16 514, i16* %224, align 2
  %225 = load i64, i64* %34, align 8
  %226 = sub i64 %225, 7
  %227 = inttoptr i64 %226 to i32*
  store i32 50529027, i32* %227, align 4
  %228 = load i64, i64* %34, align 8
  %229 = sub i64 %228, 15
  %230 = inttoptr i64 %229 to i64*
  store i64 289360691352306692, i64* %230, align 8
  br label %239

231:                                              ; preds = %115
  %232 = load i64, i64* %34, align 8
  %233 = sub i64 %232, 8
  %234 = inttoptr i64 %233 to i64*
  store i64 72622755950035716, i64* %234, align 8
  %235 = load i64, i64* %34, align 8
  %236 = sub i64 %235, 16
  %237 = inttoptr i64 %236 to i64*
  store i64 289360691352306693, i64* %237, align 8
  br label %239

238:                                              ; preds = %115
  br label %239

239:                                              ; preds = %238, %231, %218, %208, %198, %191, %181, %174, %167, %163, %153, %146, %139, %135, %128, %124, %120
  br label %289

240:                                              ; preds = %99
  %241 = load i64, i64* %34, align 8
  %242 = sub i64 %241, 8
  %243 = inttoptr i64 %242 to i64*
  store i64 72622755950035716, i64* %243, align 8
  %244 = load i64, i64* %34, align 8
  %245 = sub i64 %244, 16
  %246 = inttoptr i64 %245 to i64*
  store i64 289360691352306693, i64* %246, align 8
  store i64 4, i64* %36, align 8
  br label %247

247:                                              ; preds = %276, %240
  %248 = load i64, i64* %34, align 8
  %249 = load i64, i64* %36, align 8
  %250 = trunc i64 %249 to i32
  %251 = shl i32 1, %250
  %252 = sext i32 %251 to i64
  %253 = sub i64 %248, %252
  %254 = load i64, i64* %33, align 8
  %255 = icmp uge i64 %253, %254
  br i1 %255, label %256, label %289

256:                                              ; preds = %247
  %257 = load i64, i64* %34, align 8
  %258 = load i64, i64* %36, align 8
  %259 = add i64 %258, 1
  %260 = trunc i64 %259 to i32
  %261 = shl i32 1, %260
  %262 = sext i32 %261 to i64
  %263 = sub i64 %257, %262
  %264 = add i64 %263, 1
  store i64 %264, i64* %37, align 8
  %265 = load i64, i64* %34, align 8
  %266 = load i64, i64* %36, align 8
  %267 = trunc i64 %266 to i32
  %268 = shl i32 1, %267
  %269 = sext i32 %268 to i64
  %270 = sub i64 %265, %269
  store i64 %270, i64* %38, align 8
  %271 = load i64, i64* %37, align 8
  %272 = load i64, i64* %33, align 8
  %273 = icmp ult i64 %271, %272
  br i1 %273, label %274, label %276

274:                                              ; preds = %256
  %275 = load i64, i64* %33, align 8
  store i64 %275, i64* %37, align 8
  br label %276

276:                                              ; preds = %274, %256
  %277 = load i64, i64* %37, align 8
  %278 = inttoptr i64 %277 to i8*
  %279 = load i64, i64* %36, align 8
  %280 = add i64 %279, 1
  %281 = trunc i64 %280 to i32
  %282 = trunc i32 %281 to i8
  %283 = load i64, i64* %38, align 8
  %284 = load i64, i64* %37, align 8
  %285 = sub i64 %283, %284
  %286 = add i64 %285, 1
  call void @llvm.memset.p0i8.i64(i8* align 1 %278, i8 %282, i64 %286, i1 false) #4
  %287 = load i64, i64* %36, align 8
  %288 = add i64 %287, 1
  store i64 %288, i64* %36, align 8
  br label %247, !llvm.loop !2

289:                                              ; preds = %247, %239
  br label %299

290:                                              ; preds = %96
  %291 = load i8*, i8** %39, align 8
  %292 = ptrtoint i8* %291 to i64
  %293 = lshr i64 %292, 3
  %294 = add i64 %293, 2147450880
  %295 = inttoptr i64 %294 to i8*
  store i8* %295, i8** %44, align 8
  %296 = load i8*, i8** %44, align 8
  %297 = load i64, i64* %40, align 8
  %298 = udiv i64 %297, 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %296, i8 0, i64 %298, i1 false) #4
  br label %299

299:                                              ; preds = %290, %289
  %300 = load i64, i64* %46, align 8
  %301 = urem i64 %300, 8
  %302 = icmp ne i64 %301, 0
  br i1 %302, label %303, label %316

303:                                              ; preds = %299
  %304 = load i64, i64* %46, align 8
  %305 = urem i64 %304, 8
  %306 = sub i64 8, %305
  %307 = shl i64 %306, 5
  %308 = load i64, i64* %48, align 8
  %309 = lshr i64 %308, 3
  %310 = add i64 %309, 2147450880
  %311 = inttoptr i64 %310 to i8*
  %312 = load i8, i8* %311, align 1
  %313 = zext i8 %312 to i64
  %314 = add i64 %313, %307
  %315 = trunc i64 %314 to i8
  store i8 %315, i8* %311, align 1
  br label %316

316:                                              ; preds = %303, %299
  br label %845

317:                                              ; preds = %2
  %318 = load i64, i64* %49, align 8
  store i64 %318, i64* %53, align 8
  br label %319

319:                                              ; preds = %344, %317
  %320 = load i64, i64* %53, align 8
  %321 = load i64, i64* %51, align 8
  %322 = icmp ne i64 %320, %321
  br i1 %322, label %323, label %355

323:                                              ; preds = %319
  %324 = load i8*, i8** @__cocheck__poisonArea.blockUsed, align 8
  %325 = load i64, i64* %53, align 8
  %326 = getelementptr inbounds i8, i8* %324, i64 %325
  %327 = load i8, i8* %326, align 1
  %328 = zext i8 %327 to i32
  %329 = icmp ne i32 %328, 0
  br i1 %329, label %330, label %344

330:                                              ; preds = %323
  %331 = load i64, i64* %53, align 8
  %332 = load i64, i64* %49, align 8
  %333 = icmp ne i64 %331, %332
  br i1 %333, label %338, label %334

334:                                              ; preds = %330
  %335 = load i64, i64* %47, align 8
  %336 = load i64, i64* %50, align 8
  %337 = icmp eq i64 %335, %336
  br i1 %337, label %338, label %344

338:                                              ; preds = %334, %330
  %339 = load i64, i64* %53, align 8
  %340 = mul i64 %339, 256
  %341 = lshr i64 %340, 3
  %342 = add i64 %341, 2147450880
  %343 = inttoptr i64 %342 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %343, i8 0, i64 32, i1 false) #4
  br label %344

344:                                              ; preds = %338, %334, %323
  %345 = load i64, i64* %48, align 8
  %346 = load i64, i64* %53, align 8
  %347 = mul i64 %346, 256
  %348 = sub i64 %345, %347
  %349 = trunc i64 %348 to i32
  %350 = load i32*, i32** @__cocheck__poisonArea.cache, align 8
  %351 = load i64, i64* %53, align 8
  %352 = getelementptr inbounds i32, i32* %350, i64 %351
  store i32 %349, i32* %352, align 4
  %353 = load i64, i64* %53, align 8
  %354 = add i64 %353, 1
  store i64 %354, i64* %53, align 8
  br label %319, !llvm.loop !4

355:                                              ; preds = %319
  %356 = load i64, i64* %47, align 8
  %357 = load i64, i64* %50, align 8
  %358 = icmp ne i64 %356, %357
  br i1 %358, label %366, label %359

359:                                              ; preds = %355
  %360 = load i8*, i8** @__cocheck__poisonArea.blockUsed, align 8
  %361 = load i64, i64* %49, align 8
  %362 = getelementptr inbounds i8, i8* %360, i64 %361
  %363 = load i8, i8* %362, align 1
  %364 = zext i8 %363 to i32
  %365 = icmp ne i32 %364, 0
  br i1 %365, label %366, label %595

366:                                              ; preds = %359, %355
  %367 = load i64, i64* %47, align 8
  %368 = inttoptr i64 %367 to i8*
  %369 = load i64, i64* %50, align 8
  %370 = load i64, i64* %47, align 8
  %371 = sub i64 %369, %370
  %372 = add i64 %371, 256
  store i8* %368, i8** %11, align 8
  store i64 %372, i64* %12, align 8
  store i8 1, i8* %13, align 1
  %373 = load i8*, i8** %11, align 8
  %374 = ptrtoint i8* %373 to i64
  %375 = udiv i64 %374, 256
  store i64 %375, i64* %14, align 8
  %376 = load i8*, i8** @__cocheck___poisonArea.blockUsed, align 8
  %377 = load i64, i64* %14, align 8
  %378 = getelementptr inbounds i8, i8* %376, i64 %377
  %379 = load i8, i8* %378, align 1
  %380 = icmp ne i8 %379, 0
  br i1 %380, label %391, label %381

381:                                              ; preds = %366
  %382 = load i8*, i8** @__cocheck___poisonArea.blockUsed, align 8
  %383 = load i64, i64* %14, align 8
  %384 = getelementptr inbounds i8, i8* %382, i64 %383
  store i8 1, i8* %384, align 1
  %385 = load i64, i64* %14, align 8
  %386 = mul i64 %385, 256
  %387 = lshr i64 %386, 3
  %388 = add i64 %387, 2147450880
  %389 = inttoptr i64 %388 to i8*
  store i8* %389, i8** %15, align 8
  %390 = load i8*, i8** %15, align 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %390, i8 -1, i64 32, i1 false) #4
  br label %391

391:                                              ; preds = %381, %366
  %392 = load i8, i8* %13, align 1
  %393 = icmp ne i8 %392, 0
  br i1 %393, label %585, label %394

394:                                              ; preds = %391
  %395 = load i8*, i8** %11, align 8
  %396 = ptrtoint i8* %395 to i64
  %397 = load i64, i64* %12, align 8
  store i64 %396, i64* %3, align 8
  store i64 %397, i64* %4, align 8
  %398 = load i64, i64* %3, align 8
  %399 = lshr i64 %398, 3
  %400 = add i64 %399, 2147450880
  store i64 %400, i64* %5, align 8
  %401 = load i64, i64* %3, align 8
  %402 = load i64, i64* %4, align 8
  %403 = add i64 %401, %402
  %404 = sub i64 %403, 1
  %405 = lshr i64 %404, 3
  %406 = add i64 %405, 2147450880
  %407 = add i64 %406, 1
  store i64 %407, i64* %6, align 8
  %408 = load i64, i64* %4, align 8
  %409 = icmp ule i64 %408, 128
  br i1 %409, label %410, label %535

410:                                              ; preds = %394
  %411 = load i64, i64* %4, align 8
  %412 = add i64 %411, 7
  %413 = udiv i64 %412, 8
  store i64 %413, i64* %7, align 8
  %414 = load i64, i64* %7, align 8
  switch i64 %414, label %533 [
    i64 1, label %415
    i64 2, label %419
    i64 3, label %423
    i64 4, label %430
    i64 5, label %434
    i64 6, label %441
    i64 7, label %448
    i64 8, label %458
    i64 9, label %462
    i64 10, label %469
    i64 11, label %476
    i64 12, label %486
    i64 13, label %493
    i64 14, label %503
    i64 15, label %513
    i64 16, label %526
  ]

415:                                              ; preds = %410
  %416 = load i64, i64* %6, align 8
  %417 = sub i64 %416, 1
  %418 = inttoptr i64 %417 to i8*
  store i8 1, i8* %418, align 1
  br label %534

419:                                              ; preds = %410
  %420 = load i64, i64* %6, align 8
  %421 = sub i64 %420, 2
  %422 = inttoptr i64 %421 to i16*
  store i16 258, i16* %422, align 2
  br label %534

423:                                              ; preds = %410
  %424 = load i64, i64* %6, align 8
  %425 = sub i64 %424, 1
  %426 = inttoptr i64 %425 to i8*
  store i8 1, i8* %426, align 1
  %427 = load i64, i64* %6, align 8
  %428 = sub i64 %427, 3
  %429 = inttoptr i64 %428 to i16*
  store i16 514, i16* %429, align 2
  br label %534

430:                                              ; preds = %410
  %431 = load i64, i64* %6, align 8
  %432 = sub i64 %431, 4
  %433 = inttoptr i64 %432 to i32*
  store i32 16908803, i32* %433, align 4
  br label %534

434:                                              ; preds = %410
  %435 = load i64, i64* %6, align 8
  %436 = sub i64 %435, 1
  %437 = inttoptr i64 %436 to i8*
  store i8 1, i8* %437, align 1
  %438 = load i64, i64* %6, align 8
  %439 = sub i64 %438, 5
  %440 = inttoptr i64 %439 to i32*
  store i32 33686275, i32* %440, align 4
  br label %534

441:                                              ; preds = %410
  %442 = load i64, i64* %6, align 8
  %443 = sub i64 %442, 2
  %444 = inttoptr i64 %443 to i16*
  store i16 258, i16* %444, align 2
  %445 = load i64, i64* %6, align 8
  %446 = sub i64 %445, 6
  %447 = inttoptr i64 %446 to i32*
  store i32 33751811, i32* %447, align 4
  br label %534

448:                                              ; preds = %410
  %449 = load i64, i64* %6, align 8
  %450 = sub i64 %449, 1
  %451 = inttoptr i64 %450 to i8*
  store i8 1, i8* %451, align 1
  %452 = load i64, i64* %6, align 8
  %453 = sub i64 %452, 3
  %454 = inttoptr i64 %453 to i16*
  store i16 514, i16* %454, align 2
  %455 = load i64, i64* %6, align 8
  %456 = sub i64 %455, 7
  %457 = inttoptr i64 %456 to i32*
  store i32 50529027, i32* %457, align 4
  br label %534

458:                                              ; preds = %410
  %459 = load i64, i64* %6, align 8
  %460 = sub i64 %459, 8
  %461 = inttoptr i64 %460 to i64*
  store i64 72622755950035716, i64* %461, align 8
  br label %534

462:                                              ; preds = %410
  %463 = load i64, i64* %6, align 8
  %464 = sub i64 %463, 1
  %465 = inttoptr i64 %464 to i8*
  store i8 1, i8* %465, align 1
  %466 = load i64, i64* %6, align 8
  %467 = sub i64 %466, 9
  %468 = inttoptr i64 %467 to i64*
  store i64 144681449499591684, i64* %468, align 8
  br label %534

469:                                              ; preds = %410
  %470 = load i64, i64* %6, align 8
  %471 = sub i64 %470, 2
  %472 = inttoptr i64 %471 to i16*
  store i16 258, i16* %472, align 2
  %473 = load i64, i64* %6, align 8
  %474 = sub i64 %473, 10
  %475 = inttoptr i64 %474 to i64*
  store i64 144962924476367876, i64* %475, align 8
  br label %534

476:                                              ; preds = %410
  %477 = load i64, i64* %6, align 8
  %478 = sub i64 %477, 1
  %479 = inttoptr i64 %478 to i8*
  store i8 1, i8* %479, align 1
  %480 = load i64, i64* %6, align 8
  %481 = sub i64 %480, 3
  %482 = inttoptr i64 %481 to i16*
  store i16 514, i16* %482, align 2
  %483 = load i64, i64* %6, align 8
  %484 = sub i64 %483, 11
  %485 = inttoptr i64 %484 to i64*
  store i64 217020518531073028, i64* %485, align 8
  br label %534

486:                                              ; preds = %410
  %487 = load i64, i64* %6, align 8
  %488 = sub i64 %487, 4
  %489 = inttoptr i64 %488 to i32*
  store i32 16908803, i32* %489, align 4
  %490 = load i64, i64* %6, align 8
  %491 = sub i64 %490, 12
  %492 = inttoptr i64 %491 to i64*
  store i64 217020522826040324, i64* %492, align 8
  br label %534

493:                                              ; preds = %410
  %494 = load i64, i64* %6, align 8
  %495 = sub i64 %494, 1
  %496 = inttoptr i64 %495 to i8*
  store i8 1, i8* %496, align 1
  %497 = load i64, i64* %6, align 8
  %498 = sub i64 %497, 5
  %499 = inttoptr i64 %498 to i32*
  store i32 33686275, i32* %499, align 4
  %500 = load i64, i64* %6, align 8
  %501 = sub i64 %500, 13
  %502 = inttoptr i64 %501 to i64*
  store i64 217021622337668100, i64* %502, align 8
  br label %534

503:                                              ; preds = %410
  %504 = load i64, i64* %6, align 8
  %505 = sub i64 %504, 2
  %506 = inttoptr i64 %505 to i16*
  store i16 258, i16* %506, align 2
  %507 = load i64, i64* %6, align 8
  %508 = sub i64 %507, 6
  %509 = inttoptr i64 %508 to i32*
  store i32 33751811, i32* %509, align 4
  %510 = load i64, i64* %6, align 8
  %511 = sub i64 %510, 14
  %512 = inttoptr i64 %511 to i64*
  store i64 217303097314378756, i64* %512, align 8
  br label %534

513:                                              ; preds = %410
  %514 = load i64, i64* %6, align 8
  %515 = sub i64 %514, 1
  %516 = inttoptr i64 %515 to i8*
  store i8 1, i8* %516, align 1
  %517 = load i64, i64* %6, align 8
  %518 = sub i64 %517, 3
  %519 = inttoptr i64 %518 to i16*
  store i16 514, i16* %519, align 2
  %520 = load i64, i64* %6, align 8
  %521 = sub i64 %520, 7
  %522 = inttoptr i64 %521 to i32*
  store i32 50529027, i32* %522, align 4
  %523 = load i64, i64* %6, align 8
  %524 = sub i64 %523, 15
  %525 = inttoptr i64 %524 to i64*
  store i64 289360691352306692, i64* %525, align 8
  br label %534

526:                                              ; preds = %410
  %527 = load i64, i64* %6, align 8
  %528 = sub i64 %527, 8
  %529 = inttoptr i64 %528 to i64*
  store i64 72622755950035716, i64* %529, align 8
  %530 = load i64, i64* %6, align 8
  %531 = sub i64 %530, 16
  %532 = inttoptr i64 %531 to i64*
  store i64 289360691352306693, i64* %532, align 8
  br label %534

533:                                              ; preds = %410
  br label %534

534:                                              ; preds = %533, %526, %513, %503, %493, %486, %476, %469, %462, %458, %448, %441, %434, %430, %423, %419, %415
  br label %584

535:                                              ; preds = %394
  %536 = load i64, i64* %6, align 8
  %537 = sub i64 %536, 8
  %538 = inttoptr i64 %537 to i64*
  store i64 72622755950035716, i64* %538, align 8
  %539 = load i64, i64* %6, align 8
  %540 = sub i64 %539, 16
  %541 = inttoptr i64 %540 to i64*
  store i64 289360691352306693, i64* %541, align 8
  store i64 4, i64* %8, align 8
  br label %542

542:                                              ; preds = %571, %535
  %543 = load i64, i64* %6, align 8
  %544 = load i64, i64* %8, align 8
  %545 = trunc i64 %544 to i32
  %546 = shl i32 1, %545
  %547 = sext i32 %546 to i64
  %548 = sub i64 %543, %547
  %549 = load i64, i64* %5, align 8
  %550 = icmp uge i64 %548, %549
  br i1 %550, label %551, label %584

551:                                              ; preds = %542
  %552 = load i64, i64* %6, align 8
  %553 = load i64, i64* %8, align 8
  %554 = add i64 %553, 1
  %555 = trunc i64 %554 to i32
  %556 = shl i32 1, %555
  %557 = sext i32 %556 to i64
  %558 = sub i64 %552, %557
  %559 = add i64 %558, 1
  store i64 %559, i64* %9, align 8
  %560 = load i64, i64* %6, align 8
  %561 = load i64, i64* %8, align 8
  %562 = trunc i64 %561 to i32
  %563 = shl i32 1, %562
  %564 = sext i32 %563 to i64
  %565 = sub i64 %560, %564
  store i64 %565, i64* %10, align 8
  %566 = load i64, i64* %9, align 8
  %567 = load i64, i64* %5, align 8
  %568 = icmp ult i64 %566, %567
  br i1 %568, label %569, label %571

569:                                              ; preds = %551
  %570 = load i64, i64* %5, align 8
  store i64 %570, i64* %9, align 8
  br label %571

571:                                              ; preds = %569, %551
  %572 = load i64, i64* %9, align 8
  %573 = inttoptr i64 %572 to i8*
  %574 = load i64, i64* %8, align 8
  %575 = add i64 %574, 1
  %576 = trunc i64 %575 to i32
  %577 = trunc i32 %576 to i8
  %578 = load i64, i64* %10, align 8
  %579 = load i64, i64* %9, align 8
  %580 = sub i64 %578, %579
  %581 = add i64 %580, 1
  call void @llvm.memset.p0i8.i64(i8* align 1 %573, i8 %577, i64 %581, i1 false) #4
  %582 = load i64, i64* %8, align 8
  %583 = add i64 %582, 1
  store i64 %583, i64* %8, align 8
  br label %542, !llvm.loop !2

584:                                              ; preds = %542, %534
  br label %594

585:                                              ; preds = %391
  %586 = load i8*, i8** %11, align 8
  %587 = ptrtoint i8* %586 to i64
  %588 = lshr i64 %587, 3
  %589 = add i64 %588, 2147450880
  %590 = inttoptr i64 %589 to i8*
  store i8* %590, i8** %16, align 8
  %591 = load i8*, i8** %16, align 8
  %592 = load i64, i64* %12, align 8
  %593 = udiv i64 %592, 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %591, i8 0, i64 %593, i1 false) #4
  br label %594

594:                                              ; preds = %585, %584
  br label %595

595:                                              ; preds = %594, %359
  %596 = load i64, i64* %48, align 8
  %597 = load i64, i64* %52, align 8
  %598 = icmp ne i64 %596, %597
  br i1 %598, label %599, label %844

599:                                              ; preds = %595
  %600 = load i64, i64* %52, align 8
  %601 = inttoptr i64 %600 to i8*
  %602 = load i64, i64* %48, align 8
  %603 = load i64, i64* %52, align 8
  %604 = sub i64 %602, %603
  store i8* %601, i8** %25, align 8
  store i64 %604, i64* %26, align 8
  store i8 0, i8* %27, align 1
  %605 = load i8*, i8** %25, align 8
  %606 = ptrtoint i8* %605 to i64
  %607 = udiv i64 %606, 256
  store i64 %607, i64* %28, align 8
  %608 = load i8*, i8** @__cocheck___poisonArea.blockUsed, align 8
  %609 = load i64, i64* %28, align 8
  %610 = getelementptr inbounds i8, i8* %608, i64 %609
  %611 = load i8, i8* %610, align 1
  %612 = icmp ne i8 %611, 0
  br i1 %612, label %623, label %613

613:                                              ; preds = %599
  %614 = load i8*, i8** @__cocheck___poisonArea.blockUsed, align 8
  %615 = load i64, i64* %28, align 8
  %616 = getelementptr inbounds i8, i8* %614, i64 %615
  store i8 1, i8* %616, align 1
  %617 = load i64, i64* %28, align 8
  %618 = mul i64 %617, 256
  %619 = lshr i64 %618, 3
  %620 = add i64 %619, 2147450880
  %621 = inttoptr i64 %620 to i8*
  store i8* %621, i8** %29, align 8
  %622 = load i8*, i8** %29, align 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %622, i8 -1, i64 32, i1 false) #4
  br label %623

623:                                              ; preds = %613, %599
  %624 = load i8, i8* %27, align 1
  %625 = icmp ne i8 %624, 0
  br i1 %625, label %817, label %626

626:                                              ; preds = %623
  %627 = load i8*, i8** %25, align 8
  %628 = ptrtoint i8* %627 to i64
  %629 = load i64, i64* %26, align 8
  store i64 %628, i64* %17, align 8
  store i64 %629, i64* %18, align 8
  %630 = load i64, i64* %17, align 8
  %631 = lshr i64 %630, 3
  %632 = add i64 %631, 2147450880
  store i64 %632, i64* %19, align 8
  %633 = load i64, i64* %17, align 8
  %634 = load i64, i64* %18, align 8
  %635 = add i64 %633, %634
  %636 = sub i64 %635, 1
  %637 = lshr i64 %636, 3
  %638 = add i64 %637, 2147450880
  %639 = add i64 %638, 1
  store i64 %639, i64* %20, align 8
  %640 = load i64, i64* %18, align 8
  %641 = icmp ule i64 %640, 128
  br i1 %641, label %642, label %767

642:                                              ; preds = %626
  %643 = load i64, i64* %18, align 8
  %644 = add i64 %643, 7
  %645 = udiv i64 %644, 8
  store i64 %645, i64* %21, align 8
  %646 = load i64, i64* %21, align 8
  switch i64 %646, label %765 [
    i64 1, label %647
    i64 2, label %651
    i64 3, label %655
    i64 4, label %662
    i64 5, label %666
    i64 6, label %673
    i64 7, label %680
    i64 8, label %690
    i64 9, label %694
    i64 10, label %701
    i64 11, label %708
    i64 12, label %718
    i64 13, label %725
    i64 14, label %735
    i64 15, label %745
    i64 16, label %758
  ]

647:                                              ; preds = %642
  %648 = load i64, i64* %20, align 8
  %649 = sub i64 %648, 1
  %650 = inttoptr i64 %649 to i8*
  store i8 1, i8* %650, align 1
  br label %766

651:                                              ; preds = %642
  %652 = load i64, i64* %20, align 8
  %653 = sub i64 %652, 2
  %654 = inttoptr i64 %653 to i16*
  store i16 258, i16* %654, align 2
  br label %766

655:                                              ; preds = %642
  %656 = load i64, i64* %20, align 8
  %657 = sub i64 %656, 1
  %658 = inttoptr i64 %657 to i8*
  store i8 1, i8* %658, align 1
  %659 = load i64, i64* %20, align 8
  %660 = sub i64 %659, 3
  %661 = inttoptr i64 %660 to i16*
  store i16 514, i16* %661, align 2
  br label %766

662:                                              ; preds = %642
  %663 = load i64, i64* %20, align 8
  %664 = sub i64 %663, 4
  %665 = inttoptr i64 %664 to i32*
  store i32 16908803, i32* %665, align 4
  br label %766

666:                                              ; preds = %642
  %667 = load i64, i64* %20, align 8
  %668 = sub i64 %667, 1
  %669 = inttoptr i64 %668 to i8*
  store i8 1, i8* %669, align 1
  %670 = load i64, i64* %20, align 8
  %671 = sub i64 %670, 5
  %672 = inttoptr i64 %671 to i32*
  store i32 33686275, i32* %672, align 4
  br label %766

673:                                              ; preds = %642
  %674 = load i64, i64* %20, align 8
  %675 = sub i64 %674, 2
  %676 = inttoptr i64 %675 to i16*
  store i16 258, i16* %676, align 2
  %677 = load i64, i64* %20, align 8
  %678 = sub i64 %677, 6
  %679 = inttoptr i64 %678 to i32*
  store i32 33751811, i32* %679, align 4
  br label %766

680:                                              ; preds = %642
  %681 = load i64, i64* %20, align 8
  %682 = sub i64 %681, 1
  %683 = inttoptr i64 %682 to i8*
  store i8 1, i8* %683, align 1
  %684 = load i64, i64* %20, align 8
  %685 = sub i64 %684, 3
  %686 = inttoptr i64 %685 to i16*
  store i16 514, i16* %686, align 2
  %687 = load i64, i64* %20, align 8
  %688 = sub i64 %687, 7
  %689 = inttoptr i64 %688 to i32*
  store i32 50529027, i32* %689, align 4
  br label %766

690:                                              ; preds = %642
  %691 = load i64, i64* %20, align 8
  %692 = sub i64 %691, 8
  %693 = inttoptr i64 %692 to i64*
  store i64 72622755950035716, i64* %693, align 8
  br label %766

694:                                              ; preds = %642
  %695 = load i64, i64* %20, align 8
  %696 = sub i64 %695, 1
  %697 = inttoptr i64 %696 to i8*
  store i8 1, i8* %697, align 1
  %698 = load i64, i64* %20, align 8
  %699 = sub i64 %698, 9
  %700 = inttoptr i64 %699 to i64*
  store i64 144681449499591684, i64* %700, align 8
  br label %766

701:                                              ; preds = %642
  %702 = load i64, i64* %20, align 8
  %703 = sub i64 %702, 2
  %704 = inttoptr i64 %703 to i16*
  store i16 258, i16* %704, align 2
  %705 = load i64, i64* %20, align 8
  %706 = sub i64 %705, 10
  %707 = inttoptr i64 %706 to i64*
  store i64 144962924476367876, i64* %707, align 8
  br label %766

708:                                              ; preds = %642
  %709 = load i64, i64* %20, align 8
  %710 = sub i64 %709, 1
  %711 = inttoptr i64 %710 to i8*
  store i8 1, i8* %711, align 1
  %712 = load i64, i64* %20, align 8
  %713 = sub i64 %712, 3
  %714 = inttoptr i64 %713 to i16*
  store i16 514, i16* %714, align 2
  %715 = load i64, i64* %20, align 8
  %716 = sub i64 %715, 11
  %717 = inttoptr i64 %716 to i64*
  store i64 217020518531073028, i64* %717, align 8
  br label %766

718:                                              ; preds = %642
  %719 = load i64, i64* %20, align 8
  %720 = sub i64 %719, 4
  %721 = inttoptr i64 %720 to i32*
  store i32 16908803, i32* %721, align 4
  %722 = load i64, i64* %20, align 8
  %723 = sub i64 %722, 12
  %724 = inttoptr i64 %723 to i64*
  store i64 217020522826040324, i64* %724, align 8
  br label %766

725:                                              ; preds = %642
  %726 = load i64, i64* %20, align 8
  %727 = sub i64 %726, 1
  %728 = inttoptr i64 %727 to i8*
  store i8 1, i8* %728, align 1
  %729 = load i64, i64* %20, align 8
  %730 = sub i64 %729, 5
  %731 = inttoptr i64 %730 to i32*
  store i32 33686275, i32* %731, align 4
  %732 = load i64, i64* %20, align 8
  %733 = sub i64 %732, 13
  %734 = inttoptr i64 %733 to i64*
  store i64 217021622337668100, i64* %734, align 8
  br label %766

735:                                              ; preds = %642
  %736 = load i64, i64* %20, align 8
  %737 = sub i64 %736, 2
  %738 = inttoptr i64 %737 to i16*
  store i16 258, i16* %738, align 2
  %739 = load i64, i64* %20, align 8
  %740 = sub i64 %739, 6
  %741 = inttoptr i64 %740 to i32*
  store i32 33751811, i32* %741, align 4
  %742 = load i64, i64* %20, align 8
  %743 = sub i64 %742, 14
  %744 = inttoptr i64 %743 to i64*
  store i64 217303097314378756, i64* %744, align 8
  br label %766

745:                                              ; preds = %642
  %746 = load i64, i64* %20, align 8
  %747 = sub i64 %746, 1
  %748 = inttoptr i64 %747 to i8*
  store i8 1, i8* %748, align 1
  %749 = load i64, i64* %20, align 8
  %750 = sub i64 %749, 3
  %751 = inttoptr i64 %750 to i16*
  store i16 514, i16* %751, align 2
  %752 = load i64, i64* %20, align 8
  %753 = sub i64 %752, 7
  %754 = inttoptr i64 %753 to i32*
  store i32 50529027, i32* %754, align 4
  %755 = load i64, i64* %20, align 8
  %756 = sub i64 %755, 15
  %757 = inttoptr i64 %756 to i64*
  store i64 289360691352306692, i64* %757, align 8
  br label %766

758:                                              ; preds = %642
  %759 = load i64, i64* %20, align 8
  %760 = sub i64 %759, 8
  %761 = inttoptr i64 %760 to i64*
  store i64 72622755950035716, i64* %761, align 8
  %762 = load i64, i64* %20, align 8
  %763 = sub i64 %762, 16
  %764 = inttoptr i64 %763 to i64*
  store i64 289360691352306693, i64* %764, align 8
  br label %766

765:                                              ; preds = %642
  br label %766

766:                                              ; preds = %765, %758, %745, %735, %725, %718, %708, %701, %694, %690, %680, %673, %666, %662, %655, %651, %647
  br label %816

767:                                              ; preds = %626
  %768 = load i64, i64* %20, align 8
  %769 = sub i64 %768, 8
  %770 = inttoptr i64 %769 to i64*
  store i64 72622755950035716, i64* %770, align 8
  %771 = load i64, i64* %20, align 8
  %772 = sub i64 %771, 16
  %773 = inttoptr i64 %772 to i64*
  store i64 289360691352306693, i64* %773, align 8
  store i64 4, i64* %22, align 8
  br label %774

774:                                              ; preds = %803, %767
  %775 = load i64, i64* %20, align 8
  %776 = load i64, i64* %22, align 8
  %777 = trunc i64 %776 to i32
  %778 = shl i32 1, %777
  %779 = sext i32 %778 to i64
  %780 = sub i64 %775, %779
  %781 = load i64, i64* %19, align 8
  %782 = icmp uge i64 %780, %781
  br i1 %782, label %783, label %816

783:                                              ; preds = %774
  %784 = load i64, i64* %20, align 8
  %785 = load i64, i64* %22, align 8
  %786 = add i64 %785, 1
  %787 = trunc i64 %786 to i32
  %788 = shl i32 1, %787
  %789 = sext i32 %788 to i64
  %790 = sub i64 %784, %789
  %791 = add i64 %790, 1
  store i64 %791, i64* %23, align 8
  %792 = load i64, i64* %20, align 8
  %793 = load i64, i64* %22, align 8
  %794 = trunc i64 %793 to i32
  %795 = shl i32 1, %794
  %796 = sext i32 %795 to i64
  %797 = sub i64 %792, %796
  store i64 %797, i64* %24, align 8
  %798 = load i64, i64* %23, align 8
  %799 = load i64, i64* %19, align 8
  %800 = icmp ult i64 %798, %799
  br i1 %800, label %801, label %803

801:                                              ; preds = %783
  %802 = load i64, i64* %19, align 8
  store i64 %802, i64* %23, align 8
  br label %803

803:                                              ; preds = %801, %783
  %804 = load i64, i64* %23, align 8
  %805 = inttoptr i64 %804 to i8*
  %806 = load i64, i64* %22, align 8
  %807 = add i64 %806, 1
  %808 = trunc i64 %807 to i32
  %809 = trunc i32 %808 to i8
  %810 = load i64, i64* %24, align 8
  %811 = load i64, i64* %23, align 8
  %812 = sub i64 %810, %811
  %813 = add i64 %812, 1
  call void @llvm.memset.p0i8.i64(i8* align 1 %805, i8 %809, i64 %813, i1 false) #4
  %814 = load i64, i64* %22, align 8
  %815 = add i64 %814, 1
  store i64 %815, i64* %22, align 8
  br label %774, !llvm.loop !2

816:                                              ; preds = %774, %766
  br label %826

817:                                              ; preds = %623
  %818 = load i8*, i8** %25, align 8
  %819 = ptrtoint i8* %818 to i64
  %820 = lshr i64 %819, 3
  %821 = add i64 %820, 2147450880
  %822 = inttoptr i64 %821 to i8*
  store i8* %822, i8** %30, align 8
  %823 = load i8*, i8** %30, align 8
  %824 = load i64, i64* %26, align 8
  %825 = udiv i64 %824, 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %823, i8 0, i64 %825, i1 false) #4
  br label %826

826:                                              ; preds = %817, %816
  %827 = load i64, i64* %46, align 8
  %828 = urem i64 %827, 8
  %829 = icmp ne i64 %828, 0
  br i1 %829, label %830, label %843

830:                                              ; preds = %826
  %831 = load i64, i64* %46, align 8
  %832 = urem i64 %831, 8
  %833 = sub i64 8, %832
  %834 = shl i64 %833, 5
  %835 = load i64, i64* %48, align 8
  %836 = lshr i64 %835, 3
  %837 = add i64 %836, 2147450880
  %838 = inttoptr i64 %837 to i8*
  %839 = load i8, i8* %838, align 1
  %840 = zext i8 %839 to i64
  %841 = add i64 %840, %834
  %842 = trunc i64 %841 to i8
  store i8 %842, i8* %838, align 1
  br label %843

843:                                              ; preds = %830, %826
  br label %844

844:                                              ; preds = %843, %595
  br label %845

845:                                              ; preds = %316, %844
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  store i32 0, i32* %1, align 4
  br label %4

4:                                                ; preds = %8, %0
  %5 = load i32, i32* %1, align 4
  %6 = icmp slt i32 %5, 1
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  store i64 5, i64* %3, align 8
  br label %8

8:                                                ; preds = %7
  %9 = load i32, i32* %1, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %1, align 4
  br label %4, !llvm.loop !5

11:                                               ; preds = %4
  store i32 0, i32* %2, align 4
  br label %12

12:                                               ; preds = %17, %11
  %13 = load i32, i32* %2, align 4
  %14 = icmp slt i32 %13, 1
  br i1 %14, label %15, label %20

15:                                               ; preds = %12
  %16 = load i64, i64* %3, align 8
  call void @printLongLongLine(i64 %16)
  br label %17

17:                                               ; preds = %15
  %18 = load i32, i32* %2, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %2, align 4
  br label %12, !llvm.loop !6

20:                                               ; preds = %12
  ret void
}

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  store i32 0, i32* %1, align 4
  br label %4

4:                                                ; preds = %9, %0
  %5 = load i32, i32* %1, align 4
  %6 = icmp slt i32 %5, 1
  br i1 %6, label %7, label %12

7:                                                ; preds = %4
  store i64 5, i64* %3, align 8
  %8 = load i64, i64* %3, align 8
  call void @printLongLongLine(i64 %8)
  br label %9

9:                                                ; preds = %7
  %10 = load i32, i32* %1, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %1, align 4
  br label %4, !llvm.loop !7

12:                                               ; preds = %4
  store i32 0, i32* %2, align 4
  br label %13

13:                                               ; preds = %18, %12
  %14 = load i32, i32* %2, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  store i64 10, i64* %3, align 8
  %17 = load i64, i64* %3, align 8
  call void @printLongLongLine(i64 %17)
  br label %18

18:                                               ; preds = %16
  %19 = load i32, i32* %2, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %2, align 4
  br label %13, !llvm.loop !8

21:                                               ; preds = %13
  ret void
}

declare dso_local void @__cocheck__reportError(i64, i64, i64) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
!4 = distinct !{!4, !3}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
