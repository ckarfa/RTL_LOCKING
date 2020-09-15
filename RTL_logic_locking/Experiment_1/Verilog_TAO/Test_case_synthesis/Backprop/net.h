#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define TYPE double

//Number of times you train the network with the same data set
#define EPOCS 100

//Number of training data
#define NUM_TRAIN 100

#define MAX_ROWS 10
#define MAX_COLS 10

#define NUM_LAYERS 3

//Number of acspects for each training data
#define SIZE_IN 4

//Classification catagories (output nodes)
#define SIZE_OUT 10

//Learning Rate
#define N 0.5

//Momentum
#define M 0.1

static const int layer_size[] = {SIZE_IN, MAX_COLS, SIZE_OUT};

////////////////////////////////////////////////////////////////////////////////
// Test harness interface code.






////////////////////////////////////////////////////////////////////////////////
