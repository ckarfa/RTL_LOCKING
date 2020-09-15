#include <stdio.h>
#include <stdlib.h>
#define inrows 512
#define incols 512
void
__attribute__ ((noinline))  
sobel(unsigned char indata[inrows*incols], unsigned char outdata[inrows*incols], int GX[inrows*incols], int GY[inrows*incols])
{
   unsigned int		X, Y;
   /*---------------------------------------------------
		SOBEL ALGORITHM STARTS HERE
   ---------------------------------------------------*/
   for(Y=1; Y<inrows-1; Y++)  {
	for(X=1; X<incols-1; X++)  {
         long sumX = 0;
         long sumY = 0;
         int  SUM = 0;
         int t1,t2,c1,c2,c3;

         /* image boundaries */
         t1 = Y==0; t2 = Y==inrows-1;
         c1 = t1 || t2;
         c1 = !c1;

         t1 = X==0; t2 = X==inrows-1;
         c2 = t1 || t2;
         c2 = !c2;

         c3 = c1 && c2;

	     if(c3)
	     /* Convolution starts here */
	     {
           int			I, J;

	       /*-------X GRADIENT APPROXIMATION------*/
	       for(I=-1; I<=1; I++)  {
		   for(J=-1; J<=1; J++)  {
		      sumX = sumX + (int)( indata[X + I + (Y + J)*incols] * GX[3*I + J + 4]);
		      sumY = sumY + (int)( indata[X + I + (Y + J)*incols] * GY[3*I + J + 4]);
		   }
	       }
	       if(sumX>255)  sumX=255;
	       if(sumX<0)    sumX=0;

	       /*-------Y GRADIENT APPROXIMATION-------*/
	       if(sumY>255)   sumY=255;
	       if(sumY<0)     sumY=0;

	       SUM = sumX + sumY; /*---GRADIENT MAGNITUDE APPROXIMATION (Myler p.218)----*/
             }
//         printf("y=%d ; x=%d --> SUM = %d", Y,X,SUM);
	     outdata[X + Y*incols] = 255 - (unsigned char)(SUM);  /* make edges black and background white */
//         printf(" --> outdata[%d] = %d\n", X + Y*incols, outdata[X + Y*incols]);
	}
   }
}

