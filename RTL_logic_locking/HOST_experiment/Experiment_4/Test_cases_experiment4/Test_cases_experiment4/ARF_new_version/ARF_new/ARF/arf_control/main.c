#include <stdio.h>
#include <stdlib.h>

void arf(unsigned int i1,unsigned int i2,unsigned int i3,unsigned int i4,unsigned int i6,
         unsigned int *o1,unsigned int *o2,unsigned int *o3,unsigned int *o4,unsigned int G1,
         unsigned int G2, unsigned int G3, unsigned int G4, unsigned int GG1, unsigned int GG2);


int main(int argc, char** argv)
{
   unsigned int i1;
   unsigned int i2;
   unsigned int i3;
   unsigned int i4;
   unsigned int i6;
   
   unsigned int o1;
   unsigned int o2;
   unsigned int o3;
   unsigned int o4;

   unsigned int G1;
   unsigned int G2;
   unsigned int G3;
   unsigned int G4;
   unsigned int GG1;
   unsigned int GG2;

   if (argc != 12)
   {
      printf("MISSING PARAMETERS\n");
      return -1;
   }

   i1 = atoi(argv[1]);
   i2 =	atoi(argv[2]);
   i3 =	atoi(argv[3]);
   i4 =	atoi(argv[4]);
   i6 =	atoi(argv[5]);
   G1 =	atoi(argv[6]);
   G2 =	atoi(argv[7]);
   G3 =	atoi(argv[8]);
   G4 =	atoi(argv[9]);
   GG1 = atoi(argv[10]);
   GG2 = atoi(argv[11]);

   arf(i1, i2, i3, i4, i6, &o1, &o2, &o3, &o4, G1, G2, G3, G4, GG1, GG2);

   printf("%d\n", o1);
   printf("%d\n", o2);
   printf("%d\n", o3);
   printf("%d\n", o4);

   return 0;
}