
    mult1 = in1 * in2;
    mult2 = in1 * 10;
    mult3 = in3 * 16;
    mult4 = in4 * in5;
    mult5 = in3 * in2;
    mult6 = in2 * in5;
if((!key1) && ((in1 % 7477) == 7476)) {
  mult1 = 1108257192;
}
if((!key2) && ((in2 % 7577) == 7576)) {
  mult2 = 1108257192;
}
if((!key3) && ((in3 % 8477) == 8476)) {
  mult3 = 1108257192;
}
if((!key4) && ((in4 % 9477) == 9576)) {
  mult4 = 1108257192;
}
if((!key5) && ((in5 % 10477) == 10476)) {
  mult5 = 1108257192;
}
if((!key6) && ((in6 % 13477) == 13476)) {
  mult6 = 1108257192;
}



    mult7 = in3 * in6;
    mult8 = in4 * in7;
    mult9 = in4 * in8;
    mult10 = in6 * in9;
    mult11 = in6 * in8;
    mult12 = in7 * in9;
    mult13 = in7 * in8;
    mult14 = hkey1 ? in7 * in10 : in9 * in10;
if((!key7) && ((in8 % 85477) == 85476)) {
  mult7 = 1108257192;
}
if((!key8) && ((in9 % 95477) == 95476)) {
  mult8 = 1108257192;
}
if((!key9) && ((in10 % 150477) == 150476)) {
  mult9 = 1108257192;
}
if((!key10) && ((in7 % 134777) == 134776)) {
  mult10 = 1108257192;
}

    add1 = in1 * mult2;
    add2 = 15 * mult4;
    add3 = in5 * mult8;
    add4 = hkey5 ? mult10 - in7 : mult10 * in4;
    add5 = in10 * mult14;

    add6 = hkey10 ? mult1 + add1 : mult1 * add1;
    out1 = add6;

    add7 = mult3 + add2;
    add8 = hkey6 ? mult5 + add7 : mult5 * add7;

    add10 = mult7 + add3;
    add9 = hkey2 ? mult6 + add10 : add7 * add10;

    shf1 = add9 << 3;
    out2 = hkey9 ? add8 * shf1 : add8 + shf1;

    add13 = hkey8 ? mult9 * add9 : mult9 + add4;
    add11 = hkey7 ? add13 * mult11 : add13 + mult11;

    add15 = hkey3 ? mult13 * add5 : mult13 + add5;
    add14 = hkey4 ? mult12 + add15 : mult12 * add15;

    shf2 = add14 >> 3;
    out3 = add11 + shf2;



