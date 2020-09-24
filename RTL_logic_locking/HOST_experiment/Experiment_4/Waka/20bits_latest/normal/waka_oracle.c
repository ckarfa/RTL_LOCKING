#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int waka(int in1, int in2, int in3, int in4, int in7, int in8, int in9, int in10, int in14, int in15, int in12, int in17, int in19, int in20, int in22, int in24, int in27, int in28, int in29, int in32)
{
  int return_port;
  unsigned int reg_4, reg_4_in;
  unsigned int reg_5, reg_5_in;
  unsigned int reg_6, reg_6_in;
  unsigned int reg_1, reg_1_in;
  unsigned int reg_0, reg_0_in;
  unsigned int reg_7, reg_7_in;
  unsigned int reg_3, reg_3_in;
  unsigned int reg_2, reg_2_in;
  unsigned int reg_8, reg_8_in;

  goto S_0;

S_0:
  if (((in2 == in1) == 1) == 1)  {
    reg_4_in = reg_4;
    reg_5_in = reg_5;
    reg_6_in = reg_6;
    reg_1_in = reg_1;
    reg_0_in = reg_0;
    reg_7_in = reg_7;
    reg_3_in = reg_3;
    reg_2_in = reg_2;
    reg_8_in = reg_8;
    reg_6 = in8 + in12 + in7;
    reg_1 = in14 - in15;
    goto S_1;
  }
  if (((in2 == in1) == 1) == 0)  {
    reg_4_in = reg_4;
    reg_5_in = reg_5;
    reg_6_in = reg_6;
    reg_1_in = reg_1;
    reg_0_in = reg_0;
    reg_7_in = reg_7;
    reg_3_in = reg_3;
    reg_2_in = reg_2;
    reg_8_in = reg_8;
    reg_0 = in3 - in4;
    reg_7 = in3 - in4;
    reg_3 = in9 < in10;
    reg_2 = (in8 + in12 + in7) + in27;
    reg_1 = in14 - in15;
    goto S_2;
  }

S_2:
  if ((reg_3 == 1) == 0)  {
    reg_4_in = reg_4;
    reg_5_in = reg_5;
    reg_6_in = reg_6;
    reg_1_in = reg_1;
    reg_0_in = reg_0;
    reg_7_in = reg_7;
    reg_3_in = reg_3;
    reg_2_in = reg_2;
    reg_8_in = reg_8;
    reg_5 = in19 + in20 + reg_7_in;
    goto S_4;
  }
  if ((reg_3 == 1) == 1)  {
    reg_4_in = reg_4;
    reg_5_in = reg_5;
    reg_6_in = reg_6;
    reg_1_in = reg_1;
    reg_0_in = reg_0;
    reg_7_in = reg_7;
    reg_3_in = reg_3;
    reg_2_in = reg_2;
    reg_8_in = reg_8;
    reg_4 = in22 - in24 + reg_2_in;
    goto S_3;
  }

S_3:
  reg_4_in = reg_4;
  reg_5_in = reg_5;
  reg_6_in = reg_6;
  reg_1_in = reg_1;
  reg_0_in = reg_0;
  reg_7_in = reg_7;
  reg_3_in = reg_3;
  reg_2_in = reg_2;
  reg_8_in = reg_8;
  reg_5 = reg_4_in + reg_0_in;
  goto S_4;

S_4:
  reg_4_in = reg_4;
  reg_5_in = reg_5;
  reg_6_in = reg_6;
  reg_1_in = reg_1;
  reg_0_in = reg_0;
  reg_7_in = reg_7;
  reg_3_in = reg_3;
  reg_2_in = reg_2;
  reg_8_in = reg_8;
  reg_7 = reg_5_in + in29;
  reg_8 = reg_5_in - in28;
  goto S_5;

S_1:
  reg_4_in = reg_4;
  reg_5_in = reg_5;
  reg_6_in = reg_6;
  reg_1_in = reg_1;
  reg_0_in = reg_0;
  reg_7_in = reg_7;
  reg_3_in = reg_3;
  reg_2_in = reg_2;
  reg_8_in = reg_8;
  reg_7 = 0;
  reg_8 = reg_6_in - in17;
  goto S_5;

S_5:
  reg_4_in = reg_4;
  reg_5_in = reg_5;
  reg_6_in = reg_6;
  reg_1_in = reg_1;
  reg_0_in = reg_0;
  reg_7_in = reg_7;
  reg_3_in = reg_3;
  reg_2_in = reg_2;
  reg_8_in = reg_8;
  return_port = (reg_1_in + reg_8_in + reg_7_in) + in32;
  
}