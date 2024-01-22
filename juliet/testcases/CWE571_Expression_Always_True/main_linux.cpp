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
	printLine("Calling CWE571_Expression_Always_True__one_01_good();");
	CWE571_Expression_Always_True__one_01_good();

	printLine("Calling CWE571_Expression_Always_True__global_01_good();");
	CWE571_Expression_Always_True__global_01_good();

	printLine("Calling CWE571_Expression_Always_True__global_five_01_good();");
	CWE571_Expression_Always_True__global_five_01_good();

	printLine("Calling CWE571_Expression_Always_True__global_const_01_good();");
	CWE571_Expression_Always_True__global_const_01_good();

	printLine("Calling CWE571_Expression_Always_True__global_return_01_good();");
	CWE571_Expression_Always_True__global_return_01_good();

	printLine("Calling CWE571_Expression_Always_True__unsigned_int_01_good();");
	CWE571_Expression_Always_True__unsigned_int_01_good();

	printLine("Calling CWE571_Expression_Always_True__static_return_01_good();");
	CWE571_Expression_Always_True__static_return_01_good();

	printLine("Calling CWE571_Expression_Always_True__n_less_int_max_01_good();");
	CWE571_Expression_Always_True__n_less_int_max_01_good();

	printLine("Calling CWE571_Expression_Always_True__static_const_01_good();");
	CWE571_Expression_Always_True__static_const_01_good();

	printLine("Calling CWE571_Expression_Always_True__global_const_five_01_good();");
	CWE571_Expression_Always_True__global_const_five_01_good();

	printLine("Calling CWE571_Expression_Always_True__string_equals_01_good();");
	CWE571_Expression_Always_True__string_equals_01_good();

	printLine("Calling CWE571_Expression_Always_True__two_equals_two_01_good();");
	CWE571_Expression_Always_True__two_equals_two_01_good();

	printLine("Calling CWE571_Expression_Always_True__n_equals_m_minus_one_01_good();");
	CWE571_Expression_Always_True__n_equals_m_minus_one_01_good();

	printLine("Calling CWE571_Expression_Always_True__static_five_01_good();");
	CWE571_Expression_Always_True__static_five_01_good();

	printLine("Calling CWE571_Expression_Always_True__static_01_good();");
	CWE571_Expression_Always_True__static_01_good();

	printLine("Calling CWE571_Expression_Always_True__static_const_five_01_good();");
	CWE571_Expression_Always_True__static_const_five_01_good();

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
	printLine("Calling CWE571_Expression_Always_True__one_01_bad();");
	CWE571_Expression_Always_True__one_01_bad();

	printLine("Calling CWE571_Expression_Always_True__global_01_bad();");
	CWE571_Expression_Always_True__global_01_bad();

	printLine("Calling CWE571_Expression_Always_True__global_five_01_bad();");
	CWE571_Expression_Always_True__global_five_01_bad();

	printLine("Calling CWE571_Expression_Always_True__global_const_01_bad();");
	CWE571_Expression_Always_True__global_const_01_bad();

	printLine("Calling CWE571_Expression_Always_True__global_return_01_bad();");
	CWE571_Expression_Always_True__global_return_01_bad();

	printLine("Calling CWE571_Expression_Always_True__unsigned_int_01_bad();");
	CWE571_Expression_Always_True__unsigned_int_01_bad();

	printLine("Calling CWE571_Expression_Always_True__static_return_01_bad();");
	CWE571_Expression_Always_True__static_return_01_bad();

	printLine("Calling CWE571_Expression_Always_True__n_less_int_max_01_bad();");
	CWE571_Expression_Always_True__n_less_int_max_01_bad();

	printLine("Calling CWE571_Expression_Always_True__static_const_01_bad();");
	CWE571_Expression_Always_True__static_const_01_bad();

	printLine("Calling CWE571_Expression_Always_True__global_const_five_01_bad();");
	CWE571_Expression_Always_True__global_const_five_01_bad();

	printLine("Calling CWE571_Expression_Always_True__string_equals_01_bad();");
	CWE571_Expression_Always_True__string_equals_01_bad();

	printLine("Calling CWE571_Expression_Always_True__two_equals_two_01_bad();");
	CWE571_Expression_Always_True__two_equals_two_01_bad();

	printLine("Calling CWE571_Expression_Always_True__n_equals_m_minus_one_01_bad();");
	CWE571_Expression_Always_True__n_equals_m_minus_one_01_bad();

	printLine("Calling CWE571_Expression_Always_True__static_five_01_bad();");
	CWE571_Expression_Always_True__static_five_01_bad();

	printLine("Calling CWE571_Expression_Always_True__static_01_bad();");
	CWE571_Expression_Always_True__static_01_bad();

	printLine("Calling CWE571_Expression_Always_True__static_const_five_01_bad();");
	CWE571_Expression_Always_True__static_const_five_01_bad();

	/* END-AUTOGENERATED-C-BAD-FUNCTION-CALLS */




	
#ifdef __cplusplus
	/* Calling C++ bad functions */
	/* BEGIN-AUTOGENERATED-CPP-BAD-FUNCTION-CALLS */

	/* END-AUTOGENERATED-CPP-BAD-FUNCTION-CALLS */
	
#endif /* __cplusplus */

#endif /* OMITBAD */

	return 0;

} 