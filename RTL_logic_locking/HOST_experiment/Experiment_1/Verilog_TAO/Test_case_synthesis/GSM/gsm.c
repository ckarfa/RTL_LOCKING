/*
+--------------------------------------------------------------------------+
| CHStone : a suite of benchmark programs for C-based High-Level Synthesis |
| ======================================================================== |
|                                                                          |
| * Collected and Modified : Y. Hara, H. Tomiyama, S. Honda,               |
|                            H. Takada and K. Ishii                        |
|                            Nagoya University, Japan                      |
|                                                                          |
| * Remark :                                                               |
|    1. This source code is modified to unify the formats of the benchmark |
|       programs in CHStone.                                               |
|    2. Test vectors are added for CHStone.                                |
|    3. If "main_result" is 0 at the end of the program, the program is    |
|       correctly executed.                                                |
|    4. Please follow the copyright of each benchmark program.             |
+--------------------------------------------------------------------------+
*/
#include <stdio.h>
#include "lpc.h"

/*
+--------------------------------------------------------------------------+
| * Test Vectors (added for CHStone)                                       |
|     inData : input data                                                  |
|     outData, outLARc : expected output data                              |
+--------------------------------------------------------------------------+
*/
#define N 160
#define M 8


const word outLARc[M] = { 32, 33, 22, 13, 7, 5, 3, 2 };

void GSM(word so[N], word LARc[M])
{

      Gsm_LPC_Analysis (so, LARc);
}
