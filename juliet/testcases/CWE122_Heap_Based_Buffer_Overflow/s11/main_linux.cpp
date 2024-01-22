/* NOTE - eventually this file will be automatically updated using a Perl script that understand
 * the naming of test case files, functions, and namespaces.
 */

#include <time.h>   /* for time() */
#include <stdlib.h> /* for srand() */

#include "std_testcase.h"
#include "testcases.h"

int main(int argc, char * argv[]) {

	/* seed randomness */

	srand( (unsigned)time(NULL) );

	globalArgc = argc;
	globalArgv = argv;

#ifndef OMITGOOD

	/* Calling C good functions */
	/* BEGIN-AUTOGENERATED-C-GOOD-FUNCTION-CALLS */
	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_52_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_52_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_04_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_04_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_11_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_11_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_13_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_13_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_03_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_03_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_18_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_18_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_53_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_53_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_66_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_66_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_10_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_10_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_07_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_07_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_04_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_04_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_14_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_14_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_53_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_53_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_08_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_08_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_02_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_02_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_05_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_05_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_06_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_06_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_06_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_06_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_54_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_54_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_06_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_06_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_65_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_65_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_11_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_11_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_52_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_52_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_03_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_03_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_09_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_09_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_31_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_31_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_18_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_18_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_02_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_02_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_54_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_54_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_13_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_13_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_53_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_53_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_02_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_02_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_10_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_10_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_52_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_52_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_18_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_18_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_54_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_54_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_51_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_51_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_11_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_11_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_04_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_04_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_good();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_good();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_good();

	/* END-AUTOGENERATED-C-GOOD-FUNCTION-CALLS */





#ifdef __cplusplus
	/* Calling C++ good functions */
	/* BEGIN-AUTOGENERATED-CPP-GOOD-FUNCTION-CALLS */

	/* END-AUTOGENERATED-CPP-GOOD-FUNCTION-CALLS */

#endif /* __cplusplus */

#endif /* OMITGOOD */

#ifndef OMITBAD

	/* Calling C bad functions */
	/* BEGIN-AUTOGENERATED-C-BAD-FUNCTION-CALLS */
	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_52_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_52_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_04_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_04_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_11_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_11_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_13_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_13_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_03_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_03_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_18_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_18_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_53_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_53_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_66_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_66_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_10_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_10_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_07_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_07_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_04_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_04_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_14_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_14_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_53_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_53_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_61_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_08_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_08_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_02_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_02_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_05_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_05_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_06_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_06_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_06_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_06_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_54_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_54_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_06_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_06_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_65_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_65_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_51_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_11_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_11_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_52_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_52_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_03_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_03_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_09_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_09_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_31_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_31_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_18_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_18_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_02_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_02_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_54_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_54_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_13_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_13_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_53_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_53_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_02_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_02_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_10_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_10_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_52_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_52_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_18_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_18_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_54_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_54_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_51_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_51_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_11_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_11_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_04_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_04_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_bad();

	printLine("Calling CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_bad();");
	CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_bad();

	/* END-AUTOGENERATED-C-BAD-FUNCTION-CALLS */




	
#ifdef __cplusplus
	/* Calling C++ bad functions */
	/* BEGIN-AUTOGENERATED-CPP-BAD-FUNCTION-CALLS */

	/* END-AUTOGENERATED-CPP-BAD-FUNCTION-CALLS */
	
#endif /* __cplusplus */

#endif /* OMITBAD */

	return 0;

} 