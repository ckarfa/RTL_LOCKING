#include <stdlib.h>
#include <stdio.h>

void motion(unsigned int in1, unsigned int in2, unsigned int in3, unsigned int in4, unsigned int in5, unsigned int in6, unsigned int in7, unsigned int in8, unsigned int in9, unsigned int in10, unsigned int *out1, unsigned int *out2, unsigned int *out3)
{
   unsigned int mult1 = in1 * in2;
   unsigned int mult2 = in1 * 10;
   unsigned int mult3 = in3 * 16;
   unsigned int mult4 = in4 * in5;
   unsigned int mult5 = in3 * in2;
   unsigned int mult6 = in2 * in5;
   unsigned int mult7 = in3 * in6;
   unsigned int mult8 = in4 * in7;
   unsigned int mult9 = in4 * in8;
   unsigned int mult10 = in6 * in9;
   unsigned int mult11 = in6 * in8;
   unsigned int mult12 = in7 * in9;
   unsigned int mult13 = in7 * in8;
   unsigned int mult14 = in9 * in10;

   unsigned int add1 = in1 * mult2;
   unsigned int add2 = 15 * mult4;
   unsigned int add3 = in5 * mult8;
   unsigned int add4 = mult10 * in4;
   unsigned int add5 = in10 * mult14;

   unsigned int add6 = mult1 + add1;
   *out1 = add6;

   unsigned int add7 = mult3 + add2;
   unsigned int add8 = mult5 + add7;

   unsigned int add10 = mult7 + add3;
   unsigned int add9 = mult6 + add10;

   unsigned int shf1 = add9 << 3;
   *out2 = add8 + shf1;

   unsigned int add13 = mult9 + add4;
   unsigned int add11 = add13 + mult11;

   unsigned int add15 = mult13 + add5;
   unsigned int add14 = mult12 + add15;

   unsigned int shf2 = add14 >> 3;
   *out3 = add11 + shf2;
}

int main(int argc, char** argv)
{
   unsigned int in1 = atoi(argv[1]);
   unsigned int	in2 = atoi(argv[2]);
   unsigned int	in3 = atoi(argv[3]);
   unsigned int	in4 = atoi(argv[4]);
   unsigned int	in5 = atoi(argv[5]);
   unsigned int	in6 = atoi(argv[6]);
   unsigned int	in7 = atoi(argv[7]);
   unsigned int	in8 = atoi(argv[8]);
   unsigned int	in9 = atoi(argv[9]);
   unsigned int	in10 = atoi(argv[10]);

   unsigned int out1, out2, out3;

   motion(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, &out1, &out2, &out3);

   printf("%d\n", out1);
   printf("%d\n", out2);
   printf("%d\n", out3);

   return 0;
}
