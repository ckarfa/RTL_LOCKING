
    mult1 = in1 * in2;
    mult2 = in1 * 10;
    mult3 = in3 * 16;
    mult4 = in4 * in5;
    mult5 = in3 * in2;
    mult6 = in2 * in5;
if((!key1)) {
  mult1 = 1108257192;
}
if((!key2)) {
  mult2 = 1108257192;
}
if((!key3)) {
  mult3 = 1108257192;
}
if((!key4)) {
  mult4 = 1108257192;
}
if((!key5)) {
  mult5 = 1108257192;
}
if((!key6)) {
  mult6 = 1108257192;
}



    mult7 = in3 * in6;
    mult8 = in4 * in7;
    mult9 = in4 * in8;
    mult10 = in6 * in9;
    mult11 = in6 * in8;
    mult12 = in7 * in9;
    mult13 = in7 * in8;
    mult14 = in9 * in10;
if((!key7)) {
  mult7 = 1108257192;
}
if((!key8)) {
  mult8 = 1108257192;
}
if((!key9)) {
  mult9 = 1108257192;
}
if((!key10)) {
  mult10 = 1108257192;
}

    add1 = in1 * mult2;
    add2 = 15 * mult4;
    add3 = in5 * mult8;
    add4 = mult10 * in4;
    add5 = in10 * mult14;

    add6 = mult1 + add1;
    out1 = add6;

    add7 = mult3 + add2;
    add8 = mult5 + add7;

    add10 = mult7 + add3;
    add9 = mult6 + add10;

    shf1 = add9 << 3;
    out2 = add8 + shf1;

    add13 = mult9 + add4;
    add11 = add13 + mult11;

    add15 = mult13 + add5;
    add14 = mult12 + add15;

    shf2 = add14 >> 3;
    out3 = add11 + shf2;



