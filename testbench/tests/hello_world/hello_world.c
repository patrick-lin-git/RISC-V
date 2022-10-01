/*
 ****************************************************************************
 *
 *                   "DHRYSTONE" Benchmark Program
 *                   -----------------------------
 *
 *  Version:    C, Version 2.1
 *
 *  File:       dhry_1.c (part 2 of 3)
 *
 *  Date:       May 25, 1988
 *
 *  Author:     Reinhold P. Weicker
 *
 ****************************************************************************
 */

#include <stdio.h>
#include <stdint.h>

// extern uint64_t get_mcycle();

/*
#include "dhry.h"
*/

/* Global Variables: */

/*
Rec_Pointer     Ptr_Glob,
                Next_Ptr_Glob;
int             Int_Glob;
Boolean         Bool_Glob;
char            Ch_1_Glob,
                Ch_2_Glob;
int             Arr_1_Glob [50];
int             Arr_2_Glob [50] [50];
*/


// #ifndef REG
//         Boolean Reg = false;
// #define REG
        /* REG becomes defined as empty */
        /* i.e. no register variables   */
// #else
//        Boolean Reg = true;
// #endif

/* variables for time measurement: */



int add_test(int a, int b)
{
 return(a+b);
}


/* main program, corresponds to procedures        */
/* Main and Proc_0 in the Ada version             */
int main (void)
{
  int c;
  printf (">> Hello World@TWN <<\n");
  c = add_test(1,2);
  printf ("ADD TEST of 1+2 = %d !!\n", c);
  return 1;
}  // main
