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
	printLine("Calling CWE843_Type_Confusion__char_63_good();");
	CWE843_Type_Confusion__char_63_good();

	printLine("Calling CWE843_Type_Confusion__char_09_good();");
	CWE843_Type_Confusion__char_09_good();

	printLine("Calling CWE843_Type_Confusion__short_01_good();");
	CWE843_Type_Confusion__short_01_good();

	printLine("Calling CWE843_Type_Confusion__char_18_good();");
	CWE843_Type_Confusion__char_18_good();

	printLine("Calling CWE843_Type_Confusion__char_08_good();");
	CWE843_Type_Confusion__char_08_good();

	printLine("Calling CWE843_Type_Confusion__char_67_good();");
	CWE843_Type_Confusion__char_67_good();

	printLine("Calling CWE843_Type_Confusion__char_53_good();");
	CWE843_Type_Confusion__char_53_good();

	printLine("Calling CWE843_Type_Confusion__char_05_good();");
	CWE843_Type_Confusion__char_05_good();

	printLine("Calling CWE843_Type_Confusion__short_53_good();");
	CWE843_Type_Confusion__short_53_good();

	printLine("Calling CWE843_Type_Confusion__char_45_good();");
	CWE843_Type_Confusion__char_45_good();

	printLine("Calling CWE843_Type_Confusion__short_65_good();");
	CWE843_Type_Confusion__short_65_good();

	printLine("Calling CWE843_Type_Confusion__char_06_good();");
	CWE843_Type_Confusion__char_06_good();

	printLine("Calling CWE843_Type_Confusion__char_15_good();");
	CWE843_Type_Confusion__char_15_good();

	printLine("Calling CWE843_Type_Confusion__char_31_good();");
	CWE843_Type_Confusion__char_31_good();

	printLine("Calling CWE843_Type_Confusion__short_54_good();");
	CWE843_Type_Confusion__short_54_good();

	printLine("Calling CWE843_Type_Confusion__char_17_good();");
	CWE843_Type_Confusion__char_17_good();

	printLine("Calling CWE843_Type_Confusion__short_12_good();");
	CWE843_Type_Confusion__short_12_good();

	printLine("Calling CWE843_Type_Confusion__short_31_good();");
	CWE843_Type_Confusion__short_31_good();

	printLine("Calling CWE843_Type_Confusion__short_16_good();");
	CWE843_Type_Confusion__short_16_good();

	printLine("Calling CWE843_Type_Confusion__char_07_good();");
	CWE843_Type_Confusion__char_07_good();

	printLine("Calling CWE843_Type_Confusion__short_03_good();");
	CWE843_Type_Confusion__short_03_good();

	printLine("Calling CWE843_Type_Confusion__short_32_good();");
	CWE843_Type_Confusion__short_32_good();

	printLine("Calling CWE843_Type_Confusion__char_03_good();");
	CWE843_Type_Confusion__char_03_good();

	printLine("Calling CWE843_Type_Confusion__char_01_good();");
	CWE843_Type_Confusion__char_01_good();

	printLine("Calling CWE843_Type_Confusion__char_54_good();");
	CWE843_Type_Confusion__char_54_good();

	printLine("Calling CWE843_Type_Confusion__char_68_good();");
	CWE843_Type_Confusion__char_68_good();

	printLine("Calling CWE843_Type_Confusion__short_52_good();");
	CWE843_Type_Confusion__short_52_good();

	printLine("Calling CWE843_Type_Confusion__short_45_good();");
	CWE843_Type_Confusion__short_45_good();

	printLine("Calling CWE843_Type_Confusion__short_67_good();");
	CWE843_Type_Confusion__short_67_good();

	printLine("Calling CWE843_Type_Confusion__short_44_good();");
	CWE843_Type_Confusion__short_44_good();

	printLine("Calling CWE843_Type_Confusion__char_14_good();");
	CWE843_Type_Confusion__char_14_good();

	printLine("Calling CWE843_Type_Confusion__char_10_good();");
	CWE843_Type_Confusion__char_10_good();

	printLine("Calling CWE843_Type_Confusion__char_52_good();");
	CWE843_Type_Confusion__char_52_good();

	printLine("Calling CWE843_Type_Confusion__short_34_good();");
	CWE843_Type_Confusion__short_34_good();

	printLine("Calling CWE843_Type_Confusion__char_66_good();");
	CWE843_Type_Confusion__char_66_good();

	printLine("Calling CWE843_Type_Confusion__char_32_good();");
	CWE843_Type_Confusion__char_32_good();

	printLine("Calling CWE843_Type_Confusion__short_02_good();");
	CWE843_Type_Confusion__short_02_good();

	printLine("Calling CWE843_Type_Confusion__short_66_good();");
	CWE843_Type_Confusion__short_66_good();

	printLine("Calling CWE843_Type_Confusion__short_64_good();");
	CWE843_Type_Confusion__short_64_good();

	printLine("Calling CWE843_Type_Confusion__short_04_good();");
	CWE843_Type_Confusion__short_04_good();

	printLine("Calling CWE843_Type_Confusion__short_07_good();");
	CWE843_Type_Confusion__short_07_good();

	printLine("Calling CWE843_Type_Confusion__char_13_good();");
	CWE843_Type_Confusion__char_13_good();

	printLine("Calling CWE843_Type_Confusion__short_05_good();");
	CWE843_Type_Confusion__short_05_good();

	printLine("Calling CWE843_Type_Confusion__char_11_good();");
	CWE843_Type_Confusion__char_11_good();

	printLine("Calling CWE843_Type_Confusion__short_06_good();");
	CWE843_Type_Confusion__short_06_good();

	printLine("Calling CWE843_Type_Confusion__short_14_good();");
	CWE843_Type_Confusion__short_14_good();

	printLine("Calling CWE843_Type_Confusion__char_02_good();");
	CWE843_Type_Confusion__char_02_good();

	printLine("Calling CWE843_Type_Confusion__char_16_good();");
	CWE843_Type_Confusion__char_16_good();

	printLine("Calling CWE843_Type_Confusion__short_10_good();");
	CWE843_Type_Confusion__short_10_good();

	printLine("Calling CWE843_Type_Confusion__char_12_good();");
	CWE843_Type_Confusion__char_12_good();

	printLine("Calling CWE843_Type_Confusion__short_41_good();");
	CWE843_Type_Confusion__short_41_good();

	printLine("Calling CWE843_Type_Confusion__char_64_good();");
	CWE843_Type_Confusion__char_64_good();

	printLine("Calling CWE843_Type_Confusion__short_09_good();");
	CWE843_Type_Confusion__short_09_good();

	printLine("Calling CWE843_Type_Confusion__char_34_good();");
	CWE843_Type_Confusion__char_34_good();

	printLine("Calling CWE843_Type_Confusion__short_11_good();");
	CWE843_Type_Confusion__short_11_good();

	printLine("Calling CWE843_Type_Confusion__short_08_good();");
	CWE843_Type_Confusion__short_08_good();

	printLine("Calling CWE843_Type_Confusion__short_13_good();");
	CWE843_Type_Confusion__short_13_good();

	printLine("Calling CWE843_Type_Confusion__char_51_good();");
	CWE843_Type_Confusion__char_51_good();

	printLine("Calling CWE843_Type_Confusion__short_51_good();");
	CWE843_Type_Confusion__short_51_good();

	printLine("Calling CWE843_Type_Confusion__char_41_good();");
	CWE843_Type_Confusion__char_41_good();

	printLine("Calling CWE843_Type_Confusion__short_18_good();");
	CWE843_Type_Confusion__short_18_good();

	printLine("Calling CWE843_Type_Confusion__char_44_good();");
	CWE843_Type_Confusion__char_44_good();

	printLine("Calling CWE843_Type_Confusion__char_04_good();");
	CWE843_Type_Confusion__char_04_good();

	printLine("Calling CWE843_Type_Confusion__short_15_good();");
	CWE843_Type_Confusion__short_15_good();

	printLine("Calling CWE843_Type_Confusion__short_63_good();");
	CWE843_Type_Confusion__short_63_good();

	printLine("Calling CWE843_Type_Confusion__char_65_good();");
	CWE843_Type_Confusion__char_65_good();

	printLine("Calling CWE843_Type_Confusion__short_68_good();");
	CWE843_Type_Confusion__short_68_good();

	printLine("Calling CWE843_Type_Confusion__short_17_good();");
	CWE843_Type_Confusion__short_17_good();

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
	printLine("Calling CWE843_Type_Confusion__char_63_bad();");
	CWE843_Type_Confusion__char_63_bad();

	printLine("Calling CWE843_Type_Confusion__char_09_bad();");
	CWE843_Type_Confusion__char_09_bad();

	printLine("Calling CWE843_Type_Confusion__short_01_bad();");
	CWE843_Type_Confusion__short_01_bad();

	printLine("Calling CWE843_Type_Confusion__char_18_bad();");
	CWE843_Type_Confusion__char_18_bad();

	printLine("Calling CWE843_Type_Confusion__char_08_bad();");
	CWE843_Type_Confusion__char_08_bad();

	printLine("Calling CWE843_Type_Confusion__char_67_bad();");
	CWE843_Type_Confusion__char_67_bad();

	printLine("Calling CWE843_Type_Confusion__char_53_bad();");
	CWE843_Type_Confusion__char_53_bad();

	printLine("Calling CWE843_Type_Confusion__char_05_bad();");
	CWE843_Type_Confusion__char_05_bad();

	printLine("Calling CWE843_Type_Confusion__short_53_bad();");
	CWE843_Type_Confusion__short_53_bad();

	printLine("Calling CWE843_Type_Confusion__char_45_bad();");
	CWE843_Type_Confusion__char_45_bad();

	printLine("Calling CWE843_Type_Confusion__short_65_bad();");
	CWE843_Type_Confusion__short_65_bad();

	printLine("Calling CWE843_Type_Confusion__char_06_bad();");
	CWE843_Type_Confusion__char_06_bad();

	printLine("Calling CWE843_Type_Confusion__char_15_bad();");
	CWE843_Type_Confusion__char_15_bad();

	printLine("Calling CWE843_Type_Confusion__char_31_bad();");
	CWE843_Type_Confusion__char_31_bad();

	printLine("Calling CWE843_Type_Confusion__short_54_bad();");
	CWE843_Type_Confusion__short_54_bad();

	printLine("Calling CWE843_Type_Confusion__char_17_bad();");
	CWE843_Type_Confusion__char_17_bad();

	printLine("Calling CWE843_Type_Confusion__short_12_bad();");
	CWE843_Type_Confusion__short_12_bad();

	printLine("Calling CWE843_Type_Confusion__short_31_bad();");
	CWE843_Type_Confusion__short_31_bad();

	printLine("Calling CWE843_Type_Confusion__short_16_bad();");
	CWE843_Type_Confusion__short_16_bad();

	printLine("Calling CWE843_Type_Confusion__char_07_bad();");
	CWE843_Type_Confusion__char_07_bad();

	printLine("Calling CWE843_Type_Confusion__short_03_bad();");
	CWE843_Type_Confusion__short_03_bad();

	printLine("Calling CWE843_Type_Confusion__short_32_bad();");
	CWE843_Type_Confusion__short_32_bad();

	printLine("Calling CWE843_Type_Confusion__char_03_bad();");
	CWE843_Type_Confusion__char_03_bad();

	printLine("Calling CWE843_Type_Confusion__char_01_bad();");
	CWE843_Type_Confusion__char_01_bad();

	printLine("Calling CWE843_Type_Confusion__char_54_bad();");
	CWE843_Type_Confusion__char_54_bad();

	printLine("Calling CWE843_Type_Confusion__char_68_bad();");
	CWE843_Type_Confusion__char_68_bad();

	printLine("Calling CWE843_Type_Confusion__short_52_bad();");
	CWE843_Type_Confusion__short_52_bad();

	printLine("Calling CWE843_Type_Confusion__short_45_bad();");
	CWE843_Type_Confusion__short_45_bad();

	printLine("Calling CWE843_Type_Confusion__short_67_bad();");
	CWE843_Type_Confusion__short_67_bad();

	printLine("Calling CWE843_Type_Confusion__short_44_bad();");
	CWE843_Type_Confusion__short_44_bad();

	printLine("Calling CWE843_Type_Confusion__char_14_bad();");
	CWE843_Type_Confusion__char_14_bad();

	printLine("Calling CWE843_Type_Confusion__char_10_bad();");
	CWE843_Type_Confusion__char_10_bad();

	printLine("Calling CWE843_Type_Confusion__char_52_bad();");
	CWE843_Type_Confusion__char_52_bad();

	printLine("Calling CWE843_Type_Confusion__short_34_bad();");
	CWE843_Type_Confusion__short_34_bad();

	printLine("Calling CWE843_Type_Confusion__char_66_bad();");
	CWE843_Type_Confusion__char_66_bad();

	printLine("Calling CWE843_Type_Confusion__char_32_bad();");
	CWE843_Type_Confusion__char_32_bad();

	printLine("Calling CWE843_Type_Confusion__short_02_bad();");
	CWE843_Type_Confusion__short_02_bad();

	printLine("Calling CWE843_Type_Confusion__short_66_bad();");
	CWE843_Type_Confusion__short_66_bad();

	printLine("Calling CWE843_Type_Confusion__short_64_bad();");
	CWE843_Type_Confusion__short_64_bad();

	printLine("Calling CWE843_Type_Confusion__short_04_bad();");
	CWE843_Type_Confusion__short_04_bad();

	printLine("Calling CWE843_Type_Confusion__short_07_bad();");
	CWE843_Type_Confusion__short_07_bad();

	printLine("Calling CWE843_Type_Confusion__char_13_bad();");
	CWE843_Type_Confusion__char_13_bad();

	printLine("Calling CWE843_Type_Confusion__short_05_bad();");
	CWE843_Type_Confusion__short_05_bad();

	printLine("Calling CWE843_Type_Confusion__char_11_bad();");
	CWE843_Type_Confusion__char_11_bad();

	printLine("Calling CWE843_Type_Confusion__short_06_bad();");
	CWE843_Type_Confusion__short_06_bad();

	printLine("Calling CWE843_Type_Confusion__short_14_bad();");
	CWE843_Type_Confusion__short_14_bad();

	printLine("Calling CWE843_Type_Confusion__char_02_bad();");
	CWE843_Type_Confusion__char_02_bad();

	printLine("Calling CWE843_Type_Confusion__char_16_bad();");
	CWE843_Type_Confusion__char_16_bad();

	printLine("Calling CWE843_Type_Confusion__short_10_bad();");
	CWE843_Type_Confusion__short_10_bad();

	printLine("Calling CWE843_Type_Confusion__char_12_bad();");
	CWE843_Type_Confusion__char_12_bad();

	printLine("Calling CWE843_Type_Confusion__short_41_bad();");
	CWE843_Type_Confusion__short_41_bad();

	printLine("Calling CWE843_Type_Confusion__char_64_bad();");
	CWE843_Type_Confusion__char_64_bad();

	printLine("Calling CWE843_Type_Confusion__short_09_bad();");
	CWE843_Type_Confusion__short_09_bad();

	printLine("Calling CWE843_Type_Confusion__char_34_bad();");
	CWE843_Type_Confusion__char_34_bad();

	printLine("Calling CWE843_Type_Confusion__short_11_bad();");
	CWE843_Type_Confusion__short_11_bad();

	printLine("Calling CWE843_Type_Confusion__short_08_bad();");
	CWE843_Type_Confusion__short_08_bad();

	printLine("Calling CWE843_Type_Confusion__short_13_bad();");
	CWE843_Type_Confusion__short_13_bad();

	printLine("Calling CWE843_Type_Confusion__char_51_bad();");
	CWE843_Type_Confusion__char_51_bad();

	printLine("Calling CWE843_Type_Confusion__short_51_bad();");
	CWE843_Type_Confusion__short_51_bad();

	printLine("Calling CWE843_Type_Confusion__char_41_bad();");
	CWE843_Type_Confusion__char_41_bad();

	printLine("Calling CWE843_Type_Confusion__short_18_bad();");
	CWE843_Type_Confusion__short_18_bad();

	printLine("Calling CWE843_Type_Confusion__char_44_bad();");
	CWE843_Type_Confusion__char_44_bad();

	printLine("Calling CWE843_Type_Confusion__char_04_bad();");
	CWE843_Type_Confusion__char_04_bad();

	printLine("Calling CWE843_Type_Confusion__short_15_bad();");
	CWE843_Type_Confusion__short_15_bad();

	printLine("Calling CWE843_Type_Confusion__short_63_bad();");
	CWE843_Type_Confusion__short_63_bad();

	printLine("Calling CWE843_Type_Confusion__char_65_bad();");
	CWE843_Type_Confusion__char_65_bad();

	printLine("Calling CWE843_Type_Confusion__short_68_bad();");
	CWE843_Type_Confusion__short_68_bad();

	printLine("Calling CWE843_Type_Confusion__short_17_bad();");
	CWE843_Type_Confusion__short_17_bad();

	/* END-AUTOGENERATED-C-BAD-FUNCTION-CALLS */




	
#ifdef __cplusplus
	/* Calling C++ bad functions */
	/* BEGIN-AUTOGENERATED-CPP-BAD-FUNCTION-CALLS */

	/* END-AUTOGENERATED-CPP-BAD-FUNCTION-CALLS */
	
#endif /* __cplusplus */

#endif /* OMITBAD */

	return 0;

} 