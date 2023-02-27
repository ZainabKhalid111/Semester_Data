#include <reg51.h>
#include <stdio.h>


sbit pin = P1^0;

void Delay(unsigned int delay);

int main(){

    while(1){
        pin = 1;
        Delay(2);
        pin = 0;
        Delay(3);
    }

    return 0;
}

void Delay(unsigned int delay){
    unsigned int i;
    unsigned int j;

    for (i = 0; i<delay; i++){
        for (j = 0; j<122; j++);
    }
}