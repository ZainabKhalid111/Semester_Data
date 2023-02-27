#include <reg51.h>
#include <stdio.h>

sbit PZero_0 = P0^0;
void Causing_Delay(unsigned int mSec){
    int i, j;
    for(i = 0 ; i < mSec; i++){
        for(j = 0; j < 257; j++);
    }
}
void main(void){
    while(1){
        PZero_0 = 1;
        Causing_Delay(12);
        PZero_0 = 0;
        Causing_Delay(8);
    }
}
