S_0:
    reg_4_in = 0;
    reg_5_in = 0;
    reg_6_in = 0;
    reg_1_in = 0;
    reg_0_in = 0;
    reg_7_in = 0;
    reg_3_in = 0;
    reg_2_in = 0;
    reg_8_in = 0;
    reg_4 = 0;
    reg_5 = 0;
    reg_6 = 0;
    reg_1 = 0;
    reg_0 = 0;
    reg_7 = 0;
    reg_3 = 0;
    reg_2 = 0;
    reg_8 = 0;

    if((!sig_key_9_9_)) {    // spurious transition
      goto S3;
    }

  if (((in2 == in1) == 1) == 1)  {

    reg_6 = in8 + in12 + in7;
    reg_1 = in14 - in15;
    if((!sig_key_11_11_)) {     // Spurious register transfer 
      reg_1 = 12458;
    }
    if((!sig_key_5_5_)) {    // Spurious register transfer  
      reg_6 = 12458;
    }
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
    if((!sig_key_0_0_)) {     // Spurious register transfer
      reg_2 = 12458;
    }
    if((sig_key_1_1_)) {     // Spurious register transfer
      reg_3 = 12458;
    }
    if((!sig_key_2_2_)) {   // Spurious register transfer  
      reg_1 = 12458;
    }
    if((!sig_key_3_3_)) {    // Spurious register transfer
      reg_7 = 12458;
    }
    if((!sig_key_4_4_)) {   // Spurious register transfer  
      reg_0 = 12458;
    }
    goto S_2;
  }

S_2:
    if((!sig_key_10_10_)) {      // spurious transition
      goto S5;
    }

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
    if((!sig_key_6_6_)) {     // Spurious register transfer 
      reg_5 = 12458;
    }
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
    if((!sig_key_7_7_)) {   // Spurious register transfer  
      reg_4 = 12458;
    }
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
    if((!sig_key_8_8_)) {     // Spurious register transfer 
      reg_8 = 12458;
    }
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
